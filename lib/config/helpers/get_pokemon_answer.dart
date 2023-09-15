import 'dart:math';
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/pokemon_model.dart';

class GetPokemonAnswer {
  final Dio _dio = Dio();

  Future<Message> getAnswer() async {
    final pokemons = await _dio.get('https://pokeapi.co/api/v2/pokemon/');
    final int pokemonNum = Random().nextInt(pokemons.data["count"] - 1) + 1;

    final pokemon =
        await _dio.get("https://pokeapi.co/api/v2/pokemon-form/$pokemonNum/");

    final pokemonModel = PokemonModel.fromJsonMap(json: pokemon.data);

    return pokemonModel.toMessageEntity();
  }

  void getAnotherAnswer() {}
}
