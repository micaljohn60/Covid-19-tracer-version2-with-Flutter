
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myanmyanti/model/HowtoPrevent.dart';
import 'package:myanmyanti/model/News.dart';

import 'HowtoPreventNotifier.dart';
import 'NewsNotifier.dart';




Future getPrevention (HowtoPreventNotifier hnotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('How_to_Prevent').getDocuments();
  List<HowtoPrevent> _preventionList=[];
  snapshot.documents.forEach((document){
    HowtoPrevent prevention = HowtoPrevent.fromMap(document.data);
     _preventionList.add(prevention);
  });

  hnotifier.preventionList = _preventionList;
}



Future getNews (NewsNotifier nnotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection('News').getDocuments();
  List<News> _newsList = [];
  snapshot.documents.forEach((document){
    News news = News.fromMap(document.data);
    _newsList.add(news);
  });
  nnotifier.newsList=_newsList;
}



