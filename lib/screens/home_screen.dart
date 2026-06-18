// ignore_for_file: non_constant_identifier_names, unused_local_variable, use_key_in_widget_constructors, use_super_parameters

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sohrab_portfolio/components/home_banner.dart';
import 'package:sohrab_portfolio/components/model/demo_projects.dart';
import 'package:sohrab_portfolio/components/model/recommendation.dart';
import 'package:sohrab_portfolio/components/project_detail_page.dart';

import 'package:sohrab_portfolio/constants.dart';
import 'package:sohrab_portfolio/responsive.dart';
import 'package:sohrab_portfolio/screens/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return MainScreen(
      children: [
        const HomeBanner(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: defaultPadding,
            // horizontal: defaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    // Highlights(banner: banner)
                    Flexible(
                      child: Highlights(
                        banner: AnimationCounter(value: 5, text: "+"),
                        text: "Projects",
                      ),
                    ),
                    Flexible(
                      child: Highlights(
                        banner: AnimationCounter(value: 3, text: "+"),
                        text: "Completed",
                      ),
                    ),
                    Flexible(
                      child: Highlights(
                        banner: AnimationCounter(value: 2, text: "+"),
                        text: "Ongoing",
                      ),
                    ),
                    // Flexible(
                    //   child: Highlights(
                    //     banner: AnimationCounter(value: 1, text: "+"),
                    //     text: "Clients",
                    //   ),
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: defaultPadding),

              Text(
                "My Projects",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: defaultPadding),

              ///  PROJECT GRID
              DemoProjectsCard(demoProjects: demo_Projects),

              SizedBox(height: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommendations",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: defaultPadding),

                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: List.generate(
                  //       demo_recommendations.length,
                  //       (index) => Padding(
                  //         padding: const EdgeInsets.only(right: defaultPadding),
                  //         child: RecommendationCard(
                  //           recommendation: demo_recommendations[index],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  CarouselSlider.builder(
                    itemCount: demo_recommendations.length,
                    itemBuilder: (context, index, realIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: RecommendationCard(
                          recommendation: demo_recommendations[index],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      enableInfiniteScroll: true,
                      height: 200,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(
                        milliseconds: 800,
                      ),
                      autoPlayCurve: Curves.easeInOut,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: false,
                      viewportFraction: 0.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// DEMO PROJECTS CARD
class DemoProjectsCard extends StatelessWidget {
  const DemoProjectsCard({super.key, required this.demoProjects});

  final List<DemoProjects> demoProjects;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    /// RESPONSIVE GRID COLUMNS
    int crossAxisCount = 3;
    if (w < 650) {
      crossAxisCount = 1;
    } else if (w < 1100) {
      crossAxisCount = 2;
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demoProjects.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        // childAspectRatio: w < 650 ? 1.3 : 1.4,
        childAspectRatio: w < 600
            ? 1.1
            : w < 1100
            ? 1.25
            : 1.4,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(defaultPadding),
          color: secondaryColor,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// TITLE
              Text(
                demoProjects[index].title.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              ),

              const SizedBox(height: 8),

              /// DESCRIPTION
              Expanded(
                child: Text(
                  demoProjects[index].description.toString(),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: bodyTextColor, height: 1.5),
                ),
              ),

              /// BUTTON
              Align(
                alignment: Alignment.bottomLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProjectDetailPage(project: demoProjects[index]),
                      ),
                    );
                  },
                  child: const Text(
                    "Read more >>",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// HIGHLIGHTS
class Highlights extends StatelessWidget {
  final Widget banner;
  final String? text;

  const Highlights({super.key, required this.banner, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        banner,
        // const SizedBox(width: defaultPadding / 3),
        Flexible(
          child: Text(text ?? "", maxLines: 1, overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleMedium,),
        ),
      ],
    );
  }
}

/// ANIMATED COUNTER
class AnimationCounter extends StatelessWidget {
  final int value;
  final String? text;

  const AnimationCounter({super.key, required this.value, this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: value),
      duration: defaultDuration,
      builder: (context, value, child) {
        return Text(
          "$value${text ?? ''}",
          style: Theme.of(
            context,
          ).textTheme.titleLarge!.copyWith(color: primaryColor,),
        );
      },
    );
  }
}

// RECOMMENDATION CARD
class RecommendationCard extends StatelessWidget {
  const RecommendationCard({Key? key, required this.recommendation})
    : super(key: key);

  final Recommendation recommendation;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    double cardWidth;

    if (Responsive.isMobile(context)) {
      cardWidth = double.infinity;
    } else if (Responsive.isTablet(context)) {
      cardWidth = 320;
    } else {
      cardWidth = 400;
    }

    return Container(
      width: cardWidth,
      padding: EdgeInsets.all(w < 600 ? 12 : defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recommendation.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(fontSize: w < 600 ? 14 : 16),
          ),

          Text(
            recommendation.source ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: w < 600 ? 11 : 13, color: Colors.grey),
          ),

          SizedBox(height: w < 600 ? 8 : defaultPadding),

          Text(
            recommendation.text ?? "",
            maxLines: w < 600 ? 3 : 4,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(height: 1.5, fontSize: w < 600 ? 12 : 14),
          ),
        ],
      ),
    );
  }
}
