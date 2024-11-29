import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WillPopScope Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // دالة للتحقق من الرجوع
  Future<bool> _onWillPop() async {
    // Show confirmation dialog
    return (await showDialog(
          context: context, // now context is available here
          builder: (context) => AlertDialog(
            title: const Text('هل متأكد إنك عايز تخرج؟'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), // "No" - don't pop
                child: const Text('لا'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // "Yes" - allow pop
                child: const Text('نعم'),
              ),
            ],
          ),
        )) ??
        false; // Default to false if no choice is made
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop, // Bind the _onWillPop function to WillPopScope
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مثال على WillPopScope'),
        ),
        body: const Center(
          child: Text('اضغط زرار الرجوع علشان تجرب الفحص'),
        ),
      ),
    );
  }
}
