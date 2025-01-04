import 'package:mega_store/DB/database.dart';
import 'package:mega_store/models/items_model.dart';
class AdditionalMethods {
  static List<ItemsModel> search(String input) {
    return Database.items.where((item) {
      return item.productName.toLowerCase().contains(input.toLowerCase());
    }).toList();
  }
}
