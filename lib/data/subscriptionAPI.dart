import 'dart:async';
import 'dart:convert';
import 'package:empiricus_teste/models/Subscription.dart';
import 'package:http/http.dart' as http;

class SubscriptionAPI{
  static Future getSubscriptions() async {
    final response = await http.get(Uri.parse('https://empiricus-app.empiricus.com.br/mock/list.json'));
    final decodedResponse = utf8.decode(response.bodyBytes);

    return decodedResponse;
  }
}

List<Subscription> parseSubscriptions(String response){
  final parsedJson = jsonDecode(response) as Map<String, dynamic>;
  final groups = parsedJson['groups'] as List<dynamic>;
  return groups.map<Subscription>((json) => Subscription.fromJson(json)).toList();
}

Future<List<Subscription>> fetchSubscriptions(http.Client client) async {
  final response = await client.get(Uri.parse('https://empiricus-app.empiricus.com.br/mock/list.json'));

  if (response.statusCode == 200) {
    final decodedResponse = utf8.decode(response.bodyBytes);
    return parseSubscriptions(decodedResponse);
  }
  else
  {
    throw Exception('Unexpected rror loading the json');
  }
}