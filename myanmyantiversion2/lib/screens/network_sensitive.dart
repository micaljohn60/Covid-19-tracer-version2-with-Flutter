 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myanmyanti/emum/connectivity_state.dart';
import 'package:provider/provider.dart';

class NetworkSensitive extends StatelessWidget{

  final Widget child;

  NetworkSensitive({this.child});



  final closeButton = Container(
    padding: EdgeInsets.only(top: 30),
    child:  RaisedButton(
      padding: const EdgeInsets.all(8.0),
      textColor: Colors.white,
      color: Colors.red,
      onPressed: () => exit(0),
      child: new Text("Exit"),
    ),
  );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if(connectionStatus == ConnectivityStatus.Wifi || connectionStatus == ConnectivityStatus.Cellular){
          return child;
    }
    if(connectionStatus == ConnectivityStatus.Offline){
      return Container(
        color: Colors.white,
        child: Center(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(image: AssetImage("image/noInternetconnection.jpg")),
                  Container(
                    padding: EdgeInsets.all(30),
                  child: Align(
                      alignment: Alignment.center,
                      child: Text("Wifi (သို့) mobile data connection မရနိုင်သောကြောင့် အချက်အလက်များလွဲမှားနိုင်ပါသည်။",),
                    )
                  ),

                  Text("ကျေးဇူးပြု၍ Internet ချိတ်ဆက်ပေးပါ။"),
                  closeButton
                ],
              ),
            )
        ),
      );
    }
  }

}