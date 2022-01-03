import 'package:my_fridge_app/models/fridge.dart';

class FridgeRepository {
  var box;

  FridgeRepository(this.box);

  Future<void> add(Fridge fridge) async {
    box.put(fridge.name, fridge);
  }
}