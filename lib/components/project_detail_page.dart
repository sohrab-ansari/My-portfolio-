import 'package:flutter/material.dart';

import 'package:sohrab_portfolio/components/model/demo_projects.dart';
import 'package:sohrab_portfolio/constants.dart';

class ProjectDetailPage extends StatelessWidget {
  final DemoProjects project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(project.title ?? ""),
        backgroundColor: bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title ?? "",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: primaryColor
              ),
              
            ),

            // const SizedBox(height: 20),

            Text(
              project.description ?? "",
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),
            Text("Features",style:  Theme.of(context).textTheme.titleLarge!.copyWith(color: primaryColor)),

            ...?project.features?.map(
      (feature) => Text(
        "• $feature",
        style: const TextStyle(fontSize: 16, height: 1.5),
      ),
    ),
          ],
        ),
      ),
    );
  }
}