import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/common/constants/storage_keys.dart';
import '../../core/common/repository/local_data/local_data_source.dart';
import '../../core/common/widget/common_components.dart';
import '../../core/di/injector_container.dart';
import '../../core/routes/app_pages.dart';
import '../../models/user_model_response/user_model_response.dart';
import '../logger_util.dart';

class SessionManager {
  static LocalDataSource get _localDataSource => getIt<LocalDataSource>();

  /// Get complete session state
  static Future<SessionState> getSessionState() async {
    try {
      final isLanguageSelected = await _localDataSource.getData(StorageKeys.cKeyLanguageSelected) ?? false;
      final isOnboardingDone = await _localDataSource.getData(StorageKeys.cKeyIsOnBoardingDone) ?? false;
      final isLoggedIn = await _localDataSource.getData(StorageKeys.cKeyIsLogin) ?? false;
      final isGuest = await _localDataSource.getData(StorageKeys.cKeyIsGuestUser) ?? false;
      final isProfileSetup = await _localDataSource.getData(StorageKeys.cKeyProfileSetup) ?? false;
      final userData = await _localDataSource.getUserModel();

      return SessionState(
        isLanguageSelected: isLanguageSelected,
        isOnboardingDone: isOnboardingDone,
        isLoggedIn: isLoggedIn,
        isGuest: isGuest,
        isProfileSetup: isProfileSetup,
        user: userData,
      );
    } catch (e) {
      MyLogger.write('Error getting session state: $e');
      return SessionState.initial();
    }
  }

  /// Login with user data and complete profile setup
  static Future<void> loginUser(UserModelResponse userModel) async {
    try {
      await _localDataSource.saveUserModel(userModel);

      // Store grades if available
      if (userModel.grades != null && userModel.grades!.isNotEmpty) {
        await _localDataSource.setData(StorageKeys.cKeyGrades, jsonEncode(userModel.grades!.map((e) => e.toJson()).toList()));
      }

      // Store token
      if (userModel.user.token != null) {
        await _localDataSource.setData(StorageKeys.cKeyToken, userModel.user.token);
      }

      // Set profile setup status
      await _localDataSource.setData(StorageKeys.cKeyProfileSetup, userModel.user.isProfileSetup ?? false);

      // Set login flags
      await _localDataSource.setData(StorageKeys.cKeyIsLogin, true);
      await _localDataSource.setGuestUser(false); // Clear guest status

      MyLogger.write('User logged in successfully');
    } catch (e) {
      MyLogger.write('Error logging in user: $e');
    }
  }

  /// Login user after profile setup completion
  static Future<void> loginUserAfterProfileSetup(UserModelResponse userModel) async {
    try {
      // First login the user
      await loginUser(userModel);

      // Then explicitly set profile setup as complete
      await updateProfileSetupStatus(true);

      MyLogger.write('User logged in after profile setup completion');
    } catch (e) {
      MyLogger.write('Error logging in user after profile setup: $e');
    }
  }

  /// Continue as guest
  static Future<void> continueAsGuest() async {
    try {
      await _localDataSource.setGuestUser(true);
      await _localDataSource.setData(StorageKeys.cKeyIsLogin, false);
      MyLogger.write('Continuing as guest');
    } catch (e) {
      MyLogger.write('Error setting guest mode: $e');
    }
  }

  /// Check guest access and show dialog if needed
  static Future<bool> checkGuestAccessAndShowDialog({
    String? title,
    String? subtitle,
    String? positiveText,
    String? negativeText,
    VoidCallback? onNegativeTap,
  }) async {
    final state = await getSessionState();

    // If user is logged in, allow access
    if (state.isLoggedIn) {
      return true;
    }

    // If user is guest, show login required dialog
    if (state.isGuest) {
      CommonComponents.commonDialog(
        title: title ?? 'loginRequired'.tr,
        subTitle: subtitle ?? 'loginToAccessPackages'.tr,
        positiveText: positiveText ?? 'lblYes'.tr,
        negativeText: negativeText ?? 'lblNo'.tr,
        onPositiveTap: () async {
          await SessionManager.logout();
          Get.offAllNamed(Routes.login);
        },
        onNegativeTap: onNegativeTap,
      );
      return false;
    }

    // If not authenticated at all, redirect to login
    Get.offAllNamed(Routes.login);
    return false;
  }

  /// Method with custom message for specific features
  static Future<bool> requireLoginForFeature() async {
    return await checkGuestAccessAndShowDialog();
  }

  /// Complete onboarding
  static Future<void> completeOnboarding() async {
    try {
      await _localDataSource.setData(StorageKeys.cKeyIsOnBoardingDone, true);
      MyLogger.write('Onboarding completed');
    } catch (e) {
      MyLogger.write('Error completing onboarding: $e');
    }
  }

  /// Update profile setup status
  static Future<void> updateProfileSetupStatus(bool isComplete) async {
    try {
      await _localDataSource.setData(StorageKeys.cKeyProfileSetup, isComplete);
      MyLogger.write('Profile setup status updated: $isComplete');
    } catch (e) {
      MyLogger.write('Error updating profile setup: $e');
    }
  }

  /// Save user profile data locally
  static Future<void> saveUserProfileData({List<int>? selectedGrades, String? selectedStream, Map<String, dynamic>? additionalData}) async {
    try {
      if (selectedGrades != null) {
        await _localDataSource.setData('selected_grades', selectedGrades);
      }

      if (selectedStream != null && selectedStream.isNotEmpty) {
        await _localDataSource.setData('selected_stream', selectedStream);
      }

      if (additionalData != null) {
        for (final entry in additionalData.entries) {
          await _localDataSource.setData(entry.key, entry.value);
        }
      }

      MyLogger.write('User profile data saved locally');
    } catch (e) {
      MyLogger.write('Error saving user profile data: $e');
    }
  }

  /// Get user profile data from local storage
  static Future<Map<String, dynamic>> getUserGradeData() async {
    try {
      final selectedGrade = await _localDataSource.getData('selected_grade');
      final selectedStream = await _localDataSource.getData('selected_stream');

      print('selectedGrade ${selectedGrade}');
      return {'selected_grade': selectedGrade, 'selected_stream': selectedStream};
    } catch (e) {
      MyLogger.write('Error getting user profile data: $e');
      return {};
    }
  }

  /// Get grades from local storage
  static Future<List<GradeModel>> getGrades() async {
    try {
      final storedJsonString = await _localDataSource.getData(StorageKeys.cKeyGrades);
      if (storedJsonString != null) {
        final List<dynamic> jsonList = jsonDecode(storedJsonString);
        final grades = jsonList.map((e) => GradeModel.fromJson(e as Map<String, dynamic>)).toList();
        return grades;
      }
      return [];
    } catch (e) {
      MyLogger.e('Error loading grades: $e');
      return [];
    }
  }

  /// Get grade name by ID
  static Future<String?> getGradeNameById(int gradeId) async {
    try {
      final gradeList = await getGrades();
      final grade = gradeList.firstWhere((grade) => grade.id == gradeId);
      return grade.name;
    } catch (e) {
      MyLogger.e('Grade not found for ID: $gradeId');
      return 'Unknown Grade';
    }
  }

  /// Get stream name by grade ID and stream ID
  static Future<String?> getStreamNameById(int gradeId, int streamId) async {
    try {
      final gradeList = await getGrades();
      final grade = gradeList.firstWhere((grade) => grade.id == gradeId);
      final stream = grade.streams?.firstWhere((stream) => stream.id == streamId);
      return stream?.name;
    } catch (e) {
      MyLogger.e('Stream not found for Grade ID: $gradeId, Stream ID: $streamId');
      return '';
    }
  }

  static Future<void> saveSelectedGradeLocally({required int selectedGrade, required int selectedStream}) async {
    try {
      // Changed to save single grade value instead of list
      await _localDataSource.setData('selected_grade', selectedGrade);
      await _localDataSource.setData('selected_stream', selectedStream);
    } catch (e) {
      MyLogger.e('Error saving selected grade locally: $e');
    }
  }

  /// Clear profile data
  static Future<void> clearProfileData() async {
    try {
      await _localDataSource.clearSpecificKey('selected_grade');
      await _localDataSource.clearSpecificKey('selected_stream');
      MyLogger.write('Profile data cleared');
    } catch (e) {
      MyLogger.write('Error clearing profile data: $e');
    }
  }

  /// Logout (clears all session data)
  static Future<void> logout() async {
    try {
      // Clear profile data first
      await clearProfileData();

      // Clear login data
      await _localDataSource.clearLoginData();
      Get.offAllNamed(Routes.login);

      MyLogger.write('User logged out');
    } catch (e) {
      MyLogger.write('Error logging out: $e');
    }
  }

  /// Get next route based on session state
  static String getNextRoute(SessionState state) {
    // If language selection not done, go to language selection
  /*  if (!state.isLanguageSelected) {
      return Routes.selectLanguage;
    }
    // If onboarding not done, go to onboarding
    if (!state.isOnboardingDone) {
      return Routes.onBoarding;
    }
*/
    // If not authenticated (not logged in and not guest)
    if (!state.isLoggedIn && !state.isGuest) {
      return Routes.login;
    }

    // If guest user, go to dashboard (or guest-specific flow)
   /* if (state.isGuest) {
      return Routes.dashboard; // or Routes.guestDashboard
    }*/

    // If logged in but profile not setup
    if (state.isLoggedIn && !state.isProfileSetup) {
      return Routes.profileSetup;
    }

    // If logged in and profile setup
  /*  if (state.isLoggedIn && state.isProfileSetup) {
      return Routes.dashboard;
    }*/

    // Default fallback
    return Routes.login;
  }

  /// Check if user needs to complete profile
  static Future<bool> needsProfileSetup() async {
    final state = await getSessionState();
    return state.isLoggedIn && !state.isProfileSetup;
  }

  /// Check if user is authenticated (either logged in or guest)
  static Future<bool> isAuthenticated() async {
    final state = await getSessionState();
    return state.isLoggedIn || state.isGuest;
  }

  /// Refresh session state and update controllers
  static Future<void> refreshSession() async {
    try {
      final state = await getSessionState();
      MyLogger.write('Session refreshed: $state');
    } catch (e) {
      MyLogger.write('Error refreshing session: $e');
    }
  }

  /// Handle app initialization based on session state
  static Future<String> initializeApp() async {
    try {
      final state = await getSessionState();
      final nextRoute = getNextRoute(state);

      MyLogger.write('App initialized, next route: $nextRoute');
      MyLogger.write('Session state: $state');

      return nextRoute;
    } catch (e) {
      MyLogger.write('Error initializing app: $e');
      return Routes.login;
    }
  }
}

/// Centralized session state model
class SessionState {
  final bool isOnboardingDone;
  final bool isLoggedIn;
  final bool isGuest;
  final bool isProfileSetup;
  final bool isLanguageSelected;
  final UserModelResponse? user;

  SessionState({
    required this.isLanguageSelected,
    required this.isOnboardingDone,
    required this.isLoggedIn,
    required this.isGuest,
    required this.isProfileSetup,
    this.user,
  });

  factory SessionState.initial() {
    return SessionState(
      isLanguageSelected: false,
      isOnboardingDone: false,
      isLoggedIn: false,
      isGuest: false,
      isProfileSetup: false,
      user: null,
    );
  }

  AuthStatus get authStatus {
    if (isLoggedIn) return AuthStatus.loggedIn;
    if (isGuest) return AuthStatus.guest;
    return AuthStatus.notAuthenticated;
  }

  bool get isFullySetup => isLoggedIn && isProfileSetup;
  bool get needsOnboarding => !isOnboardingDone;
  bool get needsAuthentication => !isLoggedIn && !isGuest;
  bool get needsProfileSetup => isLoggedIn && !isProfileSetup;

  @override
  String toString() {
    return 'SessionState(onboarding: $isOnboardingDone, loggedIn: $isLoggedIn, guest: $isGuest, profileSetup: $isProfileSetup)';
  }
}

enum AuthStatus { notAuthenticated, guest, loggedIn }
