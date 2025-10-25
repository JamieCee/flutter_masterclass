import 'package:flutter/material.dart';
import 'package:flutter_masterclass/models/character.dart';
import 'package:flutter_masterclass/screens/create/vocation_card.dart';
import 'package:flutter_masterclass/shared/styled_button.dart';
import 'package:flutter_masterclass/shared/styled_text.dart';
import 'package:flutter_masterclass/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

import '../../models/vocation.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController
        .dispose(); // Clear the controller when the widget is disposed to free up memory
    _sloganController.dispose();
    super.dispose();
  }

  // Handling Vocation Selection
  Vocation selVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selVocation = vocation;
    });
  }

  // Form Submission Function
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty ||
        _sloganController.text.trim().isEmpty) {
      //TODO: Show error dialog
      return;
    }

    characters.add(
      Character(
        name: _nameController.text,
        slogan: _sloganController.text,
        vocation: selVocation,
        id: uuid.v4(),
      ),
    );

    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle('Character Creation'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // welcome message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Welcome, new player..')),
              const Center(
                child: StyledText(
                  'Create a name & slogan, for your character.',
                ),
              ),
              const SizedBox(height: 30),

              // form input fields
              TextField(
                controller: _nameController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_2),
                  label: StyledText('Character Name'),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
                cursorColor: AppColors.textColor,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.chat),
                  label: StyledText('Character Slogan'),
                ),
              ),
              const SizedBox(height: 30),

              // Select Vocation Title
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Choose a vocation')),
              const Center(
                child: StyledText('This determines your available skills'),
              ),
              const SizedBox(height: 30),

              // vocation cards
              VocationCard(
                selected: selVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selVocation == Vocation.wizard,
                onTap: updateVocation,
                vocation: Vocation.wizard,
              ),
              VocationCard(
                selected: selVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),

              // Good Luck Message
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading('Good Luck!')),
              const Center(child: StyledText('And enjoy the adventure!')),
              const SizedBox(height: 30),

              // Submit Button
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: const StyledHeading('Create Character'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
