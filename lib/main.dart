import 'package:flutter/material.dart';
import 'package:recipe_app/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

//////
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Recipe App')),
//         body: RecipeScreen(),
//       ),
//     );
//   }
// }

// class RecipeScreen extends StatefulWidget {
//   @override
//   _RecipeScreenState createState() => _RecipeScreenState();
// }

// class _RecipeScreenState extends State<RecipeScreen> {
//   List recipes = [];
//   bool isLoading = true;
//   String errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchRecipes();
//   }

//   Future<void> fetchRecipes() async {
//     final url = 'https://yummly2.p.rapidapi.com/feeds/list';
//     final headers = {
//       'x-rapidapi-key': '9621e3954amsh283d94076b12d61p129b7bjsn98fdb423a782',
//       'x-rapidapi-host': 'yummly2.p.rapidapi.com',
//     };
//     final querystring = {'limit': '24', 'start': '0'};

//     try {
//       final response = await http.get(
//         Uri.parse(url).replace(queryParameters: querystring),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         setState(() {
//           recipes = data['feed']; // Adjust this if needed based on actual JSON
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = 'Failed to load recipes: ${response.statusCode}';
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() {
//         errorMessage = 'Error: $e';
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Center(child: CircularProgressIndicator())
//         : errorMessage.isNotEmpty
//             ? Center(child: Text(errorMessage))
//             : ListView.builder(
//                 itemCount: recipes.length,
//                 itemBuilder: (context, index) {
//                   final recipe = recipes[index]['content']['details'];
//                   return ListTile(
//                     title: Text(recipe['name']),
//                     subtitle: Text('Rating: ${recipe['rating']}'),
//                     leading:
//                         recipe['images'] != null && recipe['images'].isNotEmpty
//                             ? Image.network(
//                                 recipe['images'][0]['hostedLargeUrl'],
//                                 width: 50,
//                                 height: 50,
//                                 fit: BoxFit.cover,
//                               )
//                             : Icon(Icons.fastfood),
//                   );
//                 },
//               );
//   }
// }
