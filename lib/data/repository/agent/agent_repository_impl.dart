import 'dart:convert' as convert;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:valo_tips/model/agent/agent.dart';

import 'agent_repository.dart';

final agentRepositoryProvider =
    Provider<AgentRepository>((ref) => AgentRepositoryImpl(ref.read));

class AgentRepositoryImpl implements AgentRepository {
  AgentRepositoryImpl(this.reader);
  final Reader reader;

  @override
  Future<List<Agent>> fetchAgents({required String language}) async {
    final response = await http.get(Uri.https(
      'valorant-api.com',
      '/v1/agents',
      {
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
}
