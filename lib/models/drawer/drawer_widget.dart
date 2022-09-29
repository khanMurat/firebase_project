import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/core/constants/colors_constant.dart';
import 'package:firebase_project/core/enums/drawer_items.dart';
import 'package:firebase_project/core/extension/build_context_extension.dart';
import 'package:firebase_project/core/init/cache/cache_manager.dart';
import 'package:firebase_project/core/init/navigation/navigation_constants.dart';
import 'package:firebase_project/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key? key, this.drawerElevation = 0}) : super(key: key);

  final double? drawerElevation;
  final NavigationService _service = NavigationService.instance;
  final CacheManager _manager = CacheManager.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorKit.greyBackGroundColor,
      elevation: drawerElevation,
      width: context.perWidth(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(DrawerItemEnum.home.icon),
            title: Text(DrawerItemEnum.home.text),
            onTap: () => _service.navigateToPageClear(NavigationConstant.home),
          ),
          ListTile(
            leading: Icon(DrawerItemEnum.sharePost.icon),
            title: Text(DrawerItemEnum.sharePost.text),
            onTap: () => _service.navigateToPageClear(NavigationConstant.share),
          ),
          ListTile(
              leading: Icon(DrawerItemEnum.logOut.icon),
              title: Text(DrawerItemEnum.logOut.text),
              onTap: () async {
                await _auth.signOut();

                _service.navigateToPageClear(NavigationConstant.login);
              }),
        ],
      ),
    );
  }
}
