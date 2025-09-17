import 'package:flutter/material.dart';


// Widget for the location checkbox
class LocationCheckBox extends StatelessWidget {
  LocationCheckBox(
      {super.key,
      required this.location,
      required this.index,
      required this.onChanged,
      required this.checkboxState,

      });

  final List<String> location;
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
        Text(location[index]),
      ],
    );
  }
}
