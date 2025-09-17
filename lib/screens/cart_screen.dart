// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:restaurant_app/components/cart_card.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/cuisine_list_data.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/model/service/reservation_service.dart';

class CartScreen extends StatefulWidget {
  final List<CartCard> cartList;
  final restaurantCardIndex;
  final restaurantList;
  Map? cloudResNo;

  CartScreen({
    super.key, 
    required this.cartList,
     required this.restaurantCardIndex,
     required this.restaurantList,
     required this.cloudResNo});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  Future<void> _fetchRestaurantReservationNumber() async {
    Map fxCloudResNo = await ReservationService.fetchRestaurantReservation();
    setState(() {
      widget.cloudResNo = fxCloudResNo;
    });
  }


  int totalPrice = 0;

  void calculatePrice(){
for(int i =0; i < widget.cartList.length; i++){
      int temp  = widget.cartList[i].cartPrice;
      totalPrice = (totalPrice + temp);
    }

  }
int bookReservation = 0;
void updateCuisineReservation() {
    
    // update cuisine reservation
    for (int i = 0; i < cuisineList[widget.restaurantCardIndex].length; i++) {
      cuisineList[widget.restaurantCardIndex][i].restaurantReservation =cuisineList[widget.restaurantCardIndex][i].restaurantReservation - bookReservation;
    }
    // update user cuisine reservation
    for (int i = 0; i < cuisineList[widget.restaurantCardIndex].length; i++) {
      cuisineList[widget.restaurantCardIndex][i].userCuisineReservations = cuisineList[widget.restaurantCardIndex][i].userCuisineReservations + bookReservation;
    }
  }
  
  @override
  void initState(){
    super.initState();
  calculatePrice();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          child: widget.cartList.isEmpty
              ? Center(
                  child: Text(
                  'Cart is Empty',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ))
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: widget.cartList.length,
                        itemBuilder: (context, index) {
                          return CartCard(
                              cartImage: widget.cartList[index].cartImage,
                              cartName: widget.cartList[index].cartName,
                              cartPrice: widget.cartList[index].cartPrice,
                              onPressed: () {
                                setState(() {
                                  widget.cartList.removeAt(index);
                                  totalPrice = 0;
                                  calculatePrice();
                                });
                              },
                              cardIndex: widget.cartList[index].cardIndex);
                        }),
                  ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Total: ₦$totalPrice', style: TextStyle(fontSize: 20),),
                      ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                   // Decrease Reservation Button
                              
                              Flexible(
                                flex: 1,
                                child: GestureDetector(
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                                  decoration: ShapeDecoration(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                                    color: kbrandColor), 
                                                    child: Icon(Icons.remove, color: Colors.white,),
                                                ),
                                                onTap: (){
                                              setState(() {
                                                    if (bookReservation > 1) bookReservation--;
                                                  });
                                                }
                                ),
                              ),
                              Flexible(
                                flex:2,
                                child: Container(
                                  
                                                height:50,
                                                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(6) ),
                                                  color: kbrandColor), 
                                                  child: Center(child: Text('Reserve: $bookReservation', style: TextStyle(color: Colors.white, fontSize: 15))),
                                ),
                              ),  
                  // Increase Reservation Button
                  Flexible(
                    flex:1,
                    child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        color: kbrandColor), 
                        child: Icon(Icons.add, color: Colors.white,),
                    ),
                    onTap: (){
                      setState(() {
                        if(bookReservation < widget.restaurantList[widget.restaurantCardIndex].restaurantReservation)bookReservation++;
                        
                      });
                    }
                                ),
                  ),
                             
                  ],
                              ),
                ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(9),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    color: kgoldBrown), 
                    child: Center(child: Text('Pay',style: TextStyle( fontSize: 19))),
                ),
                onTap:() async{
//             // Reservation logic 
            setState(() {
              // Update the restaurants current reservation Number
                RestaurantList.restaurantList[widget.restaurantCardIndex].restaurantReservation =  RestaurantList.restaurantList[widget.restaurantCardIndex].restaurantReservation - bookReservation ;
                // Find out the amount of reservation Number each user has
                RestaurantList.restaurantList[widget.restaurantCardIndex].userReservation = RestaurantList.restaurantList[widget.restaurantCardIndex].userReservation+ bookReservation;

              // Update your local UserReservations to match the current state of the cloud's
                userReservations = {
  ...userReservations, // Keep existing entries
  'dalish': RestaurantList.restaurantList[0].userReservation,
  'muniz': RestaurantList.restaurantList[1].userReservation,
  'boripe': RestaurantList.restaurantList[2].userReservation,
  'cake city': RestaurantList.restaurantList[3].userReservation,
  'hand of god': RestaurantList.restaurantList[4].userReservation,
  'skillz': RestaurantList.restaurantList[5].userReservation,
  // other entries...
};
// Update your local Restaurant Reservations to match the current state of the cloud's
              
                reservations = {
  ...reservations, // Keep existing entries
  'dalish': RestaurantList.restaurantList[0].restaurantReservation,
  'muniz': RestaurantList.restaurantList[1].restaurantReservation,
  'boripe': RestaurantList.restaurantList[2].restaurantReservation,
  'cake city': RestaurantList.restaurantList[3].restaurantReservation,
  'hand of god': RestaurantList.restaurantList[4].restaurantReservation,
  'skillz': RestaurantList.restaurantList[5].restaurantReservation,
  // other entries...
};


    // update your local cuisine reservation to match the current state
      cuisineReservations = {
        ...cuisineReservations,
  'dalish': RestaurantList.restaurantList[0].restaurantReservation,
  'muniz': RestaurantList.restaurantList[1].restaurantReservation,
  'boripe': RestaurantList.restaurantList[2].restaurantReservation,
  'cake city': RestaurantList.restaurantList[3].restaurantReservation,
  'hand of god': RestaurantList.restaurantList[4].restaurantReservation,
  'skillz': RestaurantList.restaurantList[5].restaurantReservation,
        };
    // update your local user cuisine reservation to match the current state
      userCuisineReservations = {
        ...userCuisineReservations,
  'dalish': RestaurantList.restaurantList[0].userReservation,
  'muniz': RestaurantList.restaurantList[1].userReservation,
  'boripe': RestaurantList.restaurantList[2].userReservation,
  'cake city': RestaurantList.restaurantList[3].userReservation,
  'hand of god': RestaurantList.restaurantList[4].userReservation,
  'skillz': RestaurantList.restaurantList[5].userReservation,};
    

              updateCuisineReservation();
              
                bookReservation = 0;
            
            
            });
             

            // Saves the current local reservation data to supabase
              await  saveReservationsToSupabase();
            // Saves the current local cuisine reservation data to supabase
            await saveCuisineReservationsToSupabase();

// Confirmation Message
            if(RestaurantList.restaurantList[widget.restaurantCardIndex].restaurantReservation == 0){
              showDialog(
              context: context,
               builder: ((context) => AlertDialog( 
                content: Text('The Restaurant ${RestaurantList.restaurantList[widget.restaurantCardIndex].name} is fully booked', style: TextStyle( fontSize:18),),
                actions: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kbrandColor)
                    ),
                    child: Text('OK', style: TextStyle(color: Colors.white),), onPressed: ((){ Navigator.pop(context);}),),
                ],)));
            }else{
            showDialog(
              context: context,
               builder: ((context) => AlertDialog( 
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('A Reservation has been made for you at ${RestaurantList.restaurantList[widget.restaurantCardIndex].name}', style: TextStyle(fontSize:18)),
                    SizedBox(height: 10,),
                    Text('A Total Payment of ₦$totalPrice has been made', style: TextStyle(fontSize:18)),
                    Icon(Icons.check_circle_outlined, color: Colors.green, size: 70,)
                  ],
                ),
                actions: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kbrandColor)
                    ),
                    child: Text('OK', style: TextStyle(color: Colors.white),), onPressed: ((){ Navigator.pop(context);}),),
                ],)));

            }

           await  _fetchRestaurantReservationNumber();
  
                
          },
              ),

              ]
              ),)
    );
  }
}

