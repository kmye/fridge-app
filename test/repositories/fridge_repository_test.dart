
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:my_fridge_app/models/fridge.dart';
import 'package:my_fridge_app/models/item.dart';
import 'package:my_fridge_app/repositories/fridge_repository.dart';
import 'package:clock/clock.dart';

void main() {
  setUp(() async {
    await setUpTestHive();
    Hive.registerAdapter(FridgeAdapter());
    Hive.registerAdapter(ItemAdapter());
  });

  group('fridge repository', () {
    test('should add a fridge with items correctly', () async {
      var box = await Hive.openBox('fridges');
      FridgeRepository fridgeRepository = FridgeRepository(box);

      Fridge fridge = withClock(Clock.fixed(DateTime(2020, 09, 01)), () => Fridge(name: 'random fridge', items: [Item(name: 'milk', expiryDate: clock.now())]));
      await fridgeRepository.add(fridge);

      expect(box.getAt(0).name, 'random fridge');
      expect(box.getAt(0).items.length, 1);
      expect(box.getAt(0).items[0].name, 'milk');
      expect(box.getAt(0).items[0].expiryDate.toString(), '2020-09-01 00:00:00.000');
    });
  });

  tearDown(() async {
    await tearDownTestHive();
  });
}