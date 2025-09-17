import 'package:flutter/material.dart';
import 'package:restaurant_app/model/constants.dart';

class RestaurantCard extends StatelessWidget {
  final String restaurantName;
  final String imagePath;
  final String restaurantLocation;
  final String restaurantReservation;
  final void Function() onTap;

  const RestaurantCard(
      {super.key,
      required this.restaurantName,
      required this.imagePath,
      required this.restaurantLocation,
      required this.restaurantReservation,
      required this.onTap,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 14, top: 10, left: 11, right: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 3,
              blurRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Restaurant Image
            Container(
              height: 190,
              width: double.infinity,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              height: 15,
            ),
            // Restaurant Details 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Restaurant Name
                    Text(
                      restaurantName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          letterSpacing: 2),
                    ),
                    // Restaurant Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: kbrandColor,
                        ),
                        Text(
                          restaurantLocation,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ],
                ),
                // Restaurant Reservation
                // Text(
                //   'Reservations: $restaurantReservation',
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
