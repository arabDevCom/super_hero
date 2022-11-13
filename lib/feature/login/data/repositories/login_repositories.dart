import 'package:dartz/dartz.dart';


import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/base_login_repositories.dart';
import '../data_sources/login_data_source.dart';
import '../models/login_model.dart';
import '../models/user_model.dart';

class LoginRepositories implements BaseLoginRepositories {
  final BaseNetworkInfo networkInfo;
  final BaseLoginDataSource baseLoginDataSource;

  LoginRepositories(this.networkInfo, this.baseLoginDataSource);

  @override
  Future<Either<Failure, UserModel>> postLogin(LoginModel loginModel) async {
    try {
      final UserModel = await baseLoginDataSource.postLoginData(loginModel);
      return Right(UserModel);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}