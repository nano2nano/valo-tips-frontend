import 'dart:convert' as convert;

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:valo_tips/model/ability/ability.dart';
import 'package:valo_tips/model/agent/agent.dart';
import 'package:valo_tips/model/stage/stage.dart';
import 'package:valo_tips/view/drawer/drawer.dart';

class PostTipView extends StatefulHookWidget {
  const PostTipView({super.key});

  @override
  State<PostTipView> createState() => _PostTipViewState();
}

class _PostTipViewState extends State<PostTipView> {
  late Future<List<Agent>> futureAgents;
  late Future<List<Stage>> futureStages;

  final TextEditingController agentController = TextEditingController();
  final TextEditingController abilityController = TextEditingController();
  final TextEditingController stageController = TextEditingController();

  final language = 'ja-JP';
  @override
  void initState() {
    super.initState();
    futureAgents = fetchAgents(language: language);
    futureStages = fetchStages(language: language);
  }

  @override
  void dispose() {
    agentController.dispose();
    abilityController.dispose();
    stageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final standImg = useState<List<int>?>(null);
    final aimImg = useState<List<int>?>(null);
    final selectedAgent = useState<Agent?>(null);
    final selectedAbility = useState<Ability?>(null);
    final selectedStage = useState<Stage?>(null);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValoTips/PostTip'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(children: [
          FutureBuilder<List<Agent>>(
            future: futureAgents,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final agents = snapshot.data!;
                return Column(
                  children: [
                    // pick image button form gallery
                    ElevatedButton(
                      onPressed: () async {
                        standImg.value = await ImagePickerWeb.getImageAsBytes();
                      },
                      child: const Text('立ち位置画像を選択'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        aimImg.value = await ImagePickerWeb.getImageAsBytes();
                      },
                      child: const Text('狙い位置画像を選択'),
                    ),
                    const Text('Agent', style: TextStyle(fontSize: 24)),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: () {
                          if (selectedAgent.value == null) {
                            return const UnselectedDropdown(
                                text: 'Select Agent');
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
                          setState(() {
                            selectedAgent.value = value;
                            selectedAbility.value = null;
                          });
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
                            return const UnselectedDropdown(
                                text: 'Select Agent');
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                          setState(() {
                            selectedAbility.value = value;
                          });
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
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('Stage', style: TextStyle(fontSize: 24)),
          FutureBuilder<List<Stage>>(
            future: futureStages,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final stages = snapshot.data!;
                return DropdownButtonHideUnderline(
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
                                  Image(
                                      image: NetworkImage(stage.listViewIcon)),
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
                      setState(() {
                        selectedStage.value = value;
                      });
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
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
          ElevatedButton(
            onPressed: () async {
              if (selectedAgent.value == null ||
                  selectedAbility.value == null ||
                  selectedStage.value == null ||
                  standImg.value == null ||
                  aimImg.value == null) {
                return;
              }
              // post to api
              await postTips(
                standImageBytes: standImg.value!,
                aimImageBytes: aimImg.value!,
                agentUuid: selectedAgent.value!.uuid,
                abilitySlot: selectedAbility.value!.slot,
                mapUuid: selectedStage.value!.uuid,
                title: 'default title',
                description: 'default description',
                sideId: 1,
              ).then((value) {
                // navigate to show page
                Navigator.of(context).pushNamed('/tips');
              });
            },
            style: ElevatedButton.styleFrom(minimumSize: const Size(88, 50)),
            child: const Text(
              '投稿',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Future<List<Agent>> fetchAgents({String language = 'en-US'}) async {
    final response = await http.get(Uri.https(
      'valorant-api.com',
      '/v1/agents',
      {
        'q': 'https',
        'language': language,
        'isPlayableCharacter': 'true',
      },
    ));

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.json.decode(response.body)["data"] as List<dynamic>;
      var agents = jsonResponse.map((i) => Agent.fromJson(i)).toList();
      return agents;
    } else {
      throw Exception('Failed to load agents');
    }
  }

  Future<List<Stage>> fetchStages({String language = 'en-US'}) async {
    final response = await http.get(Uri.https(
      'valorant-api.com',
      '/v1/maps',
      {
        'q': 'https',
        'language': language,
      },
    ));

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.json.decode(response.body)["data"] as List<dynamic>;
      var stages = jsonResponse.map((i) => Stage.fromJson(i)).toList();
      return stages;
    } else {
      throw Exception('Failed to load agents');
    }
  }

  Future<String?> getImage() async {
    final bytes = await ImagePickerWeb.getImageAsBytes();
    if (bytes == null) {
      return null;
    }
    final base64Image = convert.base64Encode(bytes);
    return base64Image;
  }

  // post tips to api
  Future postTips({
    required List<int> standImageBytes,
    required List<int> aimImageBytes,
    required String agentUuid,
    required String abilitySlot,
    required String mapUuid,
    required String title,
    required String description,
    required int sideId,
  }) async {
    final host = dotenv.env['BACKEND_HOST']!;
    final url = Uri.http(host, 'api/v1/tip');
    // CORS対策
    final headers = {
      'Access-Control-Allow-Origin': '*',
    };
    final request = http.MultipartRequest("POST", url);
    request.headers.addAll(headers);
    request.files.add(http.MultipartFile.fromBytes(
      'stand_image',
      standImageBytes,
      filename: 'stand_image.jpeg',
      contentType: MediaType('image', 'jpeg'),
    ));
    request.files.add(http.MultipartFile.fromBytes(
      'aim_image',
      aimImageBytes,
      filename: 'aim_image.jpeg',
      contentType: MediaType('image', 'jpeg'),
    ));
    request.fields['agent_uuid'] = agentUuid;
    request.fields['ability_slot'] = abilitySlot;
    request.fields['map_uuid'] = mapUuid;
    request.fields['title'] = title;
    request.fields['description'] = description;
    request.fields['side_id'] = sideId.toString();
    final response = await request.send();
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to post tips');
    }
  }
}

class UnselectedDropdown extends StatelessWidget {
  const UnselectedDropdown({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.arrow_drop_down),
        Text(text),
      ],
    );
  }
}
