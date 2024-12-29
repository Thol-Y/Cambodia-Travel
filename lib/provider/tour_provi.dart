import 'package:cambodia_travel/model/tourism.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TourProvider extends ChangeNotifier{
  final List<Tourism> _tourplan = [];
  List<Tourism> get tourplan => _tourplan;

  void toggleplans(Tourism tourism){
    if (_tourplan.contains(tourism)) {
      _tourplan.remove(tourism);
    }else{
      _tourplan.add(tourism);
    }
    notifyListeners();
  }

  bool isExists (Tourism tourism){
    final isExist = _tourplan.contains(tourism);
    return isExist;
  }

  static TourProvider of(
    BuildContext context, {
      bool listen = true,
    }
  ){
    return Provider.of<TourProvider>(
      context,
      listen: listen,
      );
  }
}