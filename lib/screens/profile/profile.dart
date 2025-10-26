import 'package:flutter/material.dart';
import 'package:flutter_masterclass/models/character.dart';
import 'package:flutter_masterclass/screens/profile/basic_info.dart';
import 'package:flutter_masterclass/screens/profile/skill_list.dart';
import 'package:flutter_masterclass/screens/profile/stats_table.dart';
import 'package:flutter_masterclass/screens/profile/weapon_and_ability.dart';
import 'package:flutter_masterclass/shared/styled_button.dart';
import 'package:flutter_masterclass/shared/styled_text.dart';
import 'package:flutter_masterclass/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Basic info - image, vocation, description
            BasicInfo(character),

            const SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),

            // weapon and ability
            Padding(
              padding: EdgeInsets.all(16),
              child: WeaponAndAbility(character),
            ),

            // stats and skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),

            // save button
            StyledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const StyledHeading('Character was saved!'),
                    showCloseIcon: true,
                    duration: const Duration(seconds: 2),
                    backgroundColor: AppColors.secondaryColor,
                  ),
                );
              },
              child: const StyledHeading('Save Character'),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
