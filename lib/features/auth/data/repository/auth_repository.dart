import 'package:clublab_lite/features/auth/data/datasource/auth_datasource.dart';
import 'package:clublab_lite/features/auth/data/model/user_api_model.dart';
import 'package:clublab_lite/features/initial/data/datasource/user_local_datasource.dart';

abstract interface class AuthRepository {
  Future<void> requestOtp(String phone);

  Future<UserApiModel> loginWithOtp(String phone, String code);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;
  final UserLocalDatasource _userLocalDatasource;

  AuthRepositoryImpl(
    this._authDatasource,
    this._userLocalDatasource,
  );

  @override
  Future<void> requestOtp(String phone) {
    return _authDatasource.requestOtp(phone);
  }

  @override
  Future<UserApiModel> loginWithOtp(phone, code) async {
    final user = await _authDatasource.loginWithOtp(phone, code);

    await _userLocalDatasource.setUser(user);
    await _userLocalDatasource.setAccessToken(user.token);

    return user;
  }
}
