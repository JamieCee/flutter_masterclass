import 'package:flutter/material.dart';
import 'package:flutter_masterclass/models/character.dart';

import '../../shared/styled_text.dart';
import '../../theme.dart';

class WeaponAndAbility extends StatefulWidget {
  const WeaponAndAbility(this.character, {super.key});

  final Character character;

  @override
  State<WeaponAndAbility> createState() => _WeaponAndAbilityState();
}

class _WeaponAndAbilityState extends State<WeaponAndAbility> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      color: AppColors.secondaryColor.withValues(alpha: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StyledHeading('Slogan'),
          StyledText(widget.character.slogan),
          const SizedBox(height: 10),

          const StyledHeading('Weapon of choice'),
          StyledText(widget.character.vocation.weapon),
          const SizedBox(height: 10),

          const StyledHeading('Unique Ability'),
          StyledText(widget.character.vocation.ability),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
