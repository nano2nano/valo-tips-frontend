import 'package:valo_tips/model/stage/stage.dart';

abstract class StageRepository {
  Future<List<Stage>> fetchStages({required String language});
}
