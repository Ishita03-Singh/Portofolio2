import 'package:flutter/material.dart';
import 'package:ishita_singh/screens/about_screen.dart';
import 'package:ishita_singh/screens/experience_screen.dart';

class TechInfoScreen extends StatefulWidget {
  const TechInfoScreen({super.key});

  @override
  State<TechInfoScreen> createState() => _TechInfoScreenState();
}

class _TechInfoScreenState extends State<TechInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
       decoration: const BoxDecoration(
                        // color: Colors.amber,
                        border: Border(top: BorderSide(color: Colors.black)),
                      ),
      child:  Row(children: [
        AboutScreen(),
        // ExperienceScreen()
      ],)
    );
  }
}