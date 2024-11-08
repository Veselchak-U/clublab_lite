import 'dart:io';

import 'package:clublab_lite/app/service/network/api_client/api_client.dart';
import 'package:clublab_lite/app/service/network/api_client/entities/api_exception.dart';
import 'package:clublab_lite/app/service/network/api_endpoints.dart';
import 'package:clublab_lite/config.dart';
import 'package:clublab_lite/features/auth/data/model/user_api_model.dart';

abstract interface class AuthDatasource {
  Future<void> requestOtp(String phone);

  Future<UserApiModel> loginWithOtp(String phone, String code);

  Future<UserApiModel> signUp({
    required String fullName,
    required String phone,
    String? email,
  });
}

class AuthDatasourceImpl implements AuthDatasource {
  final ApiClient _apiClient;

  AuthDatasourceImpl(
    this._apiClient,
  );

  @override
  Future<void> requestOtp(String phone) async {
    await Future.delayed(
      const Duration(seconds: 1),
      () {},
    );

    return;

    final normalizedPhone = '0${phone.replaceAll('-', '')}';

    return _apiClient.post(
      Uri.parse('${Config.environment.baseUrl}${ApiEndpoints.sendOtp}'),
      body: {"phone": normalizedPhone},
      parser: (response) {
        if (response.statusCode == HttpStatus.ok) return;

        throw ApiException(response);
      },
    );
  }

  @override
  Future<UserApiModel> loginWithOtp(String phone, String code) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {},
    );

    return _mockedUser;

    final normalizedPhone = '0${phone.replaceAll('-', '')}';

    return _apiClient.post(
      Uri.parse('${Config.environment.baseUrl}${ApiEndpoints.checkOtp}'),
      body: {
        'phone': normalizedPhone,
        'otp': code,
      },
      parser: (response) {
        if (response.body case final Map<String, dynamic> body) {
          final data = body["data"];

          return UserApiModel.fromJson(data);
        }

        throw ApiException(response);
      },
    );
  }

  @override
  Future<UserApiModel> signUp({
    required String fullName,
    required String phone,
    String? email,
  }) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {},
    );

    return UserApiModel(
      id: -1,
      name: fullName,
      phone: phone,
      email: email,
      token: 'token',
    );

    final normalizedPhone = '0${phone.replaceAll('-', '')}';

    return _apiClient.post(
      Uri.parse('${Config.environment.baseUrl}${ApiEndpoints.registration}'),
      body: {
        'full_name': fullName,
        'phone': phone,
        'email': email,
      },
      parser: (response) {
        if (response.body case final Map<String, dynamic> body) {
          final data = body["data"];

          return UserApiModel.fromJson(data);
        }

        throw ApiException(response);
      },
    );
  }

  final _mockedUser = UserApiModel(
    id: -1,
    name: 'name',
    phone: 'phone',
    email: 'email',
    token: 'token',
  );
}
