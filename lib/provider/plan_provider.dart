import 'package:cambodia_travel/model/recommend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlanProvider extends ChangeNotifier{
  final List<Recommend> _plan = [];
  List<Recommend> get plan => _plan;

  void toggleplan(Recommend recommend){
    if (_plan.contains(recommend)) {
      _plan.remove(recommend);
    }else{
      _plan.add(recommend);
    }
    notifyListeners();
  }

  bool isExist (Recommend recommend){
    final isExist = _plan.contains(recommend);
    return isExist;
  }

  static PlanProvider of(
    BuildContext context, {
      bool listen = true,
    }
  ){
    return Provider.of<PlanProvider>(
      context,
      listen: listen,
      );
  }
}