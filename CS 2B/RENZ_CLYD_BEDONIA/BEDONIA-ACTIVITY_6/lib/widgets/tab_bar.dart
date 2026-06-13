import 'package:flutter/material.dart';
import 'package:simpe_flutter_application/pages/pet.dart';
import 'package:simpe_flutter_application/pages/profile.dart';

class MainTabBar extends StatelessWidget {
  const MainTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text("Renz Clyd D. Bedonia")),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'My Profile', icon: Icon(Icons.person)),
              Tab(text: 'My Pet', icon: Icon(Icons.pets)),
            ],
          ),
        ),
        body: const TabBarView(children: [Profile(), Pet()]),
      ),
    );
  }
}
