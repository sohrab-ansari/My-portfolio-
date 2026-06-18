// ignore_for_file: use_key_in_widget_constructors, use_full_hex_values_for_flutter_colors, unused_element, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sohrab_portfolio/components/my_info.dart';
import 'package:sohrab_portfolio/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  Future<void> _whatsAppLink() async {
    final Uri url = Uri.parse('https://wa.me/918789685850');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _instagramLink() async {
    final Uri url = Uri.parse('https://www.instagram.com/sohrabbb_07/');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _linkedinLink() async {
    final Uri url = Uri.parse(
      'https://www.linkedin.com/in/sohrab-ansari-a0b016324/',
    );
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _gitHubLink() async {
    final Uri url = Uri.parse('https://github.com/sohrab-ansari');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _facebookLink() async {
    final Uri url = Uri.parse('https://www.facebook.com/share/1KDAh6wLgq/');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _downloadCV() async {
    final Uri url = Uri.parse(
      'https://drive.google.com/file/d/1J_Hy7BFREdiW_Gmn-Mq_DPOPFZFqT5FJ/view?usp=sharing',
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();

    return Drawer(
      child: Column(
        children: [
          MyInfo(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,

              padding: EdgeInsets.all(defaultPadding / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AreaInfoText(title: "Residency", subTitle: "India"),
                  AreaInfoText(title: "City", subTitle: "Bhopal"),
                  AreaInfoText(title: "Age", subTitle: "22"),
                  Divider(thickness: 0.5,),

                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: defaultPadding /2 ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: defaultPadding / 2,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Skills",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SkillsAnimation(label: "Dart", percentage: 0.8),
                      ),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: SkillsAnimation(
                          label: "Flutter",
                          percentage: 0.7,
                        ),
                      ),
                      SizedBox(width: defaultPadding),

                      Expanded(
                        child: SkillsAnimation(
                          label: "Firebase",
                          percentage: 0.65,
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 0.5,),
                  Text(
                    "Coding",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  CODING(percentage: 0.8, label: "Dart"),
                  SizedBox(height: defaultPadding / 2),
                  CODING(percentage: 0.7, label: "Flutter"),
                  SizedBox(height: defaultPadding / 2),
                  CODING(percentage: 0.65, label: "FireBase"),
                  Divider(thickness: 0.5,),
                  SizedBox(height: defaultPadding / 2),
                  Text(
                    "Knowledge",
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: defaultPadding / 2),
                  Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: defaultPadding / 3),
                      Text("Dart, Flutter"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: defaultPadding / 3),
                      Text("Firebase"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.done,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(width: defaultPadding / 3),
                      Text("gitHub"),
                    ],
                  ),
                  SizedBox(height: defaultPadding / 2),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding / 5,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [secondaryColor, primaryColor],
                      ),
                      // color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {
                        print("Download CV");
                        _downloadCV();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "Download CV",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.download, size: 18, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(height: defaultPadding,),
                  Container(
                    margin: EdgeInsets.only(top: defaultPadding),
                    color: Color(0XFF24243),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // WhatsApp
                        IconButton(
                          onPressed: () {
                            _whatsAppLink();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                        ),

                        // Instagram
                        IconButton(
                          onPressed: () {
                            _instagramLink();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.purple,
                          ),
                        ),

                        // LinkedIn
                        IconButton(
                          onPressed: () {
                            _linkedinLink();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.blue,
                          ),
                        ),

                        // GitHub
                        IconButton(
                          onPressed: () {
                            _gitHubLink();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.github,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _facebookLink();
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Skills
class SkillsAnimation extends StatelessWidget {
  final double percentage;
  final String label;
  const SkillsAnimation({
    super.key,
    required this.percentage,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: defaultDuration,
            builder: (context, double value, child) {
              return SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: value,
                      color: primaryColor,
                      backgroundColor: darkColor,
                    ),

                    // Center text inside progress circle
                    Center(
                      child: Text(
                        "${(value * 100).toInt()}%",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: defaultPadding / 2),
        Text(label, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}

// About
class AreaInfoText extends StatelessWidget {
  final String title;
  final String subTitle;

  const AreaInfoText({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.white)),
          Text(subTitle),
        ],
      ),
    );
  }
}

// CODING
class CODING extends StatelessWidget {
  final double percentage;
  final String label;
  const CODING({super.key, required this.percentage, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(label, style: Theme.of(context).textTheme.bodyMedium),

        // SizedBox(height: defaultPadding / 2),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: percentage),
          duration: defaultDuration,
          builder: (context, double value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(label),
                    Text(
                      "${(value * 100).toInt()}%",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.white),
                    ),
                  ],
                ),

                // SizedBox(height: 5),
                LinearProgressIndicator(
                  value: value,
                  minHeight: 7,
                  color: primaryColor,
                  backgroundColor: darkColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
