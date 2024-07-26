import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<UserProfile> getUserOptions() {
  return [
    UserProfile(
      "Settings",
      const Icon(
        CupertinoIcons.settings_solid,
        size: 30,
      ),
    ),
    UserProfile(
      "Payment",
      const Icon(
        Icons.payment,
        size: 35,
      ),
    ),
    UserProfile(
      "Notifications",
      const Icon(
        CupertinoIcons.bell,
        size: 35,
      ),
    ),
    UserProfile(
      "Support",
      const Icon(
        CupertinoIcons.info,
        size: 35,
      ),
    ),
    UserProfile(
      "Sign out",
      const Icon(
        CupertinoIcons.circle_filled,
        size: 35,
        color: Colors.red,
      ),
    ),
  ];
}

class UserProfile {
  String title;
  Icon icon;

  UserProfile(this.title, this.icon);
}
