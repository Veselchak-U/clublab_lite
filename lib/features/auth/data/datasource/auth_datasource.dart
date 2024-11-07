import 'dart:io';

import 'package:clublab_lite/app/service/network/api_client/api_client.dart';
import 'package:clublab_lite/app/service/network/api_client/entities/api_exception.dart';
import 'package:clublab_lite/app/service/network/api_endpoints.dart';
import 'package:clublab_lite/config.dart';

abstract interface class AuthDatasource {
  Future<void> requestOtp(String phone);
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
}
