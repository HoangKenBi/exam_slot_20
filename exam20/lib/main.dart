import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class Place {
  final int id;
  final String imageUrl;
  final String name;
  final String description;
  final double rating;

  Place({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.rating,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Place>? places; // Make the places list nullable

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/places/getAll'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        places = data.map((placeData) => Place(
          id: placeData['id'],
          imageUrl: placeData['imageUrl'],
          name: placeData['name'],
          description: placeData['description'],
          rating: placeData['rating'].toDouble(),
        )).toList();
      });
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Places App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Hi Guy',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildCategoryButton('Hotels', 'assets/ico_hotel.png'),
              _buildCategoryButton('Flights', 'assets/ico_plane.png'),
              _buildCategoryButton('All', 'assets/ico_hotel_plane.png'),
            ],
          ),
          Expanded(
            child: places != null
                ? ListView.builder(
              itemCount: places!.length,
              itemBuilder: (context, index) {
                final place = places![index];
                return ListTile(
                  leading: Image.network(place.imageUrl, width: 50, height: 50),
                  title: Text(place.name),
                  subtitle: Text(place.description),
                  trailing: Text('Rating: ${place.rating}'),
                );
              },
            )
                : const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String category, String imagePath) {
    return Column(
      children: [
        Image.asset(imagePath, width: 40, height: 40),
        ElevatedButton(
          onPressed: () {
            // Handle category button tap
          },
          child: Text(category),
        ),
      ],
    );
  }
}
