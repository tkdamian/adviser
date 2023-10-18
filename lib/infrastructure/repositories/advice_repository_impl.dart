import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/advice_failures.dart';
import 'package:adviser/domain/repositories/advice_repository.dart';
import 'package:adviser/infrastructure/datasources/advice_remote_datasource.dart';
import 'package:adviser/infrastructure/exceptions/advice_exception.dart';
import 'package:dartz/dartz.dart';

class AdviceRepositoryImpl implements AdviceRepository {
  final AdviceRemoteDatasource adviceRemoteDatasource =
      AdviceRemoteDatasourceImpl();
  @override
  Future<Either<AdviceFailure, AdviceEntity>> getAdviceFromApi() async {
    try {
      final remoteAdvice =
          await adviceRemoteDatasource.getRandomAdviceFromApi();
      return Right(remoteAdvice);
    } catch (e) {
      if (e is AdviceNotFoundException) return Left(ServerNotFoundFailure());
      if (e is AdviceServerException) {
        return Left(ServerAdviceFailure());
      }
      return Left(GeneralAdviceFailure());
    }
  }
}
