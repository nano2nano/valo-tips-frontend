import 'package:valo_tips/model/agent/agent.dart';

abstract class AgentRepository {
  Future<List<Agent>> fetchAgents({required String language});
}
