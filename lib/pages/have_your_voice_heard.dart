import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:call_black_line/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';

int primaryOrange = int.parse('#DF742C'.replaceAll('#', '0xff'));
int lightGray = int.parse('#B4B4B4'.replaceAll('#', '0xff'));
int black = int.parse('#000000'.replaceAll('#', '0xff'));
int green = int.parse('#3BB966'.replaceAll('#', '0xff'));

class HaveYourVoiceHeard extends StatefulWidget {
  final bool submitted;
  const HaveYourVoiceHeard({super.key, this.submitted = false});

  @override
  State<HaveYourVoiceHeard> createState() => _HaveYourVoiceHeardState();
}

class _HaveYourVoiceHeardState extends State<HaveYourVoiceHeard> {
  bool submitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const Header(),
      bottomNavigationBar: const CustomNavBar(currentPage: 'Resources'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            children: [
              submitted
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Color(green),
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 31,
                        ),
                        const Expanded(
                          child: CustomTitle(
                            text: 'Your Feedback is Confirmed!',
                            topPadding: 24.5,
                            bottomPadding: 16,
                          ),
                        )
                      ],
                    )
                  : const CustomTitle(
                      text: 'Have Your Voice Heard',
                      topPadding: 24.5,
                      bottomPadding: 16,
                    ),
              TextInputField(
                  aboveText: 'Event Title',
                  inputText: 'Event Title',
                  inputOutlineColor: primaryOrange,
                  inputTextColor: lightGray,
                  paddingTop: 8),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Flexible(
                      child: TextInputField(
                          icon: Icons.timer_outlined,
                          aboveText: 'Time',
                          inputOutlineColor: primaryOrange,
                          inputTextColor: black,
                          inputText: '3:00 PM',
                          paddingTop: 8)),
                  const SizedBox(
                    width: 11,
                  ),
                  Flexible(
                      child: TextInputField(
                          icon: Icons.hourglass_bottom,
                          aboveText: 'Duration',
                          inputOutlineColor: primaryOrange,
                          inputTextColor: black,
                          inputText: '1 hr 45 mins',
                          paddingTop: 8)),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextInputField(
                  icon: Icons.location_pin,
                  aboveText: 'Event Location',
                  inputText: 'XXX St, CA, 94121',
                  inputOutlineColor: primaryOrange,
                  inputTextColor: black,
                  paddingTop: 8),
              const SizedBox(
                height: 16,
              ),
              TextInputField(
                  aboveText: 'Description',
                  inputText:
                      'Lorem ipsum dolor sit amet consectetur. Molestie neque faucibus viverra ut nisl nec eleifend.',
                  inputOutlineColor: primaryOrange,
                  inputTextColor: lightGray,
                  paddingTop: 8),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: OrangeButton(
                    buttonText: submitted ? 'Done' : 'Submit',
                    onTap: () => setState(() => submitted = true)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
