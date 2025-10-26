import 'package:flutter/material.dart';
import 'package:flutter_masterclass/shared/styled_text.dart';
import 'package:flutter_masterclass/theme.dart';

import '../../models/character.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // available points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: widget.character.points > 0
                      ? Colors.yellow
                      : Colors.grey[300],
                ),
                const SizedBox(width: 20),
                const StyledText('Stat Points Available:'),
                const Expanded(child: SizedBox(width: 20)),

                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),

          // Allocation table
          Table(
            children: widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withValues(alpha: 0.5),
                ),
                children: [
                  // stat title
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['title']!),
                    ),
                  ),

                  // stat value
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: StyledHeading(stat['value']!),
                    ),
                  ),

                  // Down Icon
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.character.decreaseStat(stat['title']!);
                        });
                      },
                      icon: Icon(Icons.arrow_downward),
                      color: AppColors.textColor,
                    ),
                  ),

                  // Up Icon
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat['title']!);
                        });
                      },
                      icon: Icon(Icons.arrow_upward),
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
