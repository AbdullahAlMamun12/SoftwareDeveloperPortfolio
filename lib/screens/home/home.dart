import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/components/side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 250),
      child: const SideMenu(),
    ),
      body: Container(),
    );
  }
}

