import 'package:flutter/material.dart';
import 'package:igapp/screens/homescreen2.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    );
    _animation =
    CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();


    // Wait for 3 seconds and then navigate to the home screen
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => HomeScreen2()));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Center(
                child: Hero(
                  tag: 'iglogo',
                  child: CircleAvatar(
                    radius: _animation.value * 70,
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Powered By',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 70),
                        child: Image.asset(
                          'images/ids333-removebg-preview.png', // Replace with your logo path
                          width: 200,
                          height: 200, // Adjust the height as needed
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
