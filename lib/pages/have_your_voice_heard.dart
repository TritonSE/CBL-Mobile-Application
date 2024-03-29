import 'package:call_black_line/widgets/cbl.dart';
import 'package:call_black_line/widgets/custom_navbar.dart';
import 'package:call_black_line/widgets/orange_button.dart';
import 'package:call_black_line/widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:call_black_line/widgets/custom_title.dart';
import 'package:call_black_line/widgets/header.dart';
import '../testimonial.dart';

class HaveYourVoiceHeard extends StatefulWidget {
  final bool submitted;
  const HaveYourVoiceHeard({super.key, this.submitted = false});

  @override
  State<HaveYourVoiceHeard> createState() => _HaveYourVoiceHeardState();
}

class _HaveYourVoiceHeardState extends State<HaveYourVoiceHeard> {
  bool submitted = false;

  final TextEditingController _eventTitleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  var _eventTitle;
  var _duration;
  var _address;
  var _description;
  var _time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      bottomNavigationBar: const CustomNavBar(
        currentPage: 'Seek Help',
        resourcesRoute: '/resources',
        seekHelpRoute: '/seekHelp',
        profileRoute: '/profile',
      ),
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
                  paddingTop: 8,
                  titleController: _eventTitleController),
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
                          titleController: _timeController,
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
                          titleController: _durationController,
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
                  titleController: _addressController,
                  paddingTop: 8),
              SizedBox(
                height: CBL.padding,
              ),
              TextInputField(
                  aboveText: 'Description',
                  inputText:
                      'Enter text here...',
                  inputOutlineColor: CBL.primaryOrange,
                  inputTextColor: CBL.lightGray,
                  titleController: _descriptionController,
                  paddingTop: 8),
              SizedBox(
                height: CBL.padding,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: OrangeButton(
                    buttonText: submitted ? 'Done' : 'Submit',
                    onTap: () async {
                      if (!submitted) {
                        setState(() {
                          _duration = _durationController.text;
                          _time = _timeController.text;
                          _description = _descriptionController.text;
                          _eventTitle = _eventTitleController.text;
                          _address = _addressController.text;
                          submitted = true;
                        });

                        submitted = true;

                        Testimonial testimonial = Testimonial(
                            duration: _duration,
                            eventTitle: _eventTitle,
                            address: _address,
                            time: _time,
                            description: _description);

                        final SubmitTestimonial subtestimonial =
                            SubmitTestimonial();
                        await subtestimonial.addTestimonial(testimonial);
                      } else {
                        submitted = false;
                        Navigator.pop(context);
                      }
                    }),
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
