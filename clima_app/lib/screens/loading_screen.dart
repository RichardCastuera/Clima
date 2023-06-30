import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';

const apiKey = '17d1c91fa7072e277d12aa313eaf2e8d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentPositionData();
  }

  void getCurrentPositionData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
    print(weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
