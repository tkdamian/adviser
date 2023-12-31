import 'package:adviser/domain/entities/advice_entity.dart';
import 'package:adviser/infrastructure/exceptions/advice_exception.dart';
import 'package:adviser/infrastructure/models/advice_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// request a random advice from free api
/// throws a server exception if respond code is not 200
abstract class AdviceRemoteDatasource {
  Future<AdviceEntity> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client;
  AdviceRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.adviceslip.com/advice'),
        headers: {'Content-Type': 'Application/json'});

    if (response.statusCode == 404) {
      throw AdviceNotFoundException();
    }
    if (response.statusCode != 200) {
      throw AdviceServerException();
    }

    final responseBody = json.decode(response.body);

    return AdviceModel.fromJson(responseBody['slip']);
  }
}
