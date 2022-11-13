import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';
import '../repositories/base_login_repositories.dart';

class PostLoginUseCase implements UseCase<UserModel, LoginModel> {
  final BaseLoginRepositories baseLoginRepositories;

  const PostLoginUseCase({required this.baseLoginRepositories});

  @override
  Future<Either<Failure, UserModel>> call(LoginModel loginModel) =>
      baseLoginRepositories.postLogin(loginModel);
}
