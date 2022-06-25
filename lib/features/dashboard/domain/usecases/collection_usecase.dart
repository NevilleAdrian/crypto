import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/collection.dart';
import '../repository/collection_repository.dart';

class LatestUseCase {
  final CollectionRepository repository;

  LatestUseCase({required this.repository});

  Future<Either<Failure, List<Collection>>> latest(
      String email, String password) async {
    return await repository.getLatest();
  }

  Future<Either<Failure, List<Collection>>> trending(
      String email, String password) async {
    return await repository.getTrending();
  }

  Future<Either<Failure, List<Collection>>> verified(
      String email, String password) async {
    return await repository.getTopVerifiedd();
  }
}
