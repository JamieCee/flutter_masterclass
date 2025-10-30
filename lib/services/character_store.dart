import 'package:flutter/material.dart';
import 'package:flutter_masterclass/models/character.dart';

import '../models/vocation.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [
    Character(
      id: '1',
      name: 'Klara',
      vocation: Vocation.wizard,
      slogan: 'Kapumf!',
    ),
    Character(
      id: '2',
      name: 'Zeus',
      vocation: Vocation.junkie,
      slogan: 'Kapooof!',
    ),
    Character(
      id: '3',
      name: 'Marcel',
      vocation: Vocation.ninja,
      slogan: 'Expert Fingering',
    ),
    Character(
      name: 'Mercy',
      slogan: 'The Mighty One',
      vocation: Vocation.raider,
      id: '4',
    ),
  ];

  // getters
  get characters => _characters;

  // methods
  void addCharacter(Character character) {
    _characters.add(character);
    notifyListeners();
  }

  void removeCharacter(Character character) {
    print('Removing character: ${character.name}');
  }

  // _characters.remove(character);
  // notifyListeners();
}
