import 'package:restaurant_app/model/service/reservation_service.dart';

import '../cuisine.dart';
import 'restaurant_list_data.dart';

// User Cuisine Reservation
Map<String,int> userCuisineReservations = {
  "dalish":0,
  "muniz":0,
  "boripe":0,
  "cake city":0,
  "hand of god":0,
  "skillz":0,
};


// Cuisine Reservation Number
Map<String, int> cuisineReservations = {
"dalish":25,
  "muniz":20,
  "boripe":21,
  "cake city":10,
  "hand of god":15,
  "skillz":20,
};

// List of Cuisine list
List cuisineList = [
  dalishList,
  munizList,
  boripeList,
  cakecityList,
  handofgodList,
  skillzList
];


//Cuisine List
List<Cuisine> dalishList = [
  Cuisine(name: 'Jollof Rice', imagePath: 'assets/images/jollof1.jpeg', price: 2500, restaurantIndex: 0, restaurantName: restaurantName[0], restaurantReservation: cuisineReservations['dalish']!, userCuisineReservations: userCuisineReservations['dalish']!,),
  Cuisine(name: 'Spaghetti', imagePath: 'assets/images/spaghetti.jpg', price: 1500,restaurantIndex: 0, restaurantName: restaurantName[0],restaurantReservation: cuisineReservations['dalish']!,userCuisineReservations: userCuisineReservations['dalish']!,),
  Cuisine(name: 'Grilled Chicken', imagePath: 'assets/images/grilled_chicken.jpg', price: 4000,restaurantIndex: 0, restaurantName: restaurantName[0],restaurantReservation: cuisineReservations['dalish']!,userCuisineReservations: userCuisineReservations['dalish']!,),
  Cuisine(name: 'Eba & Egusi', imagePath: 'assets/images/eba_egusi.jpg', price: 2000,restaurantIndex: 0, restaurantName: restaurantName[0],restaurantReservation: cuisineReservations['dalish']!,userCuisineReservations: userCuisineReservations['dalish']!,),
  Cuisine(name: 'Eba & Ogbono', imagePath: 'assets/images/eba_ogbono.jpg', price: 2000,restaurantIndex: 0, restaurantName: restaurantName[0],restaurantReservation: cuisineReservations['dalish']!,userCuisineReservations: userCuisineReservations['dalish']!,),
  Cuisine(name: 'Fufu & Egusi', imagePath: 'assets/images/fufu_egusi.jpg', price: 2300,restaurantIndex: 0, restaurantName: restaurantName[0],restaurantReservation: cuisineReservations['dalish']!,userCuisineReservations: userCuisineReservations['dalish']!,),
  Cuisine(name: 'Fufu & Ogbono', imagePath: 'assets/images/fufu_ogbono.jpg', price: 1800,restaurantIndex: 0, restaurantName: restaurantName[0],restaurantReservation: cuisineReservations['dalish']!,userCuisineReservations: userCuisineReservations['dalish']!,),
  Cuisine(name: 'Porridge', imagePath: 'assets/images/porridge.jpg', price: 2500,restaurantIndex: 0, restaurantName: restaurantName[0],restaurantReservation: cuisineReservations['dalish']!,userCuisineReservations: userCuisineReservations['dalish']!,),
  Cuisine(name: 'Pounded Yam & Egusi', imagePath: 'assets/images/poundedyam_egusi.jpg', price: 3200,restaurantIndex: 0, restaurantName: restaurantName[0],restaurantReservation: cuisineReservations['dalish']!,userCuisineReservations: userCuisineReservations['dalish']!,),
];
List<Cuisine> munizList = [
  Cuisine(name: 'Jollof Rice', imagePath: 'assets/images/jollof1.jpeg', price: 2500, restaurantIndex: 1, restaurantName: restaurantName[1],restaurantReservation: cuisineReservations['muniz']!,userCuisineReservations: userCuisineReservations['muniz']!,),
  Cuisine(name: 'Fried Rice', imagePath: 'assets/images/fried_rice.jpg', price: 3000,restaurantIndex: 1, restaurantName: restaurantName[1],restaurantReservation: cuisineReservations['muniz']!,userCuisineReservations: userCuisineReservations['muniz']!,),
  Cuisine(name: 'Sharwarma', imagePath: 'assets/images/shawarma.jpg', price: 3000,restaurantIndex: 1, restaurantName: restaurantName[1],restaurantReservation: cuisineReservations['muniz']!,userCuisineReservations: userCuisineReservations['muniz']!,),
  Cuisine(name: 'Semo & Egusi', imagePath: 'assets/images/semo_egusi.jpg', price: 2200,restaurantIndex: 1, restaurantName: restaurantName[1],restaurantReservation: cuisineReservations['muniz']!,userCuisineReservations: userCuisineReservations['muniz']!,),
  Cuisine(name: 'Yam & Egg', imagePath: 'assets/images/yam_egg.jpg', price: 3000,restaurantIndex: 1, restaurantName: restaurantName[1],restaurantReservation: cuisineReservations['muniz']!,userCuisineReservations: userCuisineReservations['muniz']!,),
  Cuisine(name: 'French Fries', imagePath: 'assets/images/french_fries.jpg', price: 3000,restaurantIndex: 1, restaurantName: restaurantName[1],restaurantReservation: cuisineReservations['muniz']!,userCuisineReservations: userCuisineReservations['muniz']!,),
  ];

List<Cuisine> boripeList =[
  Cuisine(name: 'Semo & Efo', imagePath: 'assets/images/semo_vegetable.jpg', price: 2000,restaurantIndex: 2, restaurantName: restaurantName[2],restaurantReservation: cuisineReservations['boripe']!,userCuisineReservations: userCuisineReservations['boripe']!,),
  Cuisine(name: 'Amala & Efo', imagePath: 'assets/images/Amala_efo.jpg', price: 2500,restaurantIndex: 2, restaurantName: restaurantName[2],restaurantReservation: cuisineReservations['boripe']!,userCuisineReservations: userCuisineReservations['boripe']!,),
  Cuisine(name: 'Jollof Rice', imagePath: 'assets/images/jollof1.jpeg', price: 2500, restaurantIndex: 2, restaurantName: restaurantName[2],restaurantReservation: cuisineReservations['boripe']!,userCuisineReservations: userCuisineReservations['boripe']!,),
  Cuisine(name: 'Amala & Ewedu', imagePath: 'assets/images/amala_ewedu.jpg', price: 2000,restaurantIndex: 2, restaurantName: restaurantName[2],restaurantReservation: cuisineReservations['boripe']!,userCuisineReservations: userCuisineReservations['boripe']!,),
  Cuisine(name: 'Fried Rice', imagePath: 'assets/images/fried_rice.jpg', price: 3000,restaurantIndex: 2, restaurantName: restaurantName[2],restaurantReservation: cuisineReservations['boripe']!,userCuisineReservations: userCuisineReservations['boripe']!,),
  Cuisine(name: 'Spaghetti', imagePath: 'assets/images/spaghetti.jpg', price: 1500,restaurantIndex: 2, restaurantName: restaurantName[2],restaurantReservation: cuisineReservations['boripe']!,userCuisineReservations: userCuisineReservations['boripe']!,),
  
];
List<Cuisine> cakecityList = [
  Cuisine(name: 'Cake', imagePath: 'assets/images/cake.jpg', price: 4000,restaurantIndex: 3, restaurantName: restaurantName[3],restaurantReservation: cuisineReservations['cake city']!,userCuisineReservations: userCuisineReservations['cake city']!,),
  Cuisine(name: 'Ice Cream', imagePath: 'assets/images/icecream.jpg', price: 1000,restaurantIndex: 3, restaurantName: restaurantName[3],restaurantReservation: cuisineReservations['cake city']!,userCuisineReservations: userCuisineReservations['cake city']!,),
  Cuisine(name: 'Meat Pie', imagePath: 'assets/images/meatpie1.jpg', price: 1000,restaurantIndex: 3, restaurantName: restaurantName[3],restaurantReservation: cuisineReservations['cake city']!,userCuisineReservations: userCuisineReservations['cake city']!,),
  Cuisine(name: 'Donut', imagePath: 'assets/images/donut.jpg', price: 1000,restaurantIndex: 3, restaurantName: restaurantName[3],restaurantReservation: cuisineReservations['cake city']!,userCuisineReservations: userCuisineReservations['cake city']!,),
  Cuisine(name: 'Chin Chin', imagePath: 'assets/images/chinchin.jpg', price: 1500,restaurantIndex: 3, restaurantName: restaurantName[3],restaurantReservation: cuisineReservations['cake city']!,userCuisineReservations: userCuisineReservations['cake city']!,),
  Cuisine(name: 'Sardine Bread', imagePath: 'assets/images/sardine_bread.png', price: 2000,restaurantIndex: 3, restaurantName: restaurantName[3],restaurantReservation: cuisineReservations['cake city']!,userCuisineReservations: userCuisineReservations['cake city']!,),


];

List<Cuisine> handofgodList=[
 Cuisine(name: 'Porridge', imagePath: 'assets/images/porridge.jpg', price: 2500,restaurantIndex: 4, restaurantName: restaurantName[4],restaurantReservation: cuisineReservations['hand of god']!,userCuisineReservations: userCuisineReservations['hand of god']!,),
  Cuisine(name: 'Pounded Yam & Egusi', imagePath: 'assets/images/poundedyam_egusi.jpg', price: 3200,restaurantIndex: 4, restaurantName: restaurantName[4],restaurantReservation: cuisineReservations['hand of god']!,userCuisineReservations: userCuisineReservations['hand of god']!,),
  Cuisine(name: 'Amala & Ewedu', imagePath: 'assets/images/amala_ewedu.jpg', price: 2000,restaurantIndex: 4, restaurantName: restaurantName[4],restaurantReservation: cuisineReservations['hand of god']!,userCuisineReservations: userCuisineReservations['hand of god']!,),
Cuisine(name: 'Jollof Rice', imagePath: 'assets/images/jollof1.jpeg', price: 2500, restaurantIndex: 4, restaurantName: restaurantName[4], restaurantReservation: cuisineReservations['hand of god']!, userCuisineReservations: userCuisineReservations['hand of god']!,),
  Cuisine(name: 'Yam & Egg', imagePath: 'assets/images/yam_egg.jpg', price: 3000,restaurantIndex: 4, restaurantName: restaurantName[4],restaurantReservation: cuisineReservations['hand of god']!,userCuisineReservations: userCuisineReservations['hand of god']!,),
Cuisine(name: 'Eba & Egusi', imagePath: 'assets/images/eba_egusi.jpg', price: 2000,restaurantIndex: 4, restaurantName: restaurantName[4],restaurantReservation: cuisineReservations['hand of god']!,userCuisineReservations: userCuisineReservations['hand of god']!,),
  Cuisine(name: 'Eba & Ogbono', imagePath: 'assets/images/eba_ogbono.jpg', price: 2000,restaurantIndex: 4, restaurantName: restaurantName[4],restaurantReservation: cuisineReservations['hand of god']!,userCuisineReservations: userCuisineReservations['hand of god']!,),
      
];

List<Cuisine> skillzList =[
  Cuisine(name: 'Fried Rice', imagePath: 'assets/images/fried_rice.jpg', price: 3000,restaurantIndex: 5, restaurantName: restaurantName[5],restaurantReservation: cuisineReservations['skillz']!,userCuisineReservations: userCuisineReservations['skillz']!,),
  Cuisine(name: 'Spaghetti', imagePath: 'assets/images/spaghetti.jpg', price: 1500,restaurantIndex: 5, restaurantName: restaurantName[5],restaurantReservation: cuisineReservations['skillz']!,userCuisineReservations: userCuisineReservations['skillz']!,),
Cuisine(name: 'Jollof Rice', imagePath: 'assets/images/jollof1.jpeg', price: 2500, restaurantIndex: 5, restaurantName: restaurantName[5], restaurantReservation: cuisineReservations['skillz']!, userCuisineReservations: userCuisineReservations['skillz']!,),
  Cuisine(name: 'Yam & Egg', imagePath: 'assets/images/yam_egg.jpg', price: 3000,restaurantIndex: 5, restaurantName: restaurantName[5],restaurantReservation: cuisineReservations['skillz']!,userCuisineReservations: userCuisineReservations['skillz']!,),
  Cuisine(name: 'French Fries', imagePath: 'assets/images/french_fries.jpg', price: 3000,restaurantIndex: 5, restaurantName: restaurantName[5],restaurantReservation: cuisineReservations['skillz']!,userCuisineReservations: userCuisineReservations['skillz']!,),
  Cuisine(name: 'Grilled Chicken', imagePath: 'assets/images/grilled_chicken.jpg', price: 4000,restaurantIndex: 5, restaurantName: restaurantName[5],restaurantReservation: cuisineReservations['skillz']!,userCuisineReservations: userCuisineReservations['skillz']!,),
  Cuisine(name: 'Sharwarma', imagePath: 'assets/images/shawarma.jpg', price: 3000,restaurantIndex: 5, restaurantName: restaurantName[5],restaurantReservation: cuisineReservations['skillz']!,userCuisineReservations: userCuisineReservations['skillz']!,),
    
];

//Combined Cuisine list for the Search Screen
List<Cuisine> combinedCuisineList = dalishList + munizList + boripeList + cakecityList + handofgodList + skillzList;


// Function to save cuisine reservations to Supabase
Future<void> saveCuisineReservationsToSupabase() async {
  await ReservationService.saveUserCuisineReservationsToSupabase(userCuisineReservations);
  await ReservationService.saveCuisineRestaurantReservationsToSupabase(cuisineReservations);

}
