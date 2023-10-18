import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/advice_failures.dart';
import 'package:adviser/domain/repositories/advice_repository.dart';
import 'package:adviser/infrastructure/repositories/advice_repository_impl.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  final AdviceRepository adviceRepository = AdviceRepositoryImpl();

  Future<Either<AdviceFailure, AdviceEntity>> getAdviceUsecase() async {
    return adviceRepository.getAdviceFromApi();
  }
}
