import 'package:adviser/domain/entities/advice_entity.dart';

class AdviceModel extends AdviceEntity {
  AdviceModel({required String text, required int id})
      : super(text: text, id: id);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(text: json['advice'], id: json['id']);
  }
}
