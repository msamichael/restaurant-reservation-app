import 'package:flutter/material.dart';
import 'package:restaurant_app/components/profile_card.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/cuisine_list_data.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/model/service/reservation_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_or_register_screen.dart';
import 'login_screen.dart';
import 'reservation_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  
String? username;
String friend = 'Friend';



Future<void> signOutUser() async {

  try {

  await Supabase.instance.client.auth.signOut();
  Navigator.pushReplacement(
    context,
     MaterialPageRoute(builder: (context)=> LoginOrRegisterScreen()
  ));
  }catch(e){
    print('error: $e');
  }

}


Future<void> clearReservations() async {

for (int i = 0; i<RestaurantList.restaurantList.length;i++ ){

  // Resets the restaurants reservation to default
  RestaurantList.restaurantList[i].restaurantReservation = RestaurantList.restaurantList[i].userReservation + RestaurantList.restaurantList[i].restaurantReservation;
                          
  // Resets the user's restaurants to 0  
  RestaurantList.restaurantList[i].userReservation = 0;
                      
}
// loop through the cuisine's list and reset the cuisine's reservation to default and user reservation to 0
for (int x = 0; x < cuisineList.length; x++){
      for (int y = 0; y < cuisineList[x].length; y++){
    cuisineList[x][y].restaurantReservation = cuisineList[x][y].restaurantReservation + cuisineList[x][y].userCuisineReservations;
    cuisineList[x][y].userCuisineReservations = 0;

      }

    }


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
  'skillz': RestaurantList.restaurantList[5].userReservation,
   };
    


   await saveReservationsToSupabase();
   await saveCuisineReservationsToSupabase();


}

Future<String?> getUserUsername() async {
  try {
    // Get the current user's ID
    final user = Supabase.instance.client.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently signed in');
    }

    // Query the profile table
    final response = await Supabase.instance.client
        .from('profiles')
        .select('username')
        .eq('id', user.id)
        .single();

    // Extract the username from the response
    return response['username'] as String?;
  } catch (e) {
    print('Error fetching username: $e');
    return null;
  }
}


 Future<void> _fetchUsername() async {
    String? fetchedUsername = await getUserUsername();
    setState(() {
      username = fetchedUsername;
    });
    if (username != null) {
      print('The current user\'s username is: $username');
    } else {
      print('Could not retrieve the username');
    }
  }
  late Map cloudResNo;



Future<void> _fetchUserReservationNumber() async{
  
    Map fxCloudResNo = await ReservationService.fetchUserReservation();
  setState((){
    cloudResNo = fxCloudResNo;
  }); 
  
  
}



@override
  void initState() {
    super.initState();
    _fetchUsername();
  _fetchUserReservationNumber();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.topCenter,
              child: Text('Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
          
                child: Text('Hi, ${username != null ? username: friend }',style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400) )),
           
            SizedBox(height: 45,),
            profileCard(
              profileName: 'Reservations',
              icon: Icon(Icons.restaurant, color: kgoldBrown,),
              onTap: (){
                print(userReservations);
                Navigator.push(context, MaterialPageRoute(builder: ((context) => ReservationScreen(cloudResNo: cloudResNo,))));
              },

            ),
            SizedBox(height: 20,),
            profileCard(
              profileName: 'Clear Reservations',
              icon: Icon(Icons.cancel, color: Colors.red),
              onTap: (){
                
            showDialog(
              context: context,
               builder: ((context) => AlertDialog( 
                content: Text('Are you sure you want to clear your reservations?'),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // No button
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(kbrandColor)
                        ),
                        child: Text('No', style: TextStyle(color: Colors.white),), onPressed: ((){ Navigator.pop(context);}),),
                        SizedBox(width:10),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red)
                        ),
                        child: Text('Clear', style: TextStyle(color: kbrandColor, fontWeight: FontWeight.bold),), 
                        onPressed:( ()async { 
                          await clearReservations();
                          Navigator.pop(context);}),),
                    ],
                  ),
                ],)));
              },

            ),SizedBox(height: 20,),
            
             profileCard(
              profileName: 'Logout',
              icon: Icon(Icons.logout, color: Colors.black,),
              onTap: (){
                
            showDialog(
              context: context,
               builder: ((context) => AlertDialog( 
                content: Text('Are you sure you want to Log out?'),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // No button
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(kbrandColor)
                        ),
                        child: Text('No', style: TextStyle(color: Colors.white),), onPressed: ((){ Navigator.pop(context);}),),
                        SizedBox(width:10),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red)
                        ),
                        child: Text('Log out', style: TextStyle(color: kbrandColor, fontWeight: FontWeight.bold),), 
                        onPressed:( ()async { 
                          await signOutUser();
                          }),),
                    ],
                  ),
                ],)));
              },

            ),        ],),
      )
    );
  }
}



