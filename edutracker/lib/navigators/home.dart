// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:edutracker/services/navigation_service.dart';
import 'package:edutracker/services/service_locator.dart';

// import screens here

//e.g. import 'package:edutracker/<path>.dart'

class HomeNavigator extends StatefulWidget {
  HomeNavigator({
    Key? key
  }) : super(key: key);

  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator>
  with AutomaticKeepAliveClientMixin {
    
    @override
    bool get wantKeepAlive => true;

    @override
    Widget build(BuildContext context) {
      super.build(context);
      print("Building Home Navigator");
      
      return Navigator(

        key: locator<NavigationService>().homeNavigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch(settings.name) {
                case '/':
                  // return HomePage();
                break;
                /*
                case: '/<route path>':
                  return <class of page>();
                break;
                 */

                case '/notconnected':
                  // return NotConnectedPage();
                break;
              }
            }
          );
        },
      );
    }
  }