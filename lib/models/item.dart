import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 1)
class Item {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final DateTime expiryDate;

  @HiveField(2)
  final String quantity;

  Item({
    required this.name,
    required this.expiryDate,
    required this.quantity,
  });
}
