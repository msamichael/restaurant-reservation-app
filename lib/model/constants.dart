import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Color Constants
const kbrandColor = const Color.fromARGB(255, 35, 34, 34);
const kgoldBrown = const Color.fromARGB(255, 251, 196, 27);

String get ksupabaseUrl => _requiredEnv('SUPABASE_URL');
String get ksupabaseAnonKey => _requiredEnv('SUPABASE_ANON_KEY');

String _requiredEnv(String key) {
  final value = dotenv.env[key];
  if (value == null || value.trim().isEmpty) {
    throw StateError(
      'Missing environment variable: $key. Add it to your .env file.',
    );
  }
  return value;
}
