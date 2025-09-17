import 'package:flutter/material.dart';
import 'package:restaurant_app/components/cart_card.dart';
import 'package:restaurant_app/components/cuisine_card.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/cuisine_list_data.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/model/service/reservation_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'cart_screen.dart';



class RestaurantCardScreen extends StatefulWidget {
  final int restaurantCardIndex;
  final restaurantList;
  Map? cloudResNo;

  RestaurantCardScreen({
    super.key,
    required this.restaurantCardIndex,
    required this.restaurantList,
    required this.cloudResNo,
  });

  @override
  State<RestaurantCardScreen> createState() => _RestaurantCardScreenState();
}

class _RestaurantCardScreenState extends State<RestaurantCardScreen> {
  Future<void> _fetchRestaurantReservationNumber() async {
    Map fxCloudResNo = await ReservationService.fetchRestaurantReservation();
    setState(() {
      widget.cloudResNo = fxCloudResNo;
    });
  }

  dynamic getRestaurantReservationNo(int index) {
    if (index == 0) {
      return widget.cloudResNo?['dalish'] ?? 0;
    } else if (index == 1) {
      return widget.cloudResNo?['muniz'] ?? 0;
    } else if (index == 2) {
      return widget.cloudResNo?['boripe'] ?? 0;
    } else if (index == 3) {
      return widget.cloudResNo?['cake city'] ?? 0;
    } else if (index == 4) {
      return widget.cloudResNo?['hand of god'] ?? 0;
    } else if (index == 5) {
      return widget.cloudResNo?['skillz'] ?? 0;
    }
  }

  List<CartCard> cartList = [];

  @override
  void initState() {
    super.initState();
    // Fetching the updated values from supabase

    _fetchRestaurantReservationNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
// Reservation Button
      floatingActionButton: Stack(
        children: [
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen(
                            cartList: cartList,
                            restaurantCardIndex: widget.restaurantCardIndex,
                            restaurantList: widget.restaurantList, cloudResNo: widget.cloudResNo,
                            
                          )));
            },
            child: Icon(Icons.add_shopping_cart),
          ),
          Positioned(
            right: 0,
            child: Container(
                padding: EdgeInsets.all(5),
                decoration:
                    ShapeDecoration(color: Colors.red, shape: CircleBorder()),
                child: Text(cartList.length.toString())),
          )
        ],
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                // Restaurant Image
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  child: Image.asset(
                      RestaurantList
                          .restaurantList[widget.restaurantCardIndex].imagePath,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.35),
                ),

                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(19),
                          ),
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Restaurant Name
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                widget.restaurantList[widget.restaurantCardIndex].name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Restaurant Location
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        widget.restaurantList[widget.restaurantCardIndex]
                            .location,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                // Restaurant Reservation Number
                Padding(
                  padding: const EdgeInsets.only(right: 19.0),
                  child: Text(
                    'Reservations: ${getRestaurantReservationNo(widget.restaurantCardIndex) ?? 0.toString()}',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // GridView of Cuisines belonging to each restaurant
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    childAspectRatio: 1.8 / 2 // Aspect Ratio of each item
                    ),
                itemCount: widget
                    .restaurantList[widget.restaurantCardIndex].cuisine.length,
                itemBuilder: (context, index) {
                  final String cuisineName = widget
                      .restaurantList[widget.restaurantCardIndex]
                      .cuisine[index]
                      .name;
                  final String imagePath = widget
                      .restaurantList[widget.restaurantCardIndex]
                      .cuisine[index]
                      .imagePath;
                  final int cuisinePrice = widget
                      .restaurantList[widget.restaurantCardIndex]
                      .cuisine[index]
                      .price;
                  final cartCard = CartCard(
                      cartName: cuisineName,
                      cartImage: imagePath,
                      cartPrice: cuisinePrice,
                      onPressed: () {},
                      cardIndex: index);

                  //returns a cuisine card with the name, image and price
                  return CuisineCard(
                    cuisineName: cuisineName,
                    imagePath: imagePath,
                    cuisinePrice: '₦$cuisinePrice',
                    onPressed: () {
                      setState(() {
                        cartList.add(cartCard);
                      });
                    },
                  );
                },
              ),
            ),
            // SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
