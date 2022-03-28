import 'package:get_it/get_it.dart';


//IMPORT your services below
import 'package:edutracker/services/database_service.dart';
// import 'package:edutracker/services/person_service.dart';


GetIt locator = GetIt.instance;

//ADD it to the list of services
void setupLocator() {
  locator.registerLazySingleton(() => DatabaseService());
}