import 'package:flutter/material.dart';
import 'package:flutter_masterclass/models/character.dart';
import 'package:flutter_masterclass/screens/profile/profile.dart';
import 'package:flutter_masterclass/shared/styled_text.dart';

import '../../theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset(
              'assets/images/vocations/${character.vocation.image}',
              width: 80,
            ),

            const SizedBox(width: 20),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(character.name),
                StyledText(character.vocation.title),
              ],
            ),

            const Expanded(child: SizedBox()),

            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile(character: character),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward, color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
