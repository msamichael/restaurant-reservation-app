import 'package:flutter/material.dart';
import 'package:restaurant_app/components/cuisine_screen_card.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/cuisine.dart';
import 'package:restaurant_app/model/data/cuisine_list_data.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/model/service/reservation_service.dart';
import 'package:restaurant_app/screens/filter_cuisine_screen.dart';

import 'restaurant_card_screen.dart';

class CuisineScreen extends StatefulWidget {
  List<String> selectedRestaurant;
  final num minPrice;
  final num maxPrice;
  final bool showOnlyAvailbleRestaurant;


   CuisineScreen(
      {super.key,
      required this.selectedRestaurant,
      required this.minPrice,
      required this.maxPrice,
      required this.showOnlyAvailbleRestaurant,
      });

  @override
  State<CuisineScreen> createState() => _CuisineScreenState();
}

class _CuisineScreenState extends State<CuisineScreen> {
  final controller = TextEditingController();
  List<Cuisine> updatedCombinedCuisineList = combinedCuisineList;


late Map cloudResNo;

  Future<void> _fetchRestaurantReservationNumber() async{
  
    Map fxCloudResNo = await ReservationService.fetchRestaurantReservation();
  setState((){
    cloudResNo = fxCloudResNo;
  }); 
  
  
}






    
  // search functionality
  void searchCuisine(String query) {
    final suggestions = combinedCuisineList.where((value) {
      final cuisineName = value.name.toLowerCase();
      final input = query.toLowerCase();

      return cuisineName.contains(input);
    }).toList();
    setState(() => updatedCombinedCuisineList = suggestions);
  }

  @override
  void initState(){
    super.initState();
     // Fetching the updated values from supabase
    _fetchRestaurantReservationNumber();
  
   
  }
  @override
  Widget build(BuildContext context) {

     final filteredCuisineList = updatedCombinedCuisineList.where((cuisine) {
       bool restaurantMatches = widget.selectedRestaurant.isEmpty || widget.selectedRestaurant.contains(cuisine.restaurantName);
      bool priceMatches = (cuisine.price >= widget.minPrice && cuisine.price <= widget.maxPrice);
      bool availableRestaurant = widget.showOnlyAvailbleRestaurant == true? cuisine.restaurantReservation>0: cuisine.restaurantReservation>-1;
      
      return restaurantMatches && priceMatches && availableRestaurant;

}).toList();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(children: [
            SizedBox(height: 20),
            Row(
              children: [
                // Filter Button
                GestureDetector(
                  child: Container(
                    
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: kgoldBrown),
                    height: 47,
                    width: 47,

                    child: Icon(
                      Icons.tune,
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => FilterScreen())));
                  },
                ),
                SizedBox(
                  width: 7,
                ),
                // Search Bar
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(5, 5))
                        ]),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Your favorite foods',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            )),
                        controller: controller,
                        onChanged: searchCuisine,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // GridView of Cuisines belonging to each restaurant
            Expanded(
              child:filteredCuisineList.isEmpty? Center(child: Text('No Cuisines Found', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),)):
         GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 1),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns in the grid
                    childAspectRatio: 1.6 / 2 // Aspect Ratio of each item
                    ),
                itemCount: filteredCuisineList.length,
                itemBuilder: (context, index) {
                  //returns a cuisine card with the name, image and price
                  return CuisineScreenCard(
                    cuisineName: filteredCuisineList[index].name,
                    imagePath: filteredCuisineList[index].imagePath,
                    cuisinePrice: '₦' + filteredCuisineList[index].price.toString(),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => RestaurantCardScreen(
                                restaurantCardIndex:
                                    filteredCuisineList[index]
                                        .restaurantIndex,
                                restaurantList: RestaurantList.restaurantList, cloudResNo: cloudResNo,
                                
                              )),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
