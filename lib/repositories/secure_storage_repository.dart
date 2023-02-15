import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepository {

  const SecureStorageRepository();

  final _secure = const FlutterSecureStorage();

  Future<void> write({required String key, String? value}) async {
    await _secure.write(key: key, value: value);
  }

  Future<String?> readOne({required String key}) async {
    return await _secure.read(key: key);
  }

  Future<Map<String, String>> readAll() async {
    return await _secure.readAll();
  }

  Future<void> deleteOne({required String key}) async {
    await _secure.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secure.deleteAll();
  }

}