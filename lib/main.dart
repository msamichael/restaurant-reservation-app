import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/auth_screen.dart';
import 'theme/light_mode.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: ksupabaseUrl,
    anonKey: ksupabaseAnonKey,
  );

  runApp(MyApp());
} 

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: "Restaurant",
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: AuthScreen()
    );
  }
}
