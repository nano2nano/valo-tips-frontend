import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:valo_tips/model/ability/ability.dart';

class AbilityDropdownButton extends StatefulWidget {
  const AbilityDropdownButton({
    super.key,
    this.onChanged,
    required this.abilities,
  });
  final List<Ability> abilities;
  final ValueChanged<Ability?>? onChanged;

  @override
  State<AbilityDropdownButton> createState() => _AbilityDropdownButtonState();
}

class _AbilityDropdownButtonState extends State<AbilityDropdownButton> {
  final TextEditingController textEditingController = TextEditingController();
  Ability? selectedAbility;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: () {
          if (selectedAbility == null) {
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
            final ability = selectedAbility!;
            return Row(
              children: [
                Image.network(
                  ability.displayIcon ?? '',
                  width: 64,
                  height: 64,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    ability.displayName,
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
        items: widget.abilities
            .map((ability) => DropdownMenuItem(
                  value: ability,
                  child: Row(
                    children: [
                      Image.network(
                        ability.displayIcon ?? '',
                        width: 64,
                        height: 64,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          ability.displayName,
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
        onChanged: (Ability? value) {
          setState(() {
            selectedAbility = value;
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
