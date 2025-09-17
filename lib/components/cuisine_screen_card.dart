import 'package:flutter/material.dart';

class CuisineScreenCard extends StatelessWidget {
  final String cuisineName;
  final String imagePath;
  final String cuisinePrice;
  final void Function() onTap;


  CuisineScreenCard({
    required this.cuisineName,
    required this.imagePath,
    required this.cuisinePrice,
    required this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 3),
        height: 300,
        width: double.infinity,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(4, 4))
      ]),

        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
                  
                  
                ),
              ),
            ),
          Column ( 
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                cuisineName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(cuisinePrice,
               style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.8,
                ),
              ),
            ),
     ],)      ],
        ),
      ),
    );
  }
}