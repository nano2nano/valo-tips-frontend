import 'dart:convert' as convert;

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:valo_tips/model/ability/ability.dart';
import 'package:valo_tips/model/agent/agent.dart';
import 'package:valo_tips/model/stage/stage.dart';
import 'package:valo_tips/model/tip/tip.dart';

class TipsView extends StatefulWidget {
  const TipsView({
    super.key,
    required this.agent,
    required this.ability,
    required this.stage,
  });
  final Agent agent;
  final Ability ability;
  final Stage stage;

  @override
  State<TipsView> createState() => _TipsViewState();
}

class _TipsViewState extends State<TipsView> {
  late Future<List<Tip>> futureTips;
  @override
  void initState() {
    super.initState();
    futureTips = fetchTips(widget.agent, widget.ability, widget.stage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${widget.agent.displayName} / ${widget.ability.displayName} / ${widget.stage.displayName}"),
      ),
      body: FutureBuilder(
        future: futureTips,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Tip> tips = snapshot.data as List<Tip>;
            if (tips.isEmpty) {
              return const Center(
                child: Text("No tips found"),
              );
            }
            return ListView.builder(
              itemCount: tips.length,
              itemBuilder: (context, index) {
                final Tip tip = tips[index];
                return ExpandableNotifier(
                  child: ScrollOnExpand(
                    child: ExpandablePanel(
                      header: Text(
                        tip.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      collapsed: const Text(''),
                      expanded: Column(
                        children: [
                          const Text('立ち位置'),
                          Image(image: NetworkImage(tip.standImgPath)),
                          const Text('狙う位置'),
                          Image(image: NetworkImage(tip.aimImgPath)),
                          Text(tip.description),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future<List<Tip>> fetchTips(Agent agent, Ability ability, Stage stage) async {
    final host = dotenv.env['BACKEND_HOST'];
    const endpoint = 'api/v1/tip';
    final response = await http.get(Uri.http(
      host!,
      endpoint,
      {
        'side_id': "1",
        'agent_uuid': agent.uuid,
        'ability_slot': ability.slot,
        'map_uuid': stage.uuid,
      },
    ));
    if (response.statusCode == 200) {
      var jsonResponse = convert.json.decode(response.body) as List<dynamic>;
      var tips = jsonResponse.map((i) => Tip.fromJson(i)).toList();
      return tips;
    } else {
      throw Exception('Failed to load agents');
    }
  }
}
