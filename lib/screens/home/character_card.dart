import 'package:flutter/material.dart';
import 'package:flutter_masterclass/shared/styled_text.dart';

import '../../theme.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final String character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            StyledText(character),

            const Expanded(child: SizedBox()),

            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward, color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
