import 'package:flutter/material.dart';
import 'package:flutter_masterclass/models/character.dart';
import 'package:flutter_masterclass/models/skill.dart';
import 'package:flutter_masterclass/shared/styled_text.dart';
import 'package:flutter_masterclass/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> availableSkills;
  late Skill selSkill;

  @override
  void initState() {
    availableSkills = allSkills
        .where((skill) => skill.vocation == widget.character.vocation)
        .toList();

    selSkill = widget.character.skills.isEmpty
        ? availableSkills[0]
        : widget.character.skills.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: AppColors.secondaryColor.withValues(alpha: 0.5),
        child: Column(
          children: [
            const StyledHeading('Choose an active skill...'),
            const StyledText('Skill are unique to your vocation!'),
            const SizedBox(height: 20),

            Row(
              children: availableSkills.map((skill) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(2),
                  color: selSkill == skill ? Colors.yellow : Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        widget.character.updateSkill(skill);
                        selSkill = skill;
                      });
                    },
                    child: Image.asset(
                      'assets/images/skills/${skill.image}',
                      width: 70,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 10),

            StyledText(selSkill.name),
          ],
        ),
      ),
    );
  }
}
