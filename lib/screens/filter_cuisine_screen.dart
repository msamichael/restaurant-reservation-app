// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:restaurant_app/components/filter_cuisine_card.dart';
import 'package:restaurant_app/components/restaurant_checkbox.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/screens/main_screen.dart';


final allRestaurant = restaurantName;
List<String> selectedRestaurant = [];
List<bool> checkboxState = [
  false,
  false,
  false,
  false,
  false,
  false,
];

class FilterScreen extends StatefulWidget {
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues values = const RangeValues(1000, 10000);
  late num minPrice;
  late num maxPrice;
  
  bool restaurantAvailabilty = false;

  @override
  void initState() {
    super.initState();
    selectedRestaurant = [];
    minPrice = 1000;
    maxPrice = 10000;
    restaurantAvailabilty = false;
    checkboxState = [
      false,
  false,
  false,
  false,
  false,
  false,
    ];
  }

  @override
  Widget build(BuildContext context) {
    RangeLabels labels =
        RangeLabels(values.start.toString(), values.end.toString());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Filters', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30,
          ),

          // Price Range
          FilterCuisineCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price Range',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    // Minimum Price
                    Column(
                      children: [
                        Text('Min'),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '₦' + values.start.ceil().toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        )
                      ],
                    ),
                    // Range Slider
                    Expanded(
                      child: RangeSlider(
                          activeColor: kbrandColor,
                          values: values,
                          min: 1000,
                          max: 10000,
                          divisions: 90,
                          labels: labels,
                          onChanged: (newValues) {
                            setState(() {
                              values = newValues;
                              minPrice = values.start;
                              maxPrice = values.end;
                            });
                          }),
                    ),
                    // Maximum Price
                    Column(
                      children: [
                        Text('Max'),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '₦' + values.end.ceil().toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),
          // Restaurants
          FilterCuisineCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restaurant',
                  style: TextStyle(fontSize: 20),
                ),
                buildRestaurantWidget(selectedRestaurant: allRestaurant),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          // Available
           FilterCuisineCard(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available',
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Text(
                      'Off',
                      style: TextStyle(
                          color: restaurantAvailabilty == false
                              ? kbrandColor
                              : Colors.grey,
                          fontSize: 17),
                    ),
                    Switch(
                        value: restaurantAvailabilty,
                        activeColor: kbrandColor,
                        onChanged: (bool value) {
                          setState(() {
                            
                            restaurantAvailabilty = value;
                             });
                        }),
                    Text('On',
                        style: TextStyle(
                            color: restaurantAvailabilty == true
                                ? kbrandColor
                                : Colors.grey,
                            fontSize: 17)),
                  ],
                )
              ],
            ),
          ),

          Spacer(),
          // Apply Filters Button
          GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: const Color.fromARGB(255, 35, 34, 34),),
              child: Center(
                child: Text(
                  'Apply Filters',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MainScreen(
                    currentScreenIndex: 1,
                    selectedLocations: location,
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                     selectedRestaurant: selectedRestaurant,
                     showOnlyAvailbleRestaurant: restaurantAvailabilty,
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class buildRestaurantWidget extends StatefulWidget {
  final List<String> selectedRestaurant;

  const buildRestaurantWidget({
    super.key,
    required this.selectedRestaurant,
  });

  @override
  State<buildRestaurantWidget> createState() => _buildRestaurantWidgetState();
}

class _buildRestaurantWidgetState extends State<buildRestaurantWidget> {


  void onchanged(bool? value, int index) {
    if (value == null) return; // Guard against null value

    setState(() {
      checkboxState[index] = value;

      if (value) {
        if (!selectedRestaurant.contains(allRestaurant[index])) {
          selectedRestaurant.add(widget.selectedRestaurant[index]);
        }
      } else {
        selectedRestaurant.remove(widget.selectedRestaurant[index]);
      }
    });

    print(selectedRestaurant);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RestaurantCheckBox(
                  restaurantName: widget.selectedRestaurant,
                  index: 0,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 0)),
              RestaurantCheckBox(
                  restaurantName: widget.selectedRestaurant,
                  index: 2,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 2)),
              RestaurantCheckBox(
                  restaurantName: widget.selectedRestaurant,
                  index: 4,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 4)),
             
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RestaurantCheckBox(
                  restaurantName: widget.selectedRestaurant,
                  index: 1,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 1)),
              RestaurantCheckBox(
                  restaurantName: widget.selectedRestaurant,
                  index: 3,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 3)),
              RestaurantCheckBox(
                  restaurantName: widget.selectedRestaurant,
                  index: 5,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 5)),
             ],
          ),
        ],
      ),
    );
  }
}

