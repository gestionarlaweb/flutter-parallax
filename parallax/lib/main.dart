import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parallax/data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(pageController: pageController, pageOffset: pageOffset),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.pageController,
    required this.pageOffset,
  }) : super(key: key);

  final PageController pageController;
  final double pageOffset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/fondo.jpeg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 28),
                  Text(
                    'Parallax',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ejemplo',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    'Efecto de scroll suave...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  padding: EdgeInsets.only(bottom: 30),
                  child: PageView.builder(
                      itemCount: list_images.length,
                      controller: pageController,
                      itemBuilder: (context, i) {
                        return Transform.scale(
                            scale: 1,
                            child: Container(
                              padding: EdgeInsets.only(right: 20),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(
                                      list_images[i]['image'],
                                      height: 370,
                                      fit: BoxFit.cover,
                                      alignment:
                                          Alignment(-pageOffset.abs() + i, 0),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 6,
                                    child: Text(
                                      list_images[i]['name'],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
