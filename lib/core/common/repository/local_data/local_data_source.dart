import '../../../../models/user_model_response/user_model_response.dart';

abstract class LocalDataSource {
  Future<dynamic> setData(String key, dynamic value);

  Future<List<String>> getAllKeys();

  Future<dynamic> getData(String key);

  bool getIsLogin();

  bool getIsGuestUser();

  String getUserId();

  void clearData();

  Future<void> saveUserModel(UserModelResponse model);

  Future<UserModelResponse?> getUserModel();

  Future<dynamic> clearSpecificKey(String key);

  Future<dynamic> clearLoginData();

  Future<dynamic> setGuestUser(bool isGuest);

  Future<void> saveVideoProgress(String videoId, double percent);
  double getVideoProgress(String videoId);

  Future<void> saveLastPlayedPosition(String videoId, Duration position);

  Duration getLastPlayedPosition(String videoId);

  Future<void> clearDownloadedVideosAndMetadata();

  Future<void> setHandledDeepLink(String uri);
  bool wasDeepLinkHandled(String uri);
}
