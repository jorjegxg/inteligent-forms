import 'package:dartz/dartz.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:inteligent_forms/features/profile/domain/entities/profile_entity.dart';

class ProfileUsecase {
  ProfileRepoImpl profileRepoImpl = ProfileRepoImpl();

  Future<Either<Failure, ProfileEntity>> getProfileEntity() async {
    return await profileRepoImpl.getProfile();
  }
}
