import 'package:my_fridge_app/models/fridge.dart';
import 'package:my_fridge_app/repositories/repository.dart';

class FridgeRepository implements Repository<Fridge> {
  var box;

  FridgeRepository(this.box);

  @override
  Future<void> delete(Fridge object) async {
    await box.delete(object.key);
  }

  @override
  Future<void> save(Fridge object) async {
    await box.put(object.name, object);
  }
}
