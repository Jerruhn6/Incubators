import 'package:flutter/material.dart';
import 'package:portfolio/CONTROLLER/portfolio_controller.dart';
import 'package:portfolio/MODEL/project.dart';
import 'package:portfolio/VIEW/Layout.dart';



class PortfolioView extends StatelessWidget {
  const PortfolioView({super.key});

  @override
  Widget build(BuildContext context) {
    PortfolioController controller = PortfolioController();
    List<Project> projects = controller.getProjects();

    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Developer Portfolio")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return DesktopLayout(projects: projects);
          } else {
            return MobileLayout(projects: projects);
          }
        },
      ),
    );
  }
}