import 'package:restaurant_app/model/service/reservation_service.dart';

import '../cuisine.dart';
import 'cuisine_list_data.dart';
import '../restaurant.dart';




class RestaurantList {
  // List of restaurants
  static List<Restaurant> restaurantList = [
    // Dalish
    Restaurant(
      name: restaurantName[0], 
      imagePath: 'assets/images/dalish.jpg', 
      location: location[7],
      cuisine: dalishList, 
       restaurantReservation: reservations['dalish']!,
       userReservation: userReservations['dalish']!
      ),
      // Muniz
    Restaurant(
      name: restaurantName[1], 
      imagePath: 'assets/images/muniz.jpg', 
      location: location[1],
      cuisine: munizList ,
       restaurantReservation: reservations['muniz']!,
       userReservation: userReservations['muniz']!
      ),
      // Boripe
    Restaurant(
      name: restaurantName[2], 
      imagePath: 'assets/images/boripe.jpg', 
      location: location[1],
      cuisine: boripeList ,
       restaurantReservation: reservations['boripe']!,
       userReservation: userReservations['boripe']!
      ),
      // Cake City
    Restaurant(
      name: restaurantName[3], 
      imagePath: 'assets/images/cakecity.jpg', 
      location: location[3],
      cuisine: cakecityList ,
       restaurantReservation: reservations['cake city']!,
       userReservation: userReservations['cake city']!
      ),
      // Hand of God
    Restaurant(
      name: restaurantName[4], 
      imagePath: 'assets/images/handofgod.jpg', 
      location: location[0],
      cuisine: handofgodList ,
       restaurantReservation: reservations['hand of god']!,
       userReservation: userReservations['hand of god']!
      ),
      // Skillz
    Restaurant(
      name: restaurantName[5], 
      imagePath: 'assets/images/skillz.jpg', 
      location: location[7],
      cuisine: skillzList ,
       restaurantReservation: reservations['skillz']!,
       userReservation: userReservations['skillz']!
      ),
  ];

}




// Restaurant Location List
List<String> location =[
  'Gate',
  'Harmony',
  'Accord',
  'Funaab Zoo',
  'Oluwo',
  'Cele',
  'Isolu',
  'Camp'
];

// Restaurant Names
List<String> restaurantName =[
  'Dalish',
  'Muniz',
  'Boripe',
  'Cake City',
  'Hand of God',
  'Skillz'
];





//Default User Reservation Number
Map<String,dynamic> userReservations = {
  "dalish":0,
  "muniz":0,
  "boripe":0,
  "cake city":0,
  "hand of god":0,
  "skillz":0,
};

// Default Restaurant Reservation Number
Map<String,int> reservations = {
  "dalish":25,
  "muniz":20,
  "boripe":21,
  "cake city":10,
  "hand of god":15,
  "skillz":20,
};



// Function to save reservations to Supabase
Future<void> saveReservationsToSupabase() async {
  await ReservationService.saveUserReservationsToSupabase(userReservations);
  await ReservationService.saveRestaurantReservationsToSupabase(reservations);

}
// Function to fetch reservations from Supabase
Future<void> fetchReservationsFromSupabase() async {
  await ReservationService.fetchUserReservation();
}

