import 'package:flutter/material.dart';

class profileCard extends StatelessWidget {
  final String profileName;
  final void Function()? onTap;
  final Icon icon;


  const profileCard({
    super.key,
    required this.profileName,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Material(
        elevation: 1.0,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              icon,
              SizedBox(width: 20,),
              Text(
                profileName, 
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),)
            ],
          ),
        ),
      ),
    );
  }
}