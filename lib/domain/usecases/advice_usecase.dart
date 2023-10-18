import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/domain/failures/advice_failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  Future sleep1() {
    return Future.delayed(const Duration(seconds: 2), () => "1");
  }

  Future<Either<AdviceFailure, AdviceEntity>> getAdviceUsecase() async {
    await sleep1();
    return Left(GeneralAdviceFailure());
    // return Right(AdviceEntity(text: 'example', id: 1));
  }
}
