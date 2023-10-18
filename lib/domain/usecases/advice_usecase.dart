import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/advice_failures.dart';
import 'package:adviser/domain/repositories/advice_repository.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  final AdviceRepository adviceRepository;
  AdviceUsecase({required this.adviceRepository});

  Future<Either<AdviceFailure, AdviceEntity>> getAdviceUsecase() async {
    return adviceRepository.getAdviceFromApi();
  }
}
