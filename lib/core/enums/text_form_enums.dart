import 'package:flutter/material.dart';

enum TextFormType {
  unLockpassword(Icons.lock_open_sharp, 'Enter your password'),
  lockPassword(Icons.lock, 'Enter your password'),
  email(Icons.mail, 'Enter your email'),
  user(Icons.person, 'Enter your name');

  final String text;
  final IconData icon;
  const TextFormType(this.icon, this.text);
}
