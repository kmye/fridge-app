import 'package:hive/hive.dart';

abstract class Repository<T extends HiveObject> {
  Future<void> save(T object);

  Future<void> delete(T object);
}