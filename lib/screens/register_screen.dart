import 'package:flutter/material.dart';
import 'package:restaurant_app/components/my_button.dart';
import 'package:restaurant_app/components/my_textfield.dart';
import 'package:restaurant_app/model/data/cuisine_list_data.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'main_screen.dart';

class RegisterScreen extends StatefulWidget {
  final Function()? onTap;

  RegisterScreen({
    super.key,
    required this.onTap
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // text editing controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  final _supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {

    Future<void> _signUp() async {
  try {
    if (_passwordController.text == _confirmPasswordController.text && _passwordController.text.length>5 && _confirmPasswordController.text.length>5) {
      // Create a user
      final AuthResponse response = await _supabase.auth.signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.user != null) {
        final userId = response.user!.id;
        final username = _usernameController.text.trim();
        final email = _emailController.text.trim();
        


        // Insert into profiles table
        final profileResponse = await _supabase
            .from('profiles')
            .insert({
              'id': userId,
              'username': username,
              'email': email,
              'user_reservations': userReservations,
              'user_cuisine_reservations': userCuisineReservations
            });
        
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => MainScreen(
        currentScreenIndex: 0,
        selectedLocations: location,
        minPrice: 1000,
        maxPrice: 10000, 
        selectedRestaurant: restaurantName ,
        showOnlyAvailbleRestaurant: false,)));
         
        
      } else {
        // Handle sign-up error
        throw Exception('Sign-up failed');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords must be greater than 5 characters and must match!'), backgroundColor: Colors.red),
      );
    }
  } on AuthException catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error.message), backgroundColor: Colors.red),
    );
  } catch (error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error occurred, please retry: $error'), backgroundColor: Colors.red),
    );
  }
}
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(height: 30),
              //logo
              const Icon(
                Icons.lock,
                size: 50,
              ),
              const SizedBox(height: 50),
              // Let's create an account for you!
              Text(
                'Let\'s create an account for you!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              
              const SizedBox(
                height: 25,
              ),
               
              // username Textfield
              MyTextField(
                  controller: _usernameController,
                  hintText: 'Username',
                  obscureText: false),
              
              const SizedBox(
                height: 10,
              ),
              // email Textfield
              MyTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  obscureText: false),
              
              const SizedBox(
                height: 10,
              ),
              //password Textfield
              MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  obscureText: true),
                  const SizedBox(height: 10,),
              //Confirm password Textfield
              MyTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true),
                  const SizedBox(height: 10,),

                 
                const SizedBox(height: 50,),
              // sign in button
              MyButton(
                text: 'Sign Up',
                onTap: _signUp,
              ),
              
              SizedBox(height: 10,),
              // Already have an account? login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Login now',
                      style: TextStyle(
                        color: Colors.blue,
                      fontWeight: FontWeight.bold),),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
