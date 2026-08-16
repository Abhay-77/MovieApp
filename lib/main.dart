import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/api.dart';

import 'pages/movies_page.dart';
import 'pages/favourites_page.dart';
import 'pages/profile_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  favoritesBox = await Hive.openBox('favorites');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieFlix',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [MoviesPage(), FavoritesPage(), ProfilePage()];
  final List<Map<String, dynamic>> _pageTitles = [
    {'title': 'Movies', 'icon': Icons.home},
    {'title': 'Favorites', 'icon': Icons.favorite},
    {'title': 'Profile', 'icon': Icons.person},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MovieFlix')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _pageTitles
            .map(
              (title) => BottomNavigationBarItem(
                icon: Icon(title['icon']),
                label: title['title'],
              ),
            )
            .toList(),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
