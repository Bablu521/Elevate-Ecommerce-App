import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  /// Save generic value
  Future<void> save<T>(String key, T value) async {
    String stringValue;

    if (value is String) {
      stringValue = value;
    } else if (value is int || value is double || value is bool) {
      stringValue = value.toString();
    } else {
      // Encode complex objects as JSON
      stringValue = jsonEncode(value);
    }

    await _storage.write(key: key, value: stringValue);
  }

  /// Read generic value
  Future<T?> read<T>(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;

    if (T == String) {
      return value as T;
    } else if (T == int) {
      return int.tryParse(value) as T?;
    } else if (T == double) {
      return double.tryParse(value) as T?;
    } else if (T == bool) {
      return (value.toLowerCase() == 'true') as T;
    } else {
      // Decode JSON for complex objects
      return jsonDecode(value) as T;
    }
  }

  /// Delete key
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Clear all storage
  Future<void> clear() async {
    await _storage.deleteAll();
  }
}
