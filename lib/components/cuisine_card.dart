import 'package:flutter/material.dart';
import 'package:restaurant_app/model/constants.dart';

class CuisineCard extends StatelessWidget {
  final String cuisineName;
  final String imagePath;
  final String cuisinePrice;
  final void Function()? onPressed;

  CuisineCard(
      {required this.cuisineName,
      required this.imagePath,
      required this.cuisinePrice,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3,
            spreadRadius: 1,
            offset: Offset(5, 5)),
      ]),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cuisine Image
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
          // Cuisine Name and Price
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cuisineName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical:3.0),
                child: Text(cuisinePrice),
              ),
              Center(
                
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Add to Cart'),
                        Icon(Icons.add_shopping_cart_rounded)
                      ],
                    ),
                    style: ButtonStyle( 
                      backgroundColor: MaterialStateProperty.all(kbrandColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap) ,
                    onPressed: onPressed,
                    
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
