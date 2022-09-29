import 'package:firebase_project/features/home/home_view_model.dart';
import 'package:firebase_project/models/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel _model;
  String appBarTitle = 'Social App';

  @override
  void initState() {
    _model = HomeViewModel();
    _model.init();
    _model.setContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
        ),
      ),
      drawer: DrawerWidget(),
      body: const Center(child: Text('home view')),
    );
  }
}
