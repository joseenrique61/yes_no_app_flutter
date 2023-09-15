import 'package:yes_no_app/domain/entities/message.dart';

class PokemonModel {
  final String name;
  final String frontDefault;

  const PokemonModel({required this.name, required this.frontDefault});

  factory PokemonModel.fromJsonMap({required Map<String, dynamic> json}) =>
      PokemonModel(
          name: json["name"], frontDefault: json["sprites"]["front_default"]);

  Message toMessageEntity() =>
      Message(text: name, fromWho: FromWho.hers, imageUrl: frontDefault);
}
