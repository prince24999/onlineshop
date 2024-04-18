import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/comment.dart';
import '../model/pr.dart';


class NetworkRequest {

  static List<Pr> prFromJson(String str) => List<Pr>.from(json.decode(str).map((x) => Pr.fromJson(x)));

  static List<Pr> listPrParse(String responsebody){
    var list = json.decode(responsebody) as List<dynamic>;
    List<Pr> prs = list.map((model) => Pr.fromJson(model)).toList();
    return prs;
  }

  static Future<List<Pr>> fetchPr(String urlProductFromCat) async
  {
    final response = await http.get(Uri.parse(urlProductFromCat));

    if(response.statusCode == 200)
    {
      //return prFromJson(response.body);
      return compute(listPrParse,response.body);
    }
    else if (response.statusCode == 404)
    {
      throw Exception('Not found');
    }
    else
    {
      throw Exception('Cannot get data');
    }
  }

  static List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

  static Future<List<Comment>> fetchComment(String url) async
  {
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200)
    {
      return commentFromJson(response.body);

    }
    else if (response.statusCode == 404)
    {
      throw Exception('Not found');
    }
    else
    {
      throw Exception('Cannot get data');
    }
  }
  

}