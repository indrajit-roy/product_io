import 'package:fluttertoast/fluttertoast.dart';

class ProductIOUIService {
  static Future<bool?> showToast(String text) => Fluttertoast.showToast(msg: text);
}
