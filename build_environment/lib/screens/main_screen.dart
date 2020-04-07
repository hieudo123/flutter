import 'package:build_environment/common/app_colors.dart';
import 'package:build_environment/models/movie/movie_res.dart';
import 'package:build_environment/network/api_provider.dart';
import 'package:build_environment/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../configs/flavor_config.dart';

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var config = FlavorConfig.of(context);
    return MaterialApp(
      title: config.appConfigType.toString(),
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.kPrimaryColor,
        scaffoldBackgroundColor: AppColors.kScaffoldColor,
      ),
      home: HomeScreen(),
    );
  }
}