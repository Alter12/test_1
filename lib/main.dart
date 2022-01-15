import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_1/authorization.dart';
import 'package:test_1/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  GetIt.instance.registerSingletonAsync<SharedPreferences>(() async {
    return SharedPreferences.getInstance();
  });

  await GetIt.instance.allReady();

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pin Code'),
          backgroundColor: Colors.green[600],
        ),
        body: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            },
            child: const Text(
              'Registration',
              style: TextStyle(fontSize: 15),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstRoute()),
              );
            },
            child: const Text(
              'Authorization',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Authorization(),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Registration(),
      ),
    );
  }
}
