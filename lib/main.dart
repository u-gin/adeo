import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:testproject/providers/connectivity_provider.dart';
import 'package:testproject/providers/questions_provider.dart';
import 'package:testproject/services/connectivity_service.dart';
import 'package:testproject/services/questions_service.dart';
import 'package:testproject/views/alert_screen.dart';
import 'package:testproject/views/results_screen.dart';
import 'package:testproject/views/summary_screen.dart';
import 'package:testproject/views/workbook_screen.dart';

import 'views/onboarding_screen.dart';

void setupLocator(){
  GetIt.I.registerLazySingleton(() => QuestionsService());
  GetIt.I.registerLazySingleton(() => ConnectivityService());
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences.setMockInitialValues({});
  setupLocator();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp(whichRoute: OnboardingScreen.routeName,));
}

class MyApp extends StatelessWidget {

  final String whichRoute;

  const MyApp({required this.whichRoute});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },

      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => QuestionsProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ConnectivityProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            //primaryColor: ColorSys.primary,
            //fontFamily: 'Metropolis',
          ),
          routes: <String, WidgetBuilder>{
            OnboardingScreen.routeName: (context) => OnboardingScreen(),
            WorkbookScreen.routeName: (context) => WorkbookScreen(),
            ResultsScreen.routeName: (context) => ResultsScreen(),
            SummaryScreen.routeName: (context) => SummaryScreen(),
            AlertScreen.routeName: (context) => AlertScreen(),
          },
          initialRoute: whichRoute,
          onGenerateRoute: (RouteSettings settings){
            return null;
          },
          onUnknownRoute: (RouteSettings settings){
            return null;
          },
        ),
      ),

    );
  }

}

