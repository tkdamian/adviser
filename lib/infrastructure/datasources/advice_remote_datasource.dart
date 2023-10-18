import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/infrastructure/models/advice_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// request a random advice from free api
/// throws a server exception if respond code is not 200
abstract class AdviceRemoteDatasource {
  Future<AdviceEntity> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client = http.Client();
  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.adviceslip.com/advice'),
        headers: {'Content-Type': 'Application/json'});

    final responseBody = json.decode(response.body);

    return AdviceModel.fromJson(responseBody['slip']);
  }
}
