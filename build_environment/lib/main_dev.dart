import 'package:build_environment/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'configs/flavor_config.dart';
import 'main.dart';

void main() {
  var configuredApp = new FlavorConfig(
    apiBaseUrl: 'https://api.themoviedb.org/3/',
    flavorType: FlavorType.DEV,
    apiKey: "8cb4d05a4ce93aba403c02c466e4038c",
    child: new MyApp(),
  );

  runApp(configuredApp);
}
