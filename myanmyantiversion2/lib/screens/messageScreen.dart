import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageState();
  }

}

class MessageState extends State<Message>{

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final List<Message> messages= [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
        },
        onLaunch: (Map<String, dynamic> message) async {
        },
        onResume: (Map<String, dynamic> message) async {

        }
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      color: Colors.blue,
      child: Message(),
    );
  }

}