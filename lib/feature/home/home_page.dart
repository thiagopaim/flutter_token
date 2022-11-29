import 'package:flutter/material.dart';
import 'package:jwt/components/form/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

String _token = '';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadStore();
  }

  _loadStore() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    setState(() {
      _token = store.getString('token') ?? '';
    });
  }

  _clearStore() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    await store.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            Text(_token),
            Row(
              children: [Button(label: 'Logout', action: _clearStore)],
            ),
          ],
        ),
      ),
    );
  }
}
