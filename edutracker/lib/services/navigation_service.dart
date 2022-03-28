import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>(debugLabel: "Root Navigator");
  final GlobalKey<NavigatorState> homeNavigatorKey = new GlobalKey<NavigatorState>(debugLabel: "Home Navigator");
  final GlobalKey<NavigatorState> examNavigatorKey = new GlobalKey<NavigatorState>(debugLabel: "Exam Navigator");
  final GlobalKey<NavigatorState> settingsNavigatorKey = new GlobalKey<NavigatorState>(debugLabel: "Settings Navigator");
}
