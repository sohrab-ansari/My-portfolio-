import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Color(0xFF242430),
        child: Column(
          children: [
            Spacer(flex: 2),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/sohrab.png"),
            ),
            Spacer(),

            Text(
              "Sohrab Ansari",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
