import 'dart:convert' as convert;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:valo_tips/model/stage/stage.dart';

import 'stage_repository.dart';

final stageRepositoryProvider =
    Provider<StageRepository>((ref) => StageRepositoryImpl(ref.read));

class StageRepositoryImpl implements StageRepository {
  StageRepositoryImpl(this._reader);
  final Reader _reader;

  @override
  Future<List<Stage>> fetchStages({required String language}) async {
    final response = await http.get(Uri.https(
      'valorant-api.com',
      '/v1/maps',
      {
        'language': language,
      },
    ));

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.json.decode(response.body)["data"] as List<dynamic>;
      var stages = jsonResponse.map((i) => Stage.fromJson(i)).toList();
      return stages;
    } else {
      throw Exception('Failed to load stages');
    }
  }
}
