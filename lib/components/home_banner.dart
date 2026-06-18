// ignore_for_file: unused_local_variable, deprecated_member_use

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sohrab_portfolio/constants.dart';

class HomeBanner extends StatefulWidget {
  const HomeBanner({super.key});

  @override
  State<HomeBanner> createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  bool animateButton = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          animateButton = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return AspectRatio(
      // aspectRatio: w < 600 ? 1.2 : 3,
      aspectRatio: w < 480
          ? 1.1
          : w < 800
          ? 1.6
          : 3,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1.0,
              enlargeCenterPage: false,
            ),
            items: [
              Image.asset(
                "assets/images/bg.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.asset(
                "assets/images/bg1.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Image.asset(
                "assets/images/bg.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
               Image.asset(
                "assets/images/bg1.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),

          // Image.asset("assets/images/bg.png", fit: BoxFit.cover),
          Container(
            color: darkColor.withOpacity(0.66),

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxWidth < 600;

                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// TITLE
                      Text(
                        "Discover my amazing \nart space!",
                        // style: Theme.of(context).textTheme.headlineLarge!
                        //     .copyWith(
                        //       color: Colors.white,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(
                              fontSize: w < 600
                                  ? 18
                                  : w < 1000
                                  ? 30
                                  : 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),

                      const SizedBox(height: 10),

                      /// TAGLINE
                      isSmall
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    FlutterCodedText(),
                                    const SizedBox(width: 6),
                                    const Text("I build"),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                const MyBuildAnimatedText(),
                                const SizedBox(height: 6),
                                // FlutterCodedText(),
                              ],
                            )
                          : Row(
                              children: [
                                FlutterCodedText(),
                                const SizedBox(width: 6),
                                const Text("I build "),
                                const SizedBox(width: 6),
                                const Expanded(child: MyBuildAnimatedText()),
                                // const SizedBox(width: 6),
                                // FlutterCodedText(),
                              ],
                            ),

                      const SizedBox(height: 20),

                      /// BUTTON EXPLORE
                      CustomAnimatedButton(
                        animateButton: animateButton,
                        text: "Explore Now",
                        onTap: () {
                          print("Button Clicked");
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Flutter Code Text Widget
Text FlutterCodedText() {
  return Text.rich(
    TextSpan(
      text: "<",
      children: const [
        TextSpan(
          text: "Flutter",
          style: TextStyle(color: primaryColor),
        ),
        TextSpan(text: ">"),
      ],
    ),
  );
}

/// Animated Text
class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    double fontSize;

    if (w >= 1200) {
      fontSize = 14;
    } else if (w >= 800) {
      fontSize = 20;
    } else if (w >= 600) {
      fontSize = 14;
    } else {
      fontSize = 12;
    }

    return SizedBox(
      width: double.infinity,
      child: AnimatedTextKit(
        isRepeatingAnimation: true,
        animatedTexts: [
          TyperAnimatedText(
            "Responsive web and mobile app",
            speed: const Duration(milliseconds: 60),
            textStyle: TextStyle(fontSize: fontSize),
          ),
          TyperAnimatedText(
            "Complete e-commerce app UI",
            speed: const Duration(milliseconds: 60),
            textStyle: TextStyle(fontSize: fontSize),
          ),
          TyperAnimatedText(
            "Chat app with dark and light theme",
            speed: const Duration(milliseconds: 60),
            textStyle: TextStyle(fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}

// // EXPLORE BUTTON
// class CustomAnimatedButton extends StatelessWidget {
//   final bool animateButton;
//   final String text;
//   final VoidCallback? onTap;

//   const CustomAnimatedButton({
//     super.key,
//     required this.animateButton,
//     required this.text,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;

//     double buttonWidth;

//     // Responsive Width
//     if (w >= 1024) {
//       buttonWidth = w * 0.14;
//     } else if (w >= 700) {
//       buttonWidth = w * 0.25;
//     } else {
//       buttonWidth = w * 0.55;
//     }

//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 700),
//       curve: Curves.easeOutBack,

//       height: animateButton ? 52 : 0,
//       width: animateButton ? buttonWidth : 0,

//       decoration: BoxDecoration(
//         gradient: const LinearGradient(colors: [secondaryColor, primaryColor]),

//         borderRadius: BorderRadius.circular(30),

//         boxShadow: animateButton
//             ? [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.35),
//                   blurRadius: 10,
//                   offset: const Offset(0, 5),
//                 ),
//               ]
//             : [],
//       ),

//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(30),
//           onTap: onTap,
//           child: Center(
//             child: AnimatedOpacity(
//               duration: const Duration(milliseconds: 400),
//               opacity: animateButton ? 1 : 0,
//               child: Text(
//                 text,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: w < 600 ? 14 : 16,
//                   fontWeight: FontWeight.w600,
//                   letterSpacing: 0.5,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomAnimatedButton extends StatelessWidget {
  final bool animateButton;
  final String text;
  final VoidCallback? onTap;

  const CustomAnimatedButton({
    super.key,
    required this.animateButton,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    // final double buttonWidth = (w * 0.2).clamp(140.0, 220.0);

    // final double buttonHeight = w < 600 ? 46 : 52;

    final double buttonWidth = w < 400
        ? 120
        : w < 600
        ? 150
        : w < 1000
        ? 180
        : 220;

    final double buttonHeight = w < 400
        ? 40
        : w < 600
        ? 44
        : 52;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutBack,

      height: animateButton ? buttonHeight : 0,
      width: animateButton ? buttonWidth : 0,

      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [secondaryColor, primaryColor]),
        borderRadius: BorderRadius.circular(30),

        boxShadow: animateButton
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ]
            : [],
      ),

      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: animateButton ? 1 : 0,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: w < 600 ? 13 : 15,
                  fontSize: w < 400
                      ? 11
                      : w < 600
                      ? 13
                      : 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
