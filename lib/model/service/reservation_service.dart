import 'package:restaurant_app/model/data/cuisine_list_data.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReservationService {

static Future<void> saveUserReservationsToSupabase(Map<String, dynamic> userReservations) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) throw Exception('User not logged in');
try{
    final updateResponse = await Supabase.instance.client
        .from('profiles')
        .update({
          'user_reservations': userReservations,
        },).eq('id', user.id); 
      
} catch (error){
  print('your error is: $error');
}}

static Future<void> saveRestaurantReservationsToSupabase(Map<String, dynamic> userReservations) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) throw Exception('User not logged in');
try{
    final updateRestaurantResponse = await Supabase.instance.client
        .from('global_variables')
        .update({
          'restaurant_reservations': reservations,
        },).eq('id', 1); 
      
  
} catch (error){
  print('your error is: $error');
}

     
        }
static Future<void> saveUserCuisineReservationsToSupabase(Map<String, dynamic> userReservations) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) throw Exception('User not logged in');
try{
    final updateResponse = await Supabase.instance.client
        .from('profiles')
        .update({
          'user_cuisine_reservations': userCuisineReservations,
        },).eq('id', user.id); 
      
} catch (error){
  print('your error is: $error');
}}

static Future<void> saveCuisineRestaurantReservationsToSupabase(Map<String, dynamic> userReservations) async {
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) throw Exception('User not logged in');
try{
    final updateRestaurantResponse = await Supabase.instance.client
        .from('global_variables')
        .update({
          'cuisine_restaurant_reservations': cuisineReservations,
        },).eq('id', 1); 
      
  
} catch (error){
  print('your error is: $error');
}

     
        }

static Future<dynamic> fetchRestaurantReservation() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) throw Exception('User not logged in');

try{
    final response = await Supabase.instance.client
        .from('global_variables')
        .select('restaurant_reservations')
        .eq('id', 1)
        .single();

    final cloudResReservation = response['restaurant_reservations'];


    // return the fetched value
    return cloudResReservation;
    
} catch (error){
  print ('your error is: $error');
}
      }
static Future<dynamic> fetchUserReservation() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user == null) throw Exception('User not logged in');

try{
    final response = await Supabase.instance.client
        .from('profiles')
        .select('user_reservations')
        .eq('id', user.id)
        .single();

    final cloudUserReservation = response['user_reservations'];


    // return the fetched value
    return cloudUserReservation;
    
} catch (error){
  print ('your error is: $error');
}
      }

}




