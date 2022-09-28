import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:valo_tips/data/repository/agent/agent_repository.dart';
import 'package:valo_tips/data/repository/agent/agent_repository_impl.dart';
import 'package:valo_tips/data/repository/stage/stage_repository.dart';
import 'package:valo_tips/data/repository/stage/stage_repository_impl.dart';

final searchTipViewModelProvider = StateNotifierProvider.autoDispose
    .family<SearchTipViewModel, AsyncValue, String>((ref, language) =>
        SearchTipViewModel(reader: ref.read, language: language));

// view model
class SearchTipViewModel extends StateNotifier<AsyncValue> {
  SearchTipViewModel({required this.reader, required this.language})
      : super(const AsyncValue.loading()) {
    _agentRepository = reader(agentRepositoryProvider);
    _stageRepository = reader(stageRepositoryProvider);
    _fetchData();
  }
  final Reader reader;
  final String language;
  late AgentRepository _agentRepository;
  late StageRepository _stageRepository;

  Future<void> _fetchData() async {
    try {
      final futureAgents = _agentRepository.fetchAgents(language: language);
      final futureStages = _stageRepository.fetchStages(language: language);
      final data = await Future.wait([futureAgents, futureStages]);
      state = AsyncValue.data(data);
    } catch (e) {
      state = AsyncValue.error(e);
    }
  }
}
