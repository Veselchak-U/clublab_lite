import 'package:clublab_lite/app/service/network/api_client/api_client.dart';
import 'package:clublab_lite/app/service/network/api_client/entities/api_exception.dart';
import 'package:clublab_lite/app/service/network/api_endpoints.dart';
import 'package:clublab_lite/config.dart';
import 'package:clublab_lite/features/home/data/model/game_record_api_model.dart';

abstract interface class GameRecordDatasource {
  Future<List<GameRecordApiModel>> fetchGameRecords();
}

class GameRecordDatasourceImpl implements GameRecordDatasource {
  final ApiClient _apiClient;

  GameRecordDatasourceImpl(
    this._apiClient,
  );

  @override
  Future<List<GameRecordApiModel>> fetchGameRecords() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {},
    );

    return _mockedGameRecords;

    return _apiClient.get(
      Uri.parse('${Config.environment.baseUrl}${ApiEndpoints.gameRecords}'),
      parser: (response) {
        if (response.body case final Map<String, dynamic> body) {
          final jsonList = body['data'] as List?;
          if (jsonList == null || jsonList.isEmpty) return [];
          // if (jsonList == null || jsonList.isEmpty) return _mockedAnnualReports;

          return jsonList.map((e) => GameRecordApiModel.fromJson(e)).toList();
        }

        throw ApiException(response);
      },
    );
  }

  final _mockedGameRecords = [
    GameRecordApiModel(
      id: 1,
      description: 'description 1',
      name: 'name 1',
      fieldName: 'fieldName 1',
      created: DateTime.now().subtract(Duration(hours: 1)),
      url: 'url 1',
    ),
    GameRecordApiModel(
      id: 2,
      description: 'description 2',
      name: 'name 2',
      fieldName: 'fieldName 2',
      created: DateTime.now().subtract(Duration(hours: 2)),
      url: 'url 2',
    ),
    GameRecordApiModel(
      id: 3,
      description: 'description 3',
      name: 'name 3',
      fieldName: 'fieldName 3',
      created: DateTime.now().subtract(Duration(hours: 3)),
      url: 'url 3',
    ),
  ];
}
