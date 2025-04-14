import 'package:app/ui/color.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppbar(String title) => AppBar(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: primaryColor,
      foregroundColor: white,
      elevation: 2,
    );
