import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';


abstract class BaseLoginRepositories{
  Future<Either<Failure, UserModel>> postLogin(LoginModel loginModel);
}