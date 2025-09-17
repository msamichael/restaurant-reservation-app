import 'package:flutter/material.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/model/service/reservation_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_screen.dart';
import 'cuisine_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  int currentScreenIndex = 0;
  final List<String> selectedLocations;
  final List<String> selectedRestaurant;
  final bool showOnlyAvailbleRestaurant;
  final num minPrice;
  final num maxPrice;


   MainScreen(
    {super.key,
  required this.currentScreenIndex,
  required this.selectedLocations,
  required this.selectedRestaurant,
  required this.showOnlyAvailbleRestaurant,
  required this.minPrice,
  required this.maxPrice,
  }
  );

  @override
  State<MainScreen> createState() => _MainScreenState();
}



class _MainScreenState extends State<MainScreen> {

  // variable to store the current screen of the bottom naviagtion bar
  int _selectedScreenIndex = 0;

  // list of screens in bottom navigation bar
  late List<Widget> _screens = [ ];




  @override
  void initState() {
    super.initState();
    _screens =[
      HomeScreen(selectedLocations: widget.selectedLocations, minPrice: widget.minPrice, maxPrice: widget.maxPrice, showOnlyAvailbleRestaurant: widget.showOnlyAvailbleRestaurant,),
    CuisineScreen(selectedRestaurant: widget.selectedRestaurant, minPrice: widget.minPrice, maxPrice: widget.maxPrice, showOnlyAvailbleRestaurant: widget.showOnlyAvailbleRestaurant,),
    const ProfileScreen()

    ];
   }


  

 List<Widget> get screen => _screens;

  void onTabTapped(int index) {
      setState(() {
        _selectedScreenIndex = index;
      });

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: ((context) => MainScreenIndex(index:_selectedScreenIndex))));
    
  }
  

  




  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      // bottom App Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kgoldBrown,
        
        unselectedItemColor: Colors.grey.shade600,
        onTap: onTabTapped,
        currentIndex: widget.currentScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile"
          ),
        ]),
    
    
        body: _screens[widget.currentScreenIndex]
        
    
    );
  }
}




class MainScreenIndex extends StatefulWidget {
  final int index;

  const MainScreenIndex({super.key,
  required this.index});

  @override
  State<MainScreenIndex> createState() => _MainScreenIndexState();
}

class _MainScreenIndexState extends State<MainScreenIndex> {
  @override
  Widget build(BuildContext context) {
    return MainScreen(
      currentScreenIndex: widget.index,
      selectedLocations: location,
      selectedRestaurant: restaurantName,
      showOnlyAvailbleRestaurant: false,
      minPrice: 1000,
      maxPrice: 10000,
    );
  }
}