import 'package:flutter/material.dart';
import 'package:restaurant_app/main.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/screens/main_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_or_register_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AuthState>(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot){
          // user is logged in
          if (snapshot.hasData && snapshot.data!.session != null){
            return MainScreen(
        currentScreenIndex: 0,
        selectedLocations: location,
        minPrice: 1000,
        maxPrice: 10000, 
        selectedRestaurant: restaurantName ,
        showOnlyAvailbleRestaurant: false,);
          }

          //user is not logged in
          else{
            return LoginOrRegisterScreen();
          }
        } ,));
  }
}
