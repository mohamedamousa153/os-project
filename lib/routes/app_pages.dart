import 'package:heritage/screens/details/details_screen.dart';
import 'package:heritage/screens/scan/scan_screen.dart';
import 'package:heritage/routes/app_routes.dart';
import 'package:heritage/screens/splash/splash_screen.dart';

class AppPages {

  static const initialRoute = AppRoutes.SPLASH;


  static final routes = {
    AppRoutes.SCAN: (context)=> ScanScreen(),
    AppRoutes.DETAILS: (context)=> DetailsScreen(),
    AppRoutes.SPLASH: (context)=> SplashScreen(),
  };
}