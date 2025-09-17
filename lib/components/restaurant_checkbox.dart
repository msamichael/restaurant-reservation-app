import 'package:flutter/material.dart';


class RestaurantCheckBox extends StatelessWidget {
   RestaurantCheckBox(
      {super.key,
      required this.restaurantName,
      required this.index,
      required this.onChanged,
      required this.checkboxState,
      });

  final List<String> restaurantName;
  final int index;
  final void Function(bool?)? onChanged;
  List<bool> checkboxState;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.black,
          
          fillColor: MaterialStateProperty.all(Colors.white),
          value: checkboxState[index],
          onChanged: onChanged,
        ),
        Text(restaurantName[index]),
      ],
    );
  }
}
