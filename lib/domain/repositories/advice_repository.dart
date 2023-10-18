import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/advice_failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepository {
  Future<Either<AdviceFailure, AdviceEntity>> getAdviceFromApi();
}
