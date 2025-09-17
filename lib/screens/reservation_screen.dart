import 'package:flutter/material.dart';
import 'package:restaurant_app/model/constants.dart';
import 'package:restaurant_app/model/data/restaurant_list_data.dart';
import 'package:restaurant_app/model/service/reservation_service.dart';



class ReservationScreen extends StatefulWidget {

  Map? cloudResNo;
  ReservationScreen({
    super.key,
    required this.cloudResNo
    });

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {


Future<void> _fetchUserReservationNumber() async{
  
    Map fxCloudResNo = await ReservationService.fetchUserReservation();
  setState((){
    widget.cloudResNo = fxCloudResNo;
  }); 
}

@override 
void initState() {
    super.initState();
    
  _fetchUserReservationNumber();
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0,),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: () => Navigator.pop(context),),
                  Text('Reservations', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),),
                  Text('')
                ],
              ),
                SizedBox(height: 30,),
                Text('Here are your reservations:',style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 35,),

                Text(RestaurantList.restaurantList[0].name+ ' : '+ (widget.cloudResNo?['dalish'].toString() ?? 0.toString()) + ' Reservations of 25', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 35, child: Divider(color: kbrandColor,),),
                Text(RestaurantList.restaurantList[1].name+ ' : ' + (widget.cloudResNo?['muniz'].toString() ?? 0.toString())+ ' Reservations of 20', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 35, child: Divider(color: kbrandColor,),),
                Text(RestaurantList.restaurantList[2].name+ ' : ' + (widget.cloudResNo?['boripe'].toString() ?? 0.toString())+ ' Reservations of 21', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 35, child: Divider(color: kbrandColor,),),
                Text(RestaurantList.restaurantList[3].name+ ' : ' + (widget.cloudResNo?['cake city'].toString() ?? 0.toString())+ ' Reservations of 10', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 35, child: Divider(color: kbrandColor,),),
                Text(RestaurantList.restaurantList[4].name+ ' : ' + (widget.cloudResNo?['hand of god'].toString() ?? 0.toString())+ ' Reservations of 15', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 35, child: Divider(color: kbrandColor,),),
                Text(RestaurantList.restaurantList[5].name+ ' : ' + (widget.cloudResNo?['skillz'].toString() ?? 0.toString())+ ' Reservations of 20', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                SizedBox(height: 35, child: Divider(color: kbrandColor,),),
                ],),
        ),
      ),
    );
  }
}
