import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:call_black_line/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';

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
      appBar: Header(
        onBackButtonPressed: () {},
      ),
      bottomNavigationBar: const CustomNavBar(currentPage: 'Resources'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: CBL.padding,
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
                            color: Color(CBL.success),
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 31,
                        ),
                        Expanded(
                          child: CustomTitle(
                            text: 'Your Feedback is Confirmed!',
                            topPadding: 24.5,
                            bottomPadding: CBL.padding,
                          ),
                        )
                      ],
                    )
                  : CustomTitle(
                      text: 'Have Your Voice Heard',
                      topPadding: 24.5,
                      bottomPadding: CBL.padding,
                    ),
              TextInputField(
                  aboveText: 'Event Title',
                  inputText: 'Event Title',
                  inputOutlineColor: CBL.primaryOrange,
                  inputTextColor: CBL.lightGray,
                  paddingTop: 8),
              SizedBox(
                height: CBL.padding,
              ),
              Row(
                children: [
                  Flexible(
                      child: TextInputField(
                          icon: Icons.timer_outlined,
                          aboveText: 'Time',
                          inputOutlineColor: CBL.primaryOrange,
                          inputTextColor: CBL.black,
                          inputText: '3:00 PM',
                          paddingTop: 8)),
                  const SizedBox(
                    width: 11,
                  ),
                  Flexible(
                      child: TextInputField(
                          icon: Icons.hourglass_bottom,
                          aboveText: 'Duration',
                          inputOutlineColor: CBL.primaryOrange,
                          inputTextColor: CBL.black,
                          inputText: '1 hr 45 mins',
                          paddingTop: 8)),
                ],
              ),
              SizedBox(
                height: CBL.padding,
              ),
              TextInputField(
                  icon: Icons.location_pin,
                  aboveText: 'Event Location',
                  inputText: 'XXX St, CA, 94121',
                  inputOutlineColor: CBL.primaryOrange,
                  inputTextColor: CBL.black,
                  paddingTop: 8),
              SizedBox(
                height: CBL.padding,
              ),
              TextInputField(
                  aboveText: 'Description',
                  inputText:
                      'Lorem ipsum dolor sit amet consectetur. Molestie neque faucibus viverra ut nisl nec eleifend.',
                  inputOutlineColor: CBL.primaryOrange,
                  inputTextColor: CBL.lightGray,
                  paddingTop: 8),
              SizedBox(
                height: CBL.padding,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: OrangeButton(
                    buttonText: submitted ? 'Done' : 'Submit',
                    onTap: () => setState(() => submitted = true)),
              ),
              SizedBox(
                height: CBL.padding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
