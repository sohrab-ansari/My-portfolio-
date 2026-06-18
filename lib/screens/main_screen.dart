// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:sohrab_portfolio/components/side_menu.dart';
import 'package:sohrab_portfolio/constants.dart';
import 'package:sohrab_portfolio/responsive.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              backgroundColor: bgColor,
              leading: Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
              ),
              actions: [
                Image.asset("assets/icons/sa_icon.png")
              ],
            ),
      drawer: SideMenu(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Expanded(flex: 2, child: SideMenu()),
              SizedBox(width: defaultPadding),
              Expanded(
                flex: 7,
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...children,
                      // our footer
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}  

