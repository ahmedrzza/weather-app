import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_api/Model/Model.dart';


  Future<ClassApi> getApi() async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=karachi&appid=f5783e1fee68d6228723ecc46804ee40&units=metric'));
    var data = jsonDecode(response.body.toString());

    return ClassApi.fromJson(data);
    

    
  }

