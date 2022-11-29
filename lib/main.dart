import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jwt/core/environment.dart';
import 'package:jwt/core/routes.dart';
import 'package:jwt/providers/loading_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: Environment.fileName);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => LoadingProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JWT Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: routes,
    );
  }
}
