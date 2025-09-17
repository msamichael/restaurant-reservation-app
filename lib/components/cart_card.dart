import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  final String cartImage;
  final String cartName;
  final int cartPrice;
   void Function() onPressed;
   int cardIndex; 


   CartCard(
      {super.key,
      required this.cartImage,
      required this.cartName,
      required this.cartPrice, 
      required this.onPressed,
      required this.cardIndex});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Image.asset(
          cartImage,
          fit: BoxFit.fill,
          // width: double.infinity,
        ),
      ),
      title: Text(cartName),
      subtitle: Text('₦$cartPrice'),
      trailing: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          tapTargetSize:  MaterialTapTargetSize.shrinkWrap
        ),
        onPressed: onPressed, 
        child: Icon(Icons.cancel)),
    );
  }
}
