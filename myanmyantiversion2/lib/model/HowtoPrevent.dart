
import 'package:cloud_firestore/cloud_firestore.dart';

class HowtoPrevent{
  String id;
  String title;
  String imageLink;
  String detailFact;

  HowtoPrevent.fromMap(Map<String,dynamic> data){
    id = data['id'];
    title = data['title'];
    imageLink = data ['imageLink'];
    detailFact = data['detailFact'];
  }

  HowtoPrevent.fromSnapshot(DocumentSnapshot document){

  }

}