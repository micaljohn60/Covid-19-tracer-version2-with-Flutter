import 'package:cloud_firestore/cloud_firestore.dart';

class News{
  String id;
  String title;
  String subTitle;
  String detail;
  String imageLink;

  News.fromMap(Map<String, dynamic> data){
    id = data['id'];
    title = data['title'];
    subTitle = data['subTitle'];
    imageLink = data['imageLink'];
    detail = data["detail"];
  }

  News.fromSnapshot(DocumentSnapshot document){

  }
}