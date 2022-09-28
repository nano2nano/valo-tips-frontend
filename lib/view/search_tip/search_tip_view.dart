import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:valo_tips/model/ability/ability.dart';
import 'package:valo_tips/model/agent/agent.dart';
import 'package:valo_tips/model/stage/stage.dart';
import 'package:valo_tips/view/drawer/drawer.dart';
import 'package:valo_tips/view/search_tip/search_tip_view_model.dart';
import 'package:valo_tips/view/show_tips/show_tips_view.dart';

final languageProvider = StateProvider<String>((ref) {
  return 'ja-JP';
});

class SearchTipView extends HookConsumerWidget {
  const SearchTipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController agentController = useTextEditingController();
    final TextEditingController abilityController = useTextEditingController();
    final TextEditingController stageController = useTextEditingController();

    final selectedAgent = useState<Agent?>(null);
    final selectedAbility = useState<Ability?>(null);
    final selectedStage = useState<Stage?>(null);

    final language = ref.watch(languageProvider.state);

    final searchTipViewModel =
        ref.watch(searchTipViewModelProvider(language.state));

    final canPushButton = (selectedAgent.value != null &&
        selectedAbility.value != null &&
        selectedStage.value != null);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Tip'),
      ),
      drawer: const MyDrawer(),
      body: searchTipViewModel.when(
        data: (data) {
          final agents = data[0] as List<Agent>;
          final stages = data[1] as List<Stage>;

          return Center(
            child: Column(children: [
              Column(
                children: [
                  const Text('Agent', style: TextStyle(fontSize: 24)),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: () {
                        if (selectedAgent.value == null) {
                          return const UnselectedDropdown(text: 'Select Agent');
                        } else {
                          final agent = selectedAgent.value!;
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
                      items: agents
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
                        selectedAgent.value = value;
                        selectedAbility.value = null;
                      },
                      searchController: agentController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: agentController,
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
                        return (item.value
                            .toString()
                            .toLowerCase()
                            .contains(searchValue));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Ability', style: TextStyle(fontSize: 24)),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: () {
                        if (selectedAgent.value == null) {
                          return const UnselectedDropdown(text: 'Select Agent');
                        } else if (selectedAbility.value == null) {
                          return const UnselectedDropdown(
                              text: 'Select Ability');
                        } else {
                          assert(selectedAgent.value != null);
                          assert(selectedAbility.value != null);
                          final ability = selectedAbility.value!;
                          return Row(
                            children: [
                              Container(
                                width: 64,
                                height: 64,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.network(
                                  ability.displayIcon ?? '',
                                  width: 64,
                                  height: 64,
                                ),
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
                      items: selectedAgent.value?.abilities
                          .map((ability) => DropdownMenuItem(
                                value: ability,
                                child: Row(
                                  children: [
                                    // with background color
                                    Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Image.network(
                                        ability.displayIcon ?? '',
                                        width: 64,
                                        height: 64,
                                      ),
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
                        selectedAbility.value = value;
                      },
                      searchController: abilityController,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          controller: abilityController,
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
                        return (item.value
                            .toString()
                            .toLowerCase()
                            .contains(searchValue));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('Stage', style: TextStyle(fontSize: 24)),
              DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isExpanded: true,
                  hint: () {
                    if (selectedStage.value == null) {
                      return const UnselectedDropdown(text: 'Select a stage');
                    } else {
                      final stage = selectedStage.value!;
                      return Stack(
                        children: [
                          Image(image: NetworkImage(stage.listViewIcon)),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200.withOpacity(0.5),
                            ),
                            child: Text(stage.displayName),
                          )
                        ],
                      );
                    }
                  }(),
                  items: stages
                      .map((stage) => DropdownMenuItem(
                            value: stage,
                            child: Stack(
                              children: [
                                Image(image: NetworkImage(stage.listViewIcon)),
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Colors.grey.shade200.withOpacity(0.5),
                                  ),
                                  child: Text(stage.displayName),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                  onChanged: (Stage? value) {
                    selectedStage.value = value;
                  },
                  searchController: stageController,
                  searchInnerWidget: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                    ),
                    child: TextFormField(
                      controller: stageController,
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
                    return (item.value
                        .toString()
                        .toLowerCase()
                        .contains(searchValue));
                  },
                ),
              ),
              ElevatedButton(
                onPressed: canPushButton
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TipsView(
                              agent: selectedAgent.value!,
                              ability: selectedAbility.value!,
                              stage: selectedStage.value!,
                            ),
                          ),
                        );
                      }
                    : null,
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(88, 50)),
                child: const Text(
                  '検索',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ]),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}

// final itemProvider = StateNotifierProvider((ref) => throw UnimplementedError());

class UnselectedDropdown extends ConsumerWidget {
  const UnselectedDropdown({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Icon(Icons.arrow_drop_down),
        Text(text),
      ],
    );
  }
}
