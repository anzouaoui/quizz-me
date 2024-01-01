import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Country>> fetchCountries() async {
  final response = await http.get('https://restcountries.com/v3.1/all' as Uri);

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    return (json.decode(response.body) as List)
        .map((e) => Country.fromJson(e))
        .toList();
  } else {
    // If the server returns an error, throw an exception.
    throw Exception('Failed to load countries');
  }
}

class Country {
  final String name;
  final String flag;
  final String capital;

  Country({required this.name, required this.flag, required this.capital});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['translations']['fra']['official'],
      flag: json['flags']['png'],
      capital: json['capital']
    );
  }
}