import 'dart:io';

import 'package:firebase_project/features/share/share_post_view_model.dart';
import 'package:firebase_project/models/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShareView extends StatefulWidget {
  const ShareView({Key? key}) : super(key: key);

  @override
  State<ShareView> createState() => _ShareViewState();
}

class _ShareViewState extends State<ShareView> {
  late SharePostViewModel _model;

  @override
  void initState() {
    _model = SharePostViewModel.instance;
    _model.context;
    _model.init();
    super.initState();
  }

  String appBarTitle = 'Social App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      drawer: DrawerWidget(),
      body: Consumer<SharePostViewModel>(
          builder: (BuildContext context, value, Widget? child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (_model.imagePath != null)
                  ? Center(
                      child: Image.file(
                        File(
                          _model.imagePath!,
                        ),
                        height: 300,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                    )
                  : const Text('NO IMAGE'),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  value.pickImageGallery();
                },
                child: const Text('Select Image'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
