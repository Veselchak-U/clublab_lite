import 'package:clublab_lite/features/home/data/datasource/game_record_datasource.dart';
import 'package:clublab_lite/features/home/data/model/game_record_api_model.dart';

abstract interface class GameRecordRepository {
  Future<List<GameRecordApiModel>> fetchGameRecords();
}

class GameRecordRepositoryImpl implements GameRecordRepository {
  final GameRecordDatasource _gameRecordDatasource;

  GameRecordRepositoryImpl(
    this._gameRecordDatasource,
  );

  @override
  Future<List<GameRecordApiModel>> fetchGameRecords() {
    return _gameRecordDatasource.fetchGameRecords();
  }
}
