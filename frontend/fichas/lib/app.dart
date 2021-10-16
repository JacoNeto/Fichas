import 'package:fichas/pages/home.dart';
import 'package:fichas/utils/my_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// flutterfire app
class Fichas extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        //TODO error
        if (snapshot.hasError) {
          print("DEU ERRAAAAAAAAADOOOOOOOOOO");
          return const GetMaterialApp(
              debugShowCheckedModeBanner: false,
              home: Center(child: CircularProgressIndicator()));
        }

        // Once complete, the application
        if (snapshot.connectionState == ConnectionState.done) {
          print("DEU BOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOM");
          return const MyApp();
        }
        /*RepositoryProvider.value(
            value: authenticationService,
            child: BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(authenticationService),
              child: FichasApp(),
            ),
          ); */

        // Otherwise, show something whilst waiting for initialization to complete
        return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colorC1,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomePage());
  }
}
