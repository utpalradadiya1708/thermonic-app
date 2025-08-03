// import 'package:get/get.dart';
//
// import '../../../models/user_model_response/user_model_response.dart';
// import '../../di/injector_container.dart';
// import '../repository/local_data/local_data_source.dart';
//
// class UserController extends GetxController {
//   final Rxn<UserModelResponse> userModel = Rxn<UserModelResponse>();
//   LocalDataSource localDataSource = getIt<LocalDataSource>();
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadUser();
//   }
//
//   Future<void> loadUser() async {
//     userModel.value = await localDataSource.getUserModel();
//   }
//
//   void updateUser(UserModelResponse updatedUser) {
//     userModel.value = updatedUser;
//     localDataSource.saveUserModel(updatedUser);
//   }
// }
