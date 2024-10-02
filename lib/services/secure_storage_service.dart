/*
------------------------------------------------------------------------
| SECURE STORAGE SERVICE
| ----------------------------------------------------------------------
| By: Caleb Jesusegun            | Date: 21 - Jun - 2024                |
| ----------------------------------------------------------------------
| Modified by:                   | Comments:                            |
------------------------------------------------------------------------
NB:
*/

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../app/app.logger.dart';

class SecureStorageService {
  final _logger = getLogger('SecureStorageService');
  final String _refreshKey = 'refresh_token';
  final String _user = 'user';
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  Future<void> deleteUser() async {
    try {
      await _flutterSecureStorage.delete(key: _user);
    } catch (e, s) {
      _logger.e('error trying to delete user token', e, s);
    }
  }

  Future<void> deleteRefreshToken() async {
    try {
      await _flutterSecureStorage.delete(key: _refreshKey);
    } catch (e, s) {
      _logger.e('error trying to delete refresh token', e, s);
    }
  }

  Future<String?> readRefreshToken() async {
    try {
      return await _flutterSecureStorage.read(key: _refreshKey);
    } catch (e, s) {
      _logger.e('error trying to read refresh token', e, s);
      return null;
    }
  }

  Future<String?> readUser() async {
    try {
      return await _flutterSecureStorage.read(key: _user);
    } catch (e, s) {
      _logger.e('error trying to read user data', e, s);
      return null;
    }
  }

  Future<void> writeUser({required Map? user}) async {
    try {
      await _flutterSecureStorage.write(
        key: _user,
        value: jsonEncode(user),
      );
      _logger.i('user data saved');
    } catch (e, s) {
      _logger.e('error trying to write user data', e, s);
    }
  }

  Future<void> writeRefreshToken({String? token}) async {
    try {
      await _flutterSecureStorage.write(key: _refreshKey, value: token);
    } catch (e, s) {
      _logger.e('error trying to write refresh token', e, s);
    }
  }
}
