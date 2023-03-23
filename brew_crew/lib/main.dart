import 'package:brew_crew/screens/home/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'models/firebaseuser.dart';
import 'services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Map<int, Color> color = {
  50: const Color(0xffA85CF9),
  100: const Color(0xffA85CF9),
  200: const Color(0xffA85CF9),
  300: const Color(0xffA85CF9),
  400: const Color(0xffA85CF9),
  500: const Color(0xffA85CF9),
  600: const Color(0xffA85CF9),
  700: const Color(0xffA85CF9),
  800: const Color(0xffA85CF9),
  900: const Color(0xffA85CF9),
};
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: MaterialColor(0xffA85CF9, color),
          brightness: Brightness.light,
          primaryColor: const Color(0xffA85CF9),
          buttonTheme: ButtonThemeData(
            buttonColor: const Color(0xffA85CF9),
            textTheme: ButtonTextTheme.primary,
            colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
                
          ),
          fontFamily: "Helvetica",
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
