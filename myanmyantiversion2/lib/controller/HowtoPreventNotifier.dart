

import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:myanmyanti/model/HowtoPrevent.dart';


class HowtoPreventNotifier with ChangeNotifier{

  List<HowtoPrevent> _preventionList = [];
  HowtoPrevent _currentPrevent;

  UnmodifiableListView<HowtoPrevent> get preventionList => UnmodifiableListView(_preventionList);

  HowtoPrevent get currentPrevent => _currentPrevent;

  set preventionList(List<HowtoPrevent> preventionList){
    _preventionList = preventionList;
    notifyListeners();
  }

  set currentPrevention(HowtoPrevent patient){
    _currentPrevent = currentPrevent;
    notifyListeners();
  }
}