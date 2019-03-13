import 'dart:convert';
import 'package:http/http.dart' as http;

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  // All dogs start out at 10, because they're good dogs.
  int rating = 10;

  Dog(this.name, this.location, this.description);

  Future getImageUrl() async {
    // Null check so our app isn't doing extra work.
    // If there's already an image, we don't need to get one.
    if (imageUrl != null) {
      return;
    }

    try {
      // Use darts Uri builder
      var response = await http.get('https://dog.ceo/api/breeds/image/random');

      print(response);
       if (response.statusCode == 200) {
          // If server returns an OK response, parse the JSON
          var responseBody = response.body;
          imageUrl = json.decode(responseBody)['message'];
        } else {
          // If that response was not OK, throw an error.
          throw Exception('Failed to load post');
        }

      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      
    } catch (exception) {
      print(exception);
    }
  }
}