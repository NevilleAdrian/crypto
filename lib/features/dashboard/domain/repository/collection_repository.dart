import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/collection.dart';
import '../../data/repository_contracts/collection_contract.dart';

abstract class CollectionRepository {
  Future<Either<Failure, List<Collection>>> getLatest();
  Future<Either<Failure, List<Collection>>> getTrending();
  Future<Either<Failure, List<Collection>>> getTopVerifiedd();
}

class CollectionRepositoryImpl implements CollectionRepository {
  final CollectionData dataSource;

  CollectionRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Collection>>> getLatest() async {
    try {
      var resp = await dataSource.fetchLatest();
      return Right(resp);
    } catch (e) {
      return Left(handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, List<Collection>>> getTopVerifiedd() async {
    try {
      var resp = await dataSource.fetchTopverified();
      return Right(resp);
    } catch (e) {
      return Left(handleException(e as Exception));
    }
  }

  @override
  Future<Either<Failure, List<Collection>>> getTrending() async {
    try {
      var resp = await dataSource.fetchTrending();
      return Right(resp);
    } catch (e) {
      return Left(handleException(e as Exception));
    }
  }
}
