
abstract class IAuthRepository {
  Future<bool> isLoggedIn();
  Future<void> saveLoginStatus(bool isLoggedIn);
}
