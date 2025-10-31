import 'package:flutter/material.dart';
import 'package:flutter_masterclass/screens/home/character_card.dart';
import 'package:flutter_masterclass/services/character_store.dart';
import 'package:flutter_masterclass/shared/styled_button.dart';
import 'package:flutter_masterclass/shared/styled_text.dart';
import 'package:provider/provider.dart';

import '../create/create.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Your Characters'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return Dismissible(
                        onDismissed: (direction) {
                          Provider.of<CharacterStore>(
                            context,
                            listen: false,
                          ).removeCharacter(value.characters[index]);
                        },
                        key: ValueKey(value.characters[index].id),
                        child: CharacterCard(
                          character: value.characters[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            StyledButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const CreateScreen()),
                );
              },
              child: const StyledHeading('Create New'),
            ),
          ],
        ),
      ),
    );
  }
}
