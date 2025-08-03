import 'dart:ui';

import '../../theme/color_constants.dart';

class AppConstants {
  /// Text Limit
  static final int mobileNumber = 8;
  static final int minMobileNumberLength = 8;
  static final int referralCode = 16;
  static final int email = 255;
  static final int fullName = 70;
  static final int password = 15;
  static final int postalCode = 5;
  static final int minPasswordLength = 8;
  static final int minMaxNationalId = 10;
  static final int amountMax = 10;
  static final int drivingLicenseNoLength = 16;

  static const animationDuration = Duration(milliseconds: 200);

  static String imagePath = '';
  static String privacyPolicy = '';
  static String faQ = '';
  static String termsConditions = '';
  static String igLink = '';
  static String tgLink = '';
  static String fbLink = '';
  static String whatsappLink = '';
  static String supportEmail = '';
  static String supportNumber = '';
  static String aboutUs = '';
  // static String supportPhone = '';

  static String selectedLanguage = "";

  ///"0 = Sacco, 1 = Investment, 2 = Both"

  static const listLocale = <Locale>[Locale('en', 'US'), Locale('ar', 'AE')];

  static final List<String> genderItems = ['Male', 'Female', 'Other'];

  static final dummyVideoUrl1 =
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';
  static final dummyVideoUrl2 =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4';
  static final dummyVideoUrl3 =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4';
  static final dummyVideoUrl4 =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4';
  static final dummyVideoUrl5 =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4';
  static final dummyVideoUrl6 =
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4';

  /*static final List<String> relationShipItems = [
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Wife',
  ];*/

  static final List<List<Color>> gradients = [
    [ColorConstants.gradient1, ColorConstants.gradient2],
    [ColorConstants.gradient3, ColorConstants.gradient4],
    [ColorConstants.gradient5, ColorConstants.gradient6],
    [ColorConstants.gradient7, ColorConstants.gradient8],
    [ColorConstants.gradient9, ColorConstants.gradient10],
  ];

  static final List<String> employmentStatus = [
    'Employed - Full Time',
    'Employed - Part Time',
    'Self-Employed',
    'Government Employee',
    'Business',
    'Freelancer/Contractor',
    'Military Personnel',
    'Retired',
    'Not Applicable',
  ];

  static final List<String> corporateSponsorItems = [
    'Individual',
    'Own Company',
    'Safaricom Sacco',
    'Diaspora Client',
  ];

  static final DateTime firstDate = DateTime(1900, 1, 1);
  static final DateTime lastDate = DateTime(
    DateTime.now().year - 18,
    DateTime.now().month,
    DateTime.now().day,
  );
}

class ArgumentsConst {
  static final String isFrom = "isFrom";
  static final String params = "params";
  static final String otp = "otp";
  static final String paymentUrl = "payment_url";
  static final String mobileNumber = "mobileNumber";
  static final String courseType = "courseType";
  static final String orderId = "order_id";
  static final String questionId = "question_id";
  static final String answerId = "answer_id";
  static final String navigateFromPayment = "navigateFromPayment";
  static final String paymentStatus = "paymentStatus";
  static final String price = "price";
  static final String selectTab = "selectTab";
  static final String correctAnswers = "correctAnswers";
  static final String totalQuestions = "totalQuestions";
  static final String isFromEditProfile = "isFromEditProfile";
  static final String isFromExam = "isFromExam";
  static final String countryCode = "countryCode";
  static final String createdBy = "created_by";
  static final String isFromSetting = "isFromSetting";
  static final String courseName = "courseName";
  static final String courseId = "courseId";
  static final String examId = "examId";
  static final String chapterId = "chapterId";
  static final String gradeId = "gradeId";
  static final String streamId = "streamId";
  static final String isFromTabScreen = "isFromTabScreen";
  static final String chapter = "chapter";
  static final String courseTitle = "courseTitle";
  static final String instructor = "instructor";
  static final String videoUrl = "videoUrl";
  static final String videoId = "videoId";
  static final String filePath = "filePath";
  static final String topicId = "topicId";
  static final String subjectImage = "subjectImage";
  static final String subject = "subject";
  static final String grade = "grade";
  static final String stream = "stream";
  static final String semester = "semester";
  static final String subTotal = "subTotal";
  static final String type = "type";
  static final String id = "id";
  static final String trainerId = "trainerId";
  static final String subjectId = "subjectId";
}

class ArgumentsValueConst {
  static final String investmentCooperativeMemberRegisterDetails =
      "investment_cooperative_member_register_details";
  static final String saccoPreview = "sacco_preview";
  static final String uploadDocument = "upload_document";
  static final String smartCarLeasing = "smart_car_leasing";
  static final String kycDetail = "kyc_detail";
  static final String saveToInvest = "save_to_invest";
  static final String plotOfLandLikeMyRideAccount =
      "plot_of_land_like_my_rideAccount";
  static final String nomineeList = "nominee_list";
  static final String nomineePreview = "nominee_preview";
  static final String nomineeEdit = "nominee_edit";
  static final String investmentPayment = "investment_payment";
  static final String carLoan = "car_loan";
}
