import 'package:clublab_lite/features/auth/data/datasource/auth_datasource.dart';
import 'package:clublab_lite/features/initial/data/datasource/user_local_datasource.dart';

abstract interface class AuthRepository {
  Future<void> requestOtp(String phone);

  Future<void> loginWithOtp(String phone, String code);

  Future<void> signUp({
    required String fullName,
    required String phone,
    required String? email,
  });

  Future<void> logout();
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
  Future<void> loginWithOtp(phone, code) async {
    final user = await _authDatasource.loginWithOtp(phone, code);

    await _userLocalDatasource.setUser(user);
    await _userLocalDatasource.setAccessToken(user.token);
  }

  @override
  Future<void> signUp({
    required String fullName,
    required String phone,
    required String? email,
  }) async {
    final user = await _authDatasource.signUp(
      fullName: fullName,
      phone: phone,
      email: email,
    );

    await _userLocalDatasource.setUser(user);
    await _userLocalDatasource.setAccessToken(user.token);
  }

  @override
  Future<void> logout() {
    return _userLocalDatasource.logout();
  }
}
