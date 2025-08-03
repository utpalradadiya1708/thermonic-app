import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/common/enum/image_selection_type.dart';
import '../core/common/repository/local_data/local_data_source.dart';
import '../core/di/injector_container.dart';

double clampDouble(double x, double min, double max) {
  assert(min <= max && !max.isNaN && !min.isNaN);
  if (x < min) {
    return min;
  }
  if (x > max) {
    return max;
  }
  if (x.isNaN) {
    return max;
  }
  return x;
}

void removeFocus() {
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.first == ConnectivityResult.none) {
    return false;
  } else {
    return true;
  }
}

Future<XFile?> selectImage({required ImageSelectionType type, bool isProfile = false}) async {
  try {
    Permission permission;

    if (type == ImageSelectionType.camera) {
      permission = Permission.camera;
    } else {
      if (Platform.isIOS) {
        permission = Permission.photos;
      } else {
        if (Platform.version.contains('13') || Platform.version.startsWith('34')) {
          permission = Permission.photos;
        } else {
          permission = Permission.storage;
        }
      }
    }

    // if (Platform.isIOS) {
    //   permission = type == ImageSelectionType.camera
    //       ? Permission.camera
    //       : Permission.photos;
    // } else {
    //   permission = type == ImageSelectionType.camera
    //       ? Permission.camera
    //       : Permission.photos;
    // }

    var status = await permission.status;
    print('Permission status: $status');

    // If permanently denied, redirect to settings immediately
    if (status.isPermanentlyDenied) {
      EasyLoading.dismiss();
      await openAppSettings();
      return null;
    }

    // Request permission if not granted
    if (!status.isGranted) {
      status = await permission.request();
      if (!status.isGranted) {
        EasyLoading.dismiss();
        return null;
      }
    }

    // ✅ Permission granted
    final picked = await ImagePicker().pickImage(source: type == ImageSelectionType.camera ? ImageSource.camera : ImageSource.gallery);
    return picked;
  } catch (e) {
    EasyLoading.dismiss();
    debugPrint('Image pick error: $e');
    return null;
  }
}

// Future<XFile?> selectImage({
//   required ImageSelectionType type,
//   bool isProfile = false,
// }) async {
//   try {
//     XFile? value;
//     value = await ImagePicker().pickImage(
//       source: type == ImageSelectionType.camera
//           ? ImageSource.camera
//           : ImageSource.gallery,
//     );
//     return value;
//   } on PlatformException catch (e) {
//     EasyLoading.dismiss();
//     if (e.code == 'camera_access_denied' ||
//         e.code == 'gallery_access_denied' ||
//         e.code == 'photo_access_denied' ||
//         e.code == 'photo_access_restricted') {
//       await openAppSettings();
//     }
//     return null;
//   } catch (e) {
//     EasyLoading.dismiss();
//     return null;
//   }
// }

// Future<XFile?> selectImage({
//   required ImageSelectionType type,
//   bool isProfile = false,
// }) async {
//   EasyLoading.show();
//
//   try {
//     final XFile? value = await ImagePicker().pickImage(
//       source:
//           type == ImageSelectionType.camera
//               ? ImageSource.camera
//               : ImageSource.gallery,
//     );
//
//     EasyLoading.dismiss();
//
//     if (value != null) {
//       final String path = value.path.toLowerCase();
//       final String extension = path.split('.').last;
//
//       final List<String> allowedExtensions =
//           isProfile
//               ? ['jpg', 'jpeg', 'png', 'heic', 'webp']
//               : ['jpeg', 'jpg', 'png', 'heic', 'webp', 'pdf', 'doc'];
//
//       if (allowedExtensions.contains(extension)) {
//         return value;
//       } else {
//         CommonComponents.displaySnackBarError('Invalid file type selected');
//         return null;
//       }
//     } else {
//       return null;
//     }
//   } on PlatformException catch (e) {
//     EasyLoading.dismiss();
//     if (e.code == 'camera_access_denied' ||
//         e.code == 'gallery_access_denied' ||
//         e.code == 'photo_access_denied' ||
//         e.code == 'photo_access_restricted') {
//       await openAppSettings();
//     }
//     return null;
//   } catch (e) {
//     EasyLoading.dismiss();
//     return null;
//   }
// }

String formatDatedMMMYYYYTime(DateTime date) {
  return DateFormat('d MMM yyyy').format(date);
}

DateTime stringToDateParsedMMMYYYY(String date) {
  return DateFormat('d MMM yyyy').parse(date);
}

String formatAPI(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}

DateTime formatFromAPI(String date) {
  return DateFormat('yyyy-MM-dd').parse(date);
}

clearData() async {
  LocalDataSource localDataSource = getIt<LocalDataSource>();
  await localDataSource.clearLoginData();
}

Future<void> clearDownloadsOnLogout() async {
  final dir = await getApplicationDocumentsDirectory();
  final downloadDir = Directory('${dir.path}/downloads');
  if (await downloadDir.exists()) {
    await downloadDir.delete(recursive: true);
  }
}

String getFileName(String path) {
  File file = File(path);
  return file.path.split('/').last;
}

String getFileNameFromUrl(String url) {
  Uri uri = Uri.parse(url);
  String fileName = uri.pathSegments.last.split("/").last;
  return fileName;
}

String maskValue(String value) {
  if (value.length <= 4) {
    return value; // If the value is too short, return it as is
  }
  String maskedPart = '*' * (value.length - 4); // Mask all but the last 4 digits
  String lastFourDigits = value.substring(value.length - 4); // Get the last 4 digits
  return '$maskedPart$lastFourDigits'; // Combine the masked part with the last 4 digits
}

String getWalletTransactionDate(String dateTime) {
  /*final dateTime = DateTime.parse('2025-01-16T11:32:27.000000Z');
  final formattedDate = DateFormat('d MMM yyyy hh:mm a').format(dateTime.toLocal());
  return formattedDate;*/
  final date = DateTime.parse(dateTime);
  final now = DateTime.now();
  final localDateTime = date.toLocal();
  final today = DateTime(now.year, now.month, now.day);
  final tomorrow = today.add(const Duration(days: 1));
  final dateToCheck = DateTime(localDateTime.year, localDateTime.month, localDateTime.day);

  if (dateToCheck == today) {
    return 'Today ${DateFormat('hh:mm a').format(localDateTime)}';
  } else if (dateToCheck == tomorrow) {
    return 'Tomorrow ${DateFormat('hh:mm a').format(localDateTime)}';
  } else {
    return DateFormat('d MMM yyyy hh:mm a').format(localDateTime);
  }
}

String getInvestmentTransactionDate(String dateTime) {
  if (dateTime.isEmpty) {
    return "";
  }
  final date = DateTime.parse(dateTime);
  final localDateTime = date.toLocal();
  return DateFormat('d MMM, yyyy').format(localDateTime);
}

String getInvestmentTransactionTime(String dateTime) {
  if (dateTime.isEmpty) {
    return "";
  }
  final date = DateTime.parse(dateTime);
  final localDateTime = date.toLocal();
  return DateFormat('hh:mm a').format(localDateTime);
}

String getDateFormat(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  DateTime now = DateTime.now();
  Duration difference = now.difference(dateTime.toLocal());

  if (difference.isNegative) {
    return 'Now'; // Handle future dates
  }

  /*if (difference.inDays == 0) {
    if (difference.inHours == 0) {
      return difference.inMinutes == 0 ? 'Now' : '${difference.inMinutes} minutes ago';
    }
    return '${difference.inHours} hours ago';
  } else if (difference.inDays == 1) {
    return '1 day ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else {
    return DateFormat('dd MMM').format(dateTime);
  }*/

  if (difference.isNegative) return 'Now';

  if (difference.inDays == 0) {
    if (difference.inHours > 0) return '${difference.inHours} hours ago';
    if (difference.inMinutes > 0) return '${difference.inMinutes} minutes ago';
    return 'Now';
  }

  // if (difference.inDays == 1) return '1 day ago';
  if (difference.inDays < 7) return '${difference.inDays} days ago';

  return DateFormat('dd MMM').format(dateTime);
}

String getMyRidePaymentDepositPaymentAmount({required String dueAmount, required String frequency}) {
  double amount = double.parse(dueAmount.replaceAll(',', '')) / 2;
  int freq = int.parse(frequency);

  double result;
  if (freq == 1) {
    result = amount / 6;
  } else if (freq == 3) {
    result = amount / 2;
  } else {
    result = amount / freq;
  }

  int rounded = result.round();
  final formatter = NumberFormat.decimalPattern('en_IN');
  return formatter.format(rounded);
}

// String getMyRidePaymentDepositPaymentAmount({
//   required int dueAmount,
//   required int frequency,
// }) {
//   double amount = dueAmount / 2;
//   if (frequency == 1) {
//     return (amount / 6).round().toString();
//   } else if (frequency == 3) {
//     return (amount / 2).round().toString();
//   } else {
//     return (amount / frequency).round().toString();
//   }
// }

bool checkPaymentDue(String date) {
  if (date.isEmpty) {
    return false;
  }
  DateTime specificDate = DateTime.parse(date);

  // Get current date and time
  DateTime now = DateTime.now();

  // Remove time components by creating new DateTime objects with just the date parts
  DateTime specificDateOnly = DateTime(specificDate.year, specificDate.month, specificDate.day);
  DateTime todayOnly = DateTime(now.year, now.month, now.day);

  // Compare dates only
  if (specificDateOnly.isBefore(todayOnly)) {
    return true;
  } else if (specificDateOnly.isAfter(todayOnly)) {
    return false;
  } else {
    return false;
  }
}

String formatYAxisLabel(double value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(1)}M'; // Format as millions (e.g., 1.0M)
  } else if (value >= 1000) {
    return '${(value / 1000).toStringAsFixed(1)}K'; // Format as thousands (e.g., 1.0K)
  } else {
    return value.toStringAsFixed(0); // Format as is (e.g., 100)
  }
}
