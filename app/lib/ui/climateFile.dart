// TODO Implement this library.// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final textController1 = TextEditingController();
  String country = "Pakistan";
  String cityName = "Multan";
  String feals = "15";
  String wind = "2.0";
  double temp = 290;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title:
              const Text("Weather App", style: TextStyle(color: Colors.orange)),
          backgroundColor: Colors.transparent,
          actions: [
            AnimSearchBar(
              helpText: "Search City",
              width: 300,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              suffixIcon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
              textController: textController1,
              closeSearchOnSuffixTap: true,
              onSuffixTap: () {
                if (textController1.text.isNotEmpty) {
                  setState(() {
                    cityName = textController1.text;
                  });
                }
              },
              onSubmitted: (String) {},
            ),
          ],
          elevation: 0,
        ),
        backgroundColor: Colors.deepOrange,
        body: Stack(
          children: [
            Image.asset(
              "images/scr1.jpeg",
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Text(
                    "$cityName,$country",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                  child: Row(
                    children: [
                      const Expanded(
                          flex: 1,
                          child: Image(image: AssetImage("images/cloud1.png"))),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                              "${(temp - 273.15).round()}° C",
                              style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Feals like $feals°",
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Wind Speed $wind m/s",
                              style: const TextStyle(fontSize: 12),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// api key a8109884b12149502a52543be38d5db0
// api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
