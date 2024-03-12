import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class Restaurant {
  final String name;
  final String typeOfFood;
  final String address;

  Restaurant({
    required this.name,
    required this.typeOfFood,
    required this.address,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RestaurantListScreen(),
    );
  }
}

class RestaurantListScreen extends StatefulWidget {
  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  late List<Restaurant> restaurants = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  Future<void> _fetchRestaurants() async {
    setState(() {
      isLoading = true;
    });

    try {
      final double latitude = 53.2788691; // Set your latitude here
      final double longitude = -74.0060; // Set your longitude here
      final String apiKey =
          's9667g9q9FuzSJzcLzzgZv11ChjMSrIS27KrY370HVVpUEOu79jiOrOrHp1JUNO-v99wl1TQ8g973nnpnjKKJ3XxKbNKNL2Q2d6125jGsncm75EbZhrR9Ws8olzwZXYx'; // Replace with your Yelp API key
      final String url =
          'https://api.yelp.com/v3/businesses/search?latitude=$latitude&longitude=$longitude&categories=restaurants&limit=50';

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $apiKey'},
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        setState(() {
          restaurants = List<Restaurant>.from(jsonData['businesses'].map((data) =>
              Restaurant(
                name: data['name'],
                typeOfFood: data['categories'][0]['title'],
                address: data['location']['address1'] ?? "",
              )));
        });
      } else {
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  List<Container> resCards() {
    List<Container> cards = [];
    for (int i = 0; i < restaurants.length; i++) {
      final restaurant = restaurants[i];
      final color = i.isEven ? Colors.blue : Colors.green; // Alternate colors
      cards.add(
        Container(
          alignment: Alignment.center,
          child: Text(
            restaurant.name,
            style: TextStyle(color: Colors.white),
          ),
          
          color: color,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        ),
      );
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: Flexible(
        child: CardSwiper(
          cardsCount: resCards().length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) => resCards()[index],
        )
      ),
          
    );
  }
}
