import 'dart:developer';

import 'package:call_black_line/widgets/orange_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/pages/affirmation_sent.dart';
import "package:drop_cap_text/drop_cap_text.dart";
import 'package:call_black_line/affirmation.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class UsePreexistingAffirmation extends StatefulWidget {
  const UsePreexistingAffirmation({super.key});

  @override
  State<UsePreexistingAffirmation> createState() =>
      _UsePreexistingAffirmationState();
}

class _UsePreexistingAffirmationState extends State<UsePreexistingAffirmation> {
  late List<AffirmationWithUsername> affirmations = [];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final affirmationRepository = AffirmationRepository();
    affirmations = await affirmationRepository.getAffirmationList();
    log('Loaded list of affirmations of length: ${affirmations.length}');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const Header(),
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Resources',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            const CustomTitle(text: 'Affirmation'),
            const SizedBox(
              width: 400,
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Magna mattis lorem auctor tortor ut nunc lacus at in. Tellus tempor a habitasse ac augue eu.',
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 24),
                child: SizedBox(
                    height: 380,
                    width: 400,
                    child: ListView.separated(
                        itemCount: affirmations.length,
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: selectedIndex == index
                                          ? const Color(0xFFDF742C)
                                          : const Color(0xFFFFC596),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 10.0),
                                      child: Column(children: [
                                        DropCapText(affirmations[index].text,
                                            style: TextStyle(
                                                color: selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 21,
                                                height: 1.1),
                                            dropCapPosition:
                                                DropCapPosition.end,
                                            dropCap: DropCap(
                                                width: 25,
                                                height: 25,
                                                child: IconButton(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  icon: Image.asset(
                                                      'assets/images/edit.png'),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        TextEditingController
                                                            controller =
                                                            TextEditingController(
                                                                text: affirmations[
                                                                        index]
                                                                    .text);
                                                        return AlertDialog(
                                                          title: const Text(
                                                              "Edit Affirmation"),
                                                          content: TextField(
                                                            controller:
                                                                controller,
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  "Enter new text here",
                                                            ),
                                                          ),
                                                          actions: <Widget>[
                                                            TextButton(
                                                              child: const Text(
                                                                  "Cancel"),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                            TextButton(
                                                              child: const Text(
                                                                  "Save"),
                                                              onPressed: () {
                                                                setState(() {
                                                                  affirmations[
                                                                              index]
                                                                          .text =
                                                                      controller
                                                                          .text;
                                                                });
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ))),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'By: ${affirmations[index].username}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                              textAlign: TextAlign.left,
                                            ))
                                      ]))));
                        }))),
            Align(
                alignment: Alignment.centerRight,
                child: OrangeButton(
                  buttonText: 'Submit',
                  width: 110,
                  onTap: () {
                    AffirmationRepository affirmationRepository =
                        AffirmationRepository();
                    Affirmation affirmation = Affirmation(
                        text: affirmations[selectedIndex].text,
                        uid: auth.currentUser?.uid ?? '',
                        created: DateTime.now().millisecondsSinceEpoch);
                    affirmationRepository.addAffirmation(affirmation);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AffirmationSent()));
                  },
                ))
          ],
        ),
      ),
    );
  }
}
