import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:valo_tips/model/agent/agent.dart';

class AgentDropdownButton extends StatefulWidget {
  const AgentDropdownButton({
    super.key,
    this.onChanged,
    required this.agents,
  });
  final List<Agent> agents;
  final ValueChanged<Agent?>? onChanged;

  @override
  State<AgentDropdownButton> createState() => _AgentDropdownButtonState();
}

class _AgentDropdownButtonState extends State<AgentDropdownButton> {
  final TextEditingController textEditingController = TextEditingController();
  Agent? selectedAgent;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: () {
          if (selectedAgent == null) {
            return Row(
              children: const [
                Icon(
                  Icons.list,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          } else {
            final agent = selectedAgent!;
            return Row(
              children: [
                Image.network(
                  agent.displayIcon,
                  width: 64,
                  height: 64,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    agent.displayName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            );
          }
        }(),
        items: widget.agents
            .map((agent) => DropdownMenuItem(
                  value: agent,
                  child: Row(
                    children: [
                      Image.network(
                        agent.displayIcon,
                        width: 64,
                        height: 64,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          agent.displayName,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList(),
        onChanged: (Agent? value) {
          setState(() {
            selectedAgent = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        searchController: textEditingController,
        searchInnerWidget: Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 4,
            right: 8,
            left: 8,
          ),
          child: TextFormField(
            controller: textEditingController,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              hintText: 'Search for an item...',
              hintStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        searchMatchFn: (item, searchValue) {
          return (item.value.toString().toLowerCase().contains(searchValue));
        },
      ),
    );
  }
}
