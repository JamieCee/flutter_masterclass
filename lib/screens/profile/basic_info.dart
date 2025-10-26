import 'package:flutter/material.dart';
import 'package:flutter_masterclass/models/character.dart';

import '../../shared/styled_text.dart';
import '../../theme.dart';

class BasicInfo extends StatefulWidget {
  const BasicInfo(this.character, {super.key});

  final Character character;

  @override
  State<BasicInfo> createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: AppColors.secondaryColor.withValues(alpha: 0.3),
      child: Row(
        children: [
          // Image
          Image.asset(
            'assets/images/vocations/${widget.character.vocation.image}',
            width: 140,
            height: 140,
          ),

          const SizedBox(width: 20),

          // Column -> text: title, vocation
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledHeading(widget.character.vocation.title),
                StyledText(widget.character.vocation.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
