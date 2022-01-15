import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 're_enter.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pin code',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pin code'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Enter PIN Code ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinCodeTextField(
                    maskCharacter: '*',
                    autofocus: true,
                    hideDefaultKeyboard: true,
                    controller: _textEditingController,
                    maxLength: 4,
                    highlight: true,
                    hasUnderline: false,
                    hideCharacter: true,
                    pinBoxHeight: 30,
                    pinBoxRadius: 360,
                    pinBoxColor: Colors.white,
                    highlightPinBoxColor: Colors.grey,
                    onDone: (text) async {
                      String password = _textEditingController.text;


                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdRoute(password),
                        ),
                      );
                    },
                    highlightColor: Colors.black,
                    defaultBorderColor: Colors.black,
                    hasTextBorderColor: Colors.black,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute(String password,   {Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ReEnter(),
      ),
    );
  }
}
