import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'registration.dart';

class ReEnter extends StatefulWidget {
  const ReEnter({
    Key? key,
  }) : super(key: key);

  @override
  _ReEnterState createState() => _ReEnterState();
}

class _ReEnterState extends State<ReEnter> {
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
                'Re-Enter PIN Code ',
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
                    onDone: (text) {


                      String password = _textEditingController.text;

                      GetIt.instance
                          .get<SharedPreferences>()
                          .setString('PWD', password)
                          .then(
                        (status) {
                          Fluttertoast.showToast(
                            msg: status ? 'Password saved!' : 'Error happened!',
                          );

                          Navigator.of(context).pop();
                        },
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
