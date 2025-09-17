
import 'package:flutter/material.dart';
import 'package:restaurant_app/components/filter_card.dart';
import 'package:restaurant_app/components/location_checkbox.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/screens/main_screen.dart';

final allLocation = location;
List<String> selectedLocation = [];
List<bool> checkboxState = [
  false,
  false,
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
    selectedLocation = [];
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
          FilterCard(
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
          // Location
          FilterCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: TextStyle(fontSize: 20),
                ),
                buildLocationWidget(selectedLocation: allLocation),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          // Available
          FilterCard(
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
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 35, 34, 34),
              ),
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
                    currentScreenIndex: 0,
                    selectedLocations: selectedLocation,
                    minPrice: minPrice,
                    maxPrice: maxPrice,
                    selectedRestaurant: restaurantName,
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

// Widget for the location checkbox interface
class buildLocationWidget extends StatefulWidget {
  final List<String> selectedLocation;

  const buildLocationWidget({
    super.key,
    required this.selectedLocation,
  });

  @override
  State<buildLocationWidget> createState() => _buildLocationWidgetState();
}

class _buildLocationWidgetState extends State<buildLocationWidget> {
  void onchanged(bool? value, int index) {
    if (value == null) return; // Guard against null value

    setState(() {
      checkboxState[index] = value;

      if (value) {
        if (!selectedLocation.contains(allLocation[index])) {
          selectedLocation.add(widget.selectedLocation[index]);
        }
      } else {
        selectedLocation.remove(widget.selectedLocation[index]);
      }
    });
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
              LocationCheckBox(
                  location: widget.selectedLocation,
                  index: 0,
                   checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 0),),
              LocationCheckBox(
                  location: widget.selectedLocation,
                  index: 2,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 2)),
              LocationCheckBox(
                  location: widget.selectedLocation,
                  index: 4,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 4)),
              LocationCheckBox(
                  location: widget.selectedLocation,
                  index: 6,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 6)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationCheckBox(
                  location: widget.selectedLocation,
                  index: 1,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 1)),
              LocationCheckBox(
                  location: widget.selectedLocation,
                  index: 3,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 3)),
              LocationCheckBox(
                  location: widget.selectedLocation,
                  index: 5,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 5)),
              LocationCheckBox(
                  location: widget.selectedLocation,
                  index: 7,
                  checkboxState: checkboxState,
                  onChanged: (value) => onchanged(value, 7)),
            ],
          ),
        ],
      ),
    );
  }
}

