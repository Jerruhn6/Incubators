import 'package:unihox_task/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase({required this.repository});

  Future<void> execute(bool isLoggedIn) async {
    await repository.saveLoginStatus(isLoggedIn);
  }
}
