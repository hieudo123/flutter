import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

enum FlavorType { DEV, QA, PRODUCTION }

class FlavorConfig extends InheritedWidget {
  final String apiBaseUrl;
  final FlavorType appConfigType;
  final String apiKey;
  final Widget child;
  static FlavorConfig _instance;

  factory FlavorConfig(
      {@required String apiBaseUrl,
      @required FlavorType flavorType,
        @required String apiKey,
      @required Widget child}) {
    _instance  ??= FlavorConfig._internal(apiBaseUrl, flavorType, apiKey,child);
    return _instance;
  }

  FlavorConfig._internal(this.apiBaseUrl, this.appConfigType, this.apiKey, this.child);
  static FlavorConfig get instance {
    return _instance;
  }

  static bool isDevelopment() => _instance.appConfigType == FlavorType.DEV;
  static bool isProduction() =>
      _instance.appConfigType == FlavorType.PRODUCTION;
  static bool isQA() => _instance.appConfigType == FlavorType.QA;

  static FlavorConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(FlavorConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
