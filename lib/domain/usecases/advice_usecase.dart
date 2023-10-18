import 'package:adviser/domain/entities/advice_entity.dart';

class AdviceUsecase {
  Future sleep1() {
    return Future.delayed(const Duration(seconds: 2), () => "1");
  }

  Future<AdviceEntity> getAdviceUsecase() async {
    await sleep1();
    return AdviceEntity(text: 'example', id: 1);
  }
}
