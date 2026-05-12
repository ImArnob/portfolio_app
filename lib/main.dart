import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                Details(
                  icon: Icon(Icons.location_city,color: Colors.white),
                  title: "Location",
                  subtitle: "Chittagong, Bangladesh",
                  color: Colors.deepPurple,
                ),
                Details(
                  icon: Icon(Icons.school,color: Colors.white),
                  title: "Education",
                  subtitle: "BSc. in Computer Science & Engineering",
                  color: Colors.green,
                ),
                Details(
                  icon: Icon(Icons.work,color: Colors.white),
                  title: "Skills",
                  subtitle: "Flutter, Dart, html, css, javascript",
                  color: Colors.cyan,
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.deepPurple.shade100,
        foregroundColor: Colors.deepPurple,
        children: [
          SpeedDialChild(
            child: Icon(Icons.facebook, color: Colors.white),
            backgroundColor: Colors.blue,
            label: 'Facebook',
            onTap: () {
              openLink("https://www.facebook.com");
            },
          ),

          SpeedDialChild(
            child: Icon(Icons.code, color: Colors.white),
            backgroundColor: Colors.black,
            label: 'GitHub',
            onTap: () {
              openLink("https://www.github.com");
            },
          ),

          SpeedDialChild(
            child: Icon(Icons.email, color: Colors.white),
            backgroundColor: Colors.red,
            label: 'Email',
            onTap: () {
              openLink("https://www.gmail.com");
            },
          ),
        ],
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
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
