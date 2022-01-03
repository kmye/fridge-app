import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_fridge_app/models/fridge.dart';

const fridgeBox = 'fridges';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Fridge>(fridgeBox);
  runApp(MyFridgeApp());
}

class MyFridgeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Text("Hello"));
  }
}
