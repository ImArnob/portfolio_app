import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'My Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),

                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      fit: BoxFit.cover,
                      'https://i.postimg.cc/XqMMMVgt/A3.jpg',
                    ),
                  ),
                ),
                Text(
                  "Nehal Azad",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Flutter Beginner and Future App Developer",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 300,

                  child: Text(
                    "Flutter is a great framework for building beautiful and responsive mobile applications. I am excited to learn and grow as a Flutter developer.",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                details(
                  icon: Icon(Icons.location_city),
                  title: "Location",
                  subtitle: "Chittagong, Bangladesh",
                  color: Colors.deepPurple,
                ),
                details(
                  icon: Icon(Icons.school),
                  title: "Education",
                  subtitle: "BSc. in Computer Science & Engineering",
                  color: Colors.green,
                ),
                details(
                  icon: Icon(Icons.work),
                  title: "Skills",
                  subtitle: "Flutter, Dart, html, css, javascript",
                  color: Colors.cyan,
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Connect with me",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 200,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.facebook, color: Colors.white),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black,
                              child: Icon(Icons.code, color: Colors.white),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.email, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class details extends StatelessWidget {
  const details({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  final String title;
  final String subtitle;
  final Widget icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      width: screenWidth * 1,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
      // width: 350,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
            child: icon,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,

              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
