
//Cuisine model
class Cuisine {
  final String name;
  final String imagePath;
  final num price;
  final int restaurantIndex;
  final String restaurantName;
  int restaurantReservation;
  int userCuisineReservations;
  

    Cuisine({
      required this.name,
      required this.imagePath,
      required this.price,
      required this.restaurantIndex,
      required this.restaurantName,
      required this.restaurantReservation, 
      required this.userCuisineReservations,

    });


}