
//restaurant model
import 'cuisine.dart';

class Restaurant {
  final String name;
  final String imagePath;
  final String location;
  final List<Cuisine> cuisine;
  int restaurantReservation;
  int userReservation;
    

    Restaurant({
      required this.name,
      required this.imagePath,
      required this.location,
      required this.cuisine,
      required this.restaurantReservation,
      required this.userReservation,
    });
}