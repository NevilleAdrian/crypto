import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TabProvider extends ChangeNotifier {

  late String _type;
  late String _eventType;

  String get type => _type;
  String get eventType => _eventType;





  static BuildContext? _context;


  setType(String type) => _type = type;
  setEventType(String eventType) => _eventType = eventType;

  changeTabBar(String types){
    setType(types);
    print('type: $type');
    notifyListeners();
  }

  changeEventTabBar(String eventTypes){
    setEventType(eventTypes);
    print('type: $eventType');
    notifyListeners();
  }


  static TabProvider tab(BuildContext context, {bool listen = false}) {
    _context = context;
    return Provider.of<TabProvider>(context, listen: listen);
  }
}
