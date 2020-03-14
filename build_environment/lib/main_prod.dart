import 'package:flutter/material.dart';

import 'configs/flavor_config.dart';
import 'main.dart';

void main() {
  var configuredApp = new FlavorConfig(
    apiBaseUrl: 'https://api.themoviedb.org/3/',
    flavorType: FlavorType.PRODUCTION,
    apiKey: 'ee8cf966d22254270f6faa1948ecf3fc',
    child: new MyApp(),
  );

  runApp(configuredApp);
}
