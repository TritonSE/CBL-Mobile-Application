import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../user.dart';
import 'package:firebase_core/firebase_core.dart';
import '../testimonial.dart';
import '../affirmation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is a sample home page for the Call BlackLine application',
            ),
            ElevatedButton(
                onPressed: () {
                  //test 10 times
                  UserRepository userRepository = UserRepository();
                  UserData user = UserData(
                      username: 'John Doe',
                      phoneNumber: '8583165432',
                      email: 'johndoe@example.com');

                  UserData userWrongPswd = UserData(
                      username: 'sdf Doe',
                      phoneNumber: '8583165432',
                      email: 'bobjoe@example.com');

                  UserData userWrongEmail = UserData(
                      username: 'Billy Bob',
                      phoneNumber: '8583165432',
                      email: 'sdlsdkjf');

                  UserData userWrongPhone = UserData(
                      username: 'Billy Joel',
                      phoneNumber: '1',
                      email: 'a@example.com');

                  UserData user2 = UserData(
                      username: 'Maggie',
                      phoneNumber: '1234567899',
                      email: 'maggie@example.com');

                  UserData userDuplicate = UserData(
                      username: 'John Doe',
                      phoneNumber: '8583165432',
                      email: 'johndoe@example.com');

                  // userRepository.addUser(user);
                  // userRepository.addUser(userWrongPswd);
                  // userRepository.addUser(userWrongEmail);
                  // userRepository.addUser(userWrongPhone);
                  // userRepository.addUser(user2);
                  // userRepository.addUser(userDuplicate);
                },
                child: const Text('Add User')),
            ElevatedButton(
                onPressed: () {
                  SubmitTestimonial submitTestimonial = SubmitTestimonial();
                  Testimonial testimonial = Testimonial(
                      eventTitle: "Test",
                      time: DateTime.now().millisecondsSinceEpoch.toString(),
                      duration: "10",
                      address: 'as',
                      description: 'This is a test');
                  Testimonial testimonial2 = Testimonial(
                      eventTitle: "Test",
                      time: DateTime.now().millisecondsSinceEpoch.toString(),
                      duration: "10",
                      address: 'as',
                      description: 'This is a test');
                  submitTestimonial.addTestimonial(testimonial);
                  submitTestimonial.addTestimonial(testimonial2);
                },
                child: const Text('Add Testimonial')),
            ElevatedButton(
                onPressed: () {
                  UserRepository userRepository = UserRepository();
                  userRepository.deleteUser("FfoLFTfOcb1GjUKe02DU");
                  userRepository.deleteUser("doesn't exist");
                },
                child: const Text('Delete User')),
            ElevatedButton(
                onPressed: () {
                  SubmitTestimonial submitTestimonial = SubmitTestimonial();
                  submitTestimonial.deleteTestimonial("UUzkdbXVUXmVZwAtBbEr");
                  submitTestimonial.deleteTestimonial("doesn't exist");
                },
                child: const Text('Delete Testimonial')),
            ElevatedButton(
                onPressed: () async {
                  AffirmationRepository affirmations = AffirmationRepository();
                  Affirmation affirmationWithRealId1 = Affirmation(
                      created: DateTime.now().millisecondsSinceEpoch,
                      uid: "0p4AgrUHXJnLtCe4owG6",
                      text: "Test Text 1");
                  Affirmation affirmationWithRealId2 = Affirmation(
                      created: DateTime.now().millisecondsSinceEpoch,
                      uid: "B4Ww1lg1o9i5J1TYxvJ9",
                      text: "Test Text 2");
                  Affirmation affirmationWithEmptyId = Affirmation(
                      created: DateTime.now().millisecondsSinceEpoch,
                      uid: "",
                      text: "Test Text 3");
                  Affirmation affirmationWithFakeId = Affirmation(
                      created: DateTime.now().millisecondsSinceEpoch,
                      uid: "ThisIdDoesntExist",
                      text: "Test Text 4");
                  affirmations.addAffirmation(affirmationWithRealId1);
                  affirmations.addAffirmation(affirmationWithRealId2);
                  affirmations.addAffirmation(affirmationWithEmptyId);
                  affirmations.addAffirmation(affirmationWithFakeId);
                  var al = await affirmations.getAffirmationList();
                  assert(al.length >= 4);
                },
                child: const Text('Create Affirmation')),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
