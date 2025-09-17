import 'package:flutter/material.dart';


// widget for each of the filter widgets
class FilterCard extends StatelessWidget {
  final Widget child;

  const FilterCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 3,
                spreadRadius: 1,
                offset: Offset(3, 3))
          ]),
      child: child,
    );
  }
}
