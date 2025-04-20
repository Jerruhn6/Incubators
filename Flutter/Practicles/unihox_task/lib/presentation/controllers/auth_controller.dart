import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unihox_task/presentation/screens/chatbot_screen.dart';
import 'package:unihox_task/presentation/screens/login_screen.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    // Mock login logic
    await Future.delayed(Duration(seconds: 1));

    // Save login state to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);

    isLoading.value = false;
    Get.offAll(() => ChatbotScreen());
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Get.offAll(() => LoginScreen());
  }
}
