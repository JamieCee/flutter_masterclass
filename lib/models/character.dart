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
}

// Dummy Data
List<Character> characters = [
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
