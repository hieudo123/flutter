import 'package:build_environment/common/app_colors.dart';
import 'package:build_environment/common/app_strings.dart';
import 'package:build_environment/screens/movie/bloc/categories_bloc.dart';
import 'package:build_environment/screens/movie/bloc/categories_event.dart';
import 'package:build_environment/screens/movie/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  static List<Widget> widgetOptions() {
    return [
      BlocProvider<CategoriesBloc>(
        create: (context) => CategoriesBloc()..add(FetchCategories()),
        child: MovieScreen(),
      ),
      Container(),
      Container(),
    ];
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: IndexedStack(
          index: selectedIndex,
          children: widgetOptions(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.kBottomNavColor,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text(AppStrings.kBookmark),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text(AppStrings.kAccount),
          )
        ],
        onTap: (index) {
          onItemTapped(index);
        },
        selectedFontSize: 11,
        unselectedFontSize: 11,
        selectedItemColor: AppColors.kAppBarColor,
        currentIndex: selectedIndex,
      ),
    );
  }
}

