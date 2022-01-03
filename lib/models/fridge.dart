import 'item.dart';
import 'package:hive/hive.dart';

part 'fridge.g.dart';

@HiveType(typeId: 0)
class Fridge extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<Item> items;

  Fridge({required this.name, required this.items});
}
