import 'package:flutter/material.dart';
import 'package:restaurant_app/components/restaurant_card.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/model/service/reservation_service.dart';
import 'filter_screen.dart';
import 'restaurant_card_screen.dart';



class HomeScreen extends StatefulWidget {
  List<String> selectedLocations;
  final num minPrice;
  final num maxPrice;
  final bool showOnlyAvailbleRestaurant;

  HomeScreen(
      {super.key,
      required this.selectedLocations,
      required this.minPrice,
      required this.maxPrice,
      required this.showOnlyAvailbleRestaurant});



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

late Map cloudResNo;
  Future<void> _initializeReservations() async {
    try {
      final cloudUserReservation = await ReservationService.fetchUserReservation();
      setState(() {
        userReservations = cloudUserReservation ?? 0; // Use 0 if null
      });
    } catch (error) {
      print('Error fetching user reservations: $error');
    }
  }

  Future<void> _fetchRestaurantReservationNumber() async{
  
    Map fxCloudResNo = await ReservationService.fetchRestaurantReservation();
  setState((){
    cloudResNo = fxCloudResNo;
  }); 
  
  
}





  @override
  void initState(){
    super.initState();
     // Fetching the updated values from supabase
    _initializeReservations();
    _fetchRestaurantReservationNumber();
  
   
  }

  


  @override
  Widget build(BuildContext context) {
   
    //filter functionality
    List filteredRestaurantList =
        RestaurantList.restaurantList.where((restaurant) {
      bool locationMatches = widget.selectedLocations.isEmpty ||
          widget.selectedLocations.contains(restaurant.location);
      bool priceMatches = restaurant.cuisine.every((cuisine) =>
          cuisine.price >= widget.minPrice && cuisine.price <= widget.maxPrice);
      bool availableRestaurant = widget.showOnlyAvailbleRestaurant == true? restaurant.restaurantReservation>0: restaurant.restaurantReservation>-1;
      return locationMatches && priceMatches && availableRestaurant;
    }).toList();

     

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
    
      //Appbar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilterScreen(
                        ),
                  ));
            },
            child: Icon(Icons.tune, color: kgoldBrown)),
        title: Text(
          'Restaurant',
          style: TextStyle(color: kbrandColor, fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
    
      //body
      body: SafeArea(
        child: filteredRestaurantList.isEmpty
            ? Center(
                child: Text(
                'No Restaurants Found',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ))
            : ListView.builder(
                itemCount: filteredRestaurantList.length,
                itemBuilder: (context, index) {
                  
                  final restaurantCard = RestaurantCard(
                    // Accessing restaurantList nested restaurant values
                    restaurantName: filteredRestaurantList[index].name,
                    imagePath: filteredRestaurantList[index].imagePath,
                    restaurantLocation: filteredRestaurantList[index].location,
                     restaurantReservation: filteredRestaurantList[index].restaurantReservation.toString(),
                    
                    // Navigate to the restaurants page
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => RestaurantCardScreen(
                                restaurantCardIndex: index,
                                restaurantList: filteredRestaurantList, cloudResNo: cloudResNo,
                                
                              )),
                        ),
                      );}
                  );
    
                  //returns it to display it on the screen
                  return restaurantCard;
                }),
      ),
    );
  }
}
