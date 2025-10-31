import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_masterclass/models/skill.dart';
import 'package:flutter_masterclass/models/stats.dart';
import 'package:flutter_masterclass/models/vocation.dart';

class Character with Stats {
  // Constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // Fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false; // Underscore means private variable

  // methods
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // getters
  bool get isFav => _isFav;

  // character to firestore
  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statsAsMap,
      'points': points,
    };
  }

  // firestone to character
  factory Character.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;

    Character character = Character(
      name: data['name'],
      slogan: data['slogan'],
      vocation: Vocation.values.firstWhere(
        (v) => v.toString() == data['vocation'],
      ),
      id: snapshot.id,
    );

    // Update the skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkill(skill);
    }

    if (data['isFav'] == true) {
      character.toggleIsFav();
    }

    // assign stats & points
    character.setStats(points: data['points'], stats: data['stats']);

    return character;
  }
}
