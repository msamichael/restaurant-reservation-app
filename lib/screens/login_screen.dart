import 'package:flutter/material.dart';
import 'package:restaurant_app/components/my_button.dart';
import 'package:restaurant_app/components/my_textfield.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTap;

  LoginScreen({
    super.key,
    required this.onTap
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // text editing controllers
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _usernameController = TextEditingController();

  final _supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {

    // sign user in method
  Future<void> _signIn() async{
    try{
      final AuthResponse response = await _supabase.auth.signInWithPassword(
        email: _emailController.text,
        password: _passwordController.text);

         final user = response.user;
       
      if (user != null){
         Navigator.push(
                context, 
                MaterialPageRoute(builder: (context)=>MainScreen(
        currentScreenIndex: 0,
        selectedLocations: location,
        minPrice: 1000,
        maxPrice: 10000, 
        selectedRestaurant: restaurantName ,
        showOnlyAvailbleRestaurant: false,)),
                );

      }


      
    } on AuthException catch(error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message), backgroundColor: Colors.red,));
  } catch (error){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error occured, please retry.'), backgroundColor: Colors.red,));
  }
       
  }
    
    
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color.fromARGB(255, 20, 20, 20),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(height: 30),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
                color:kbrandColor,
                // Color.fromARGB(255, 50, 52, 61) darkish blue
                // Color.fromARGB(255, 221, 158, 20), goldish brown
                
              ),
              const SizedBox(height: 50),
              // welcome back, you've been missed
              Text(
                'Welcome back you\'ve been missed!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              
              const SizedBox(
                height: 25,
              ),
               
              // username Textfield
              MyTextField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  obscureText: false),
              
              const SizedBox(
                height: 10,
              ),
              //password Textfield
              MyTextField(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  obscureText: true),
                  const SizedBox(height: 10,),

                  // // forgot password?
                  // Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Text(
                  //        'Forgot Password?',
                  //       style: TextStyle(color: Colors.grey[600]),
                  //     )
                  //   ],
                  // ),),
        
                const SizedBox(height: 50,),
              // sign in button
              MyButton(
                text: 'Sign In',
                onTap: _signIn,
              ),
              
              SizedBox(height: 10,),
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(width: 4,),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      'Register now',
                      style: TextStyle(color: Colors.blue,
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
