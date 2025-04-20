import 'package:unihox_task/data/datasources/auth_local_datasource.dart';
import 'package:unihox_task/domain/repositories/auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final AuthLocalDatasource authLocalDatasource;

  AuthRepository({required this.authLocalDatasource});

  @override
  Future<bool> isLoggedIn() async {
    return await authLocalDatasource.isLoggedIn();
  }

  @override
  Future<void> saveLoginStatus(bool isLoggedIn) async {
    return await authLocalDatasource.saveLoginStatus(isLoggedIn);
  }
}
