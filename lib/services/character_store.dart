import 'package:flutter/material.dart';
import 'package:flutter_masterclass/models/character.dart';
import 'package:flutter_masterclass/services/firestore_service.dart';

class CharacterStore extends ChangeNotifier {
  final List<Character> _characters = [];

  // getters
  get characters => _characters;

  // initial fetch
  void fetchCharactersOnce() async {
    if (_characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }
      notifyListeners();
    }
  }

  // methods
  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  void removeCharacter(Character character) async {
    await FirestoreService.deleteCharacter(character); // Remove from firebase

    _characters.remove(character); // remove from state
    notifyListeners(); // Rebuild
  }

  // save character
  Future<void> saveCharacter(Character c) async {
    await FirestoreService.updateCharacter(c);
    return;
  }
}
