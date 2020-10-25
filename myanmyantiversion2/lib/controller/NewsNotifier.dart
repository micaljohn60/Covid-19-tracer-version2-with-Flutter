import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../model/News.dart';

class NewsNotifier with ChangeNotifier{

  List<News> _newsList = [];
  News _currentNews;

  UnmodifiableListView<News> get newsList => UnmodifiableListView(_newsList);

  News get currentNews => _currentNews;

  set newsList(List<News> newsList){
    _newsList = newsList;
    notifyListeners();
  }

  set currentNew(News news){
    _currentNews = currentNews;
    notifyListeners();
  }
}