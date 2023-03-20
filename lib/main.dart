import 'package:flutter/material.dart';
import 'HOME_MENU/_home_menu_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TEST INDIGY', theme: ThemeData(), home: Splash());
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeMenuProduct()));
    });
    super.initState();
  }
   String IMAGE_LOGO = 'https://indigy.com/assets/img/logo_blue.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: Column(
            children: [
              /// image Logo
              Container(
                child: Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            height: 70,
                            width: 70,
                            child: Center(
                                child: IMAGE_LOGO == null
                                    ?Container(
                                  ///app internet not downlode image
                                  height: 70,
                                  width: 70,
                                  color: Colors.grey[100],
                                    child: Image.asset('images/logo_blue.png'),
                                )
                                    : Image.network('$IMAGE_LOGO'))),
                        SizedBox(
                          height: 15,
                        ),

                        /// text
                        Container(
                          child: Text(
                            "Indigy Company",
                            style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
