import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../models/user_model_response/user_model_response.dart';
import '../../constants/storage_keys.dart';
import 'local_data_source.dart';

@LazySingleton(as: LocalDataSource)
class LocalDataSourceImpl extends LocalDataSource {
  final GetStorage _box = GetStorage(StorageKeys.cDataStore);

  @override
  void clearData() {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    box.erase();
  }

  @override
  Future clearSpecificKey(String key) async {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    return box.remove(key);
  }

  @override
  Future getData(String key) async {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    return box.read(key);
  }

  @override
  Future<List<String>> getAllKeys() async {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    return box.getKeys().cast<String>().toList();
  }

  @override
  String getUserId() {
    final jsonString = _box.read(StorageKeys.cKeyUserData);
    if (jsonString == null) return "";

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return jsonMap['user']?['id']?.toString() ?? "";
  }

  @override
  bool getIsLogin() {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    return box.read(StorageKeys.cKeyIsLogin) ?? false;
  }

  @override
  bool getIsGuestUser() {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    return box.read(StorageKeys.cKeyIsGuestUser) ?? false;
  }

  @override
  Future setData(String key, value) async {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    return box.write(key, value);
  }

  @override
  Future setGuestUser(bool isGuest) async {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    return box.write(StorageKeys.cKeyIsGuestUser, isGuest);
  }

  @override
  Future<void> saveUserModel(UserModelResponse model) async {
    final jsonString = jsonEncode(model.toJson());
    await _box.write(StorageKeys.cKeyUserData, jsonString);
  }

  @override
  Future<UserModelResponse?> getUserModel() async {
    final jsonString = _box.read(StorageKeys.cKeyUserData);
    if (jsonString == null) return null;

    final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
    return UserModelResponse.fromJson(jsonMap);
  }

  static const String _videoProgressKey = 'video_progress_map';
  static const String _videoPositionKey = 'video_position_map';

  @override
  Future<void> saveVideoProgress(String videoId, double percent) async {
    final Map<String, dynamic> map = Map<String, dynamic>.from(_box.read(_videoProgressKey) ?? {});
    map[videoId] = percent;
    await _box.write(_videoProgressKey, map);
  }

  @override
  double getVideoProgress(String videoId) {
    final Map<String, dynamic> map = Map<String, dynamic>.from(_box.read(_videoProgressKey) ?? {});
    return (map[videoId] ?? 0.0).toDouble();
  }

  @override
  Future<void> saveLastPlayedPosition(String videoId, Duration position) async {
    final Map<String, dynamic> map = Map<String, dynamic>.from(_box.read(_videoPositionKey) ?? {});
    map[videoId] = position.inSeconds;
    await _box.write(_videoPositionKey, map);
  }

  @override
  Duration getLastPlayedPosition(String videoId) {
    final Map<String, dynamic> map = Map<String, dynamic>.from(_box.read(_videoPositionKey) ?? {});
    final seconds = (map[videoId] ?? 0) as int;
    return Duration(seconds: seconds);
  }

  @override
  Future<void> clearDownloadedVideosAndMetadata() async {
    final allKeys = await getAllKeys();

    // Clear video keys
    final downloadKeys = allKeys.where((key) => key.startsWith('download_'));
    for (final key in downloadKeys) {
      await clearSpecificKey(key);
    }

    // Clear PDF keys
    final pdfKeys = allKeys.where((key) => key.startsWith('pdf_download_'));
    for (final key in pdfKeys) {
      await clearSpecificKey(key);
    }

    // Remove video progress/position
    await _box.remove('video_progress_map');
    await _box.remove('video_position_map');

    // Delete video files
    final dir = await getApplicationDocumentsDirectory();
    final videoDir = Directory('${dir.path}/downloads');
    if (await videoDir.exists()) {
      await videoDir.delete(recursive: true);
    }

    // Delete pdf files
    final pdfDir = Directory('${dir.path}/pdfs');
    if (await pdfDir.exists()) {
      await pdfDir.delete(recursive: true);
    }
  }

  static const String _handledDeepLinksKey = 'handled_deep_links';

  @override
  Future<void> setHandledDeepLink(String uri) async {
    final List<String> handledLinks = List<String>.from(_box.read(_handledDeepLinksKey) ?? []);
    if (!handledLinks.contains(uri)) {
      handledLinks.add(uri);
      await _box.write(_handledDeepLinksKey, handledLinks);
    }
  }

  @override
  bool wasDeepLinkHandled(String uri) {
    final List<String> handledLinks = List<String>.from(_box.read(_handledDeepLinksKey) ?? []);
    return handledLinks.contains(uri);
  }

  @override
  Future clearLoginData() async {
    final GetStorage box = GetStorage(StorageKeys.cDataStore);
    box.remove(StorageKeys.cKeyToken);
    box.remove(StorageKeys.cKeyUserId);
    box.remove(StorageKeys.cKeyIsLogin);
    box.remove(StorageKeys.cKeyIsGuestUser);
    box.remove(StorageKeys.cKeyUserData);
    box.remove(StorageKeys.cKeyWalletBalance);
    box.remove(StorageKeys.cKeyProfileSetup);
    box.remove(StorageKeys.cKeyReferralCode);
    box.remove(StorageKeys.cKeyRegistrationType);
    await clearDownloadedVideosAndMetadata();
  }
}
