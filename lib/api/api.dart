import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_cart/utils/constants.dart';

fetchData() async {
  var url = Uri.parse(apiUrl);
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var decodedData = jsonDecode(response.body);
    return decodedData;
  }
}
