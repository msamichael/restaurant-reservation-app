import 'package:flutter/material.dart';
import 'package:restaurant_app/model/constants.dart';

class MyButton extends StatelessWidget {

  final String text;
  final Function()? onTap;

  const MyButton({
    super.key, 
    required this.text,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: kbrandColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

// Color.fromARGB(255, 40, 40, 40),  blackish grey