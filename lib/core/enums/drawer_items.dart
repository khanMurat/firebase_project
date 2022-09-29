import 'package:flutter/material.dart';

enum DrawerItemEnum {
  home((Icons.home), 'Home'),
  sharePost((Icons.share), 'Share Post'),

  logOut((Icons.logout), 'Log out');

  final String text;
  final IconData icon;

  const DrawerItemEnum(this.icon, this.text);
}
