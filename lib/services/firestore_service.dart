import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/character.dart';

class FirestoreService {
  static final ref = FirebaseFirestore
      .instance // reference to the firestore
      .collection('characters')
      .withConverter(
        fromFirestore: Character
            .fromFireStore, // converts the response from firestore into a character factory
        toFirestore: (Character c, _) => c
            .toFireStore(), // takes a character and converts it into storage in firebase
      );

  // add a new character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  // retrieve characters once
  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

  // update a character
  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsAsMap,
      'points': character.points,
      'skills': character.skills.map((s) => s.id).toList(),
      'isFav': character.isFav,
    });
  }

  // delete characters
  static Future<void> deleteCharacter(Character character) async {
    await ref.doc(character.id).delete();
  }
}
