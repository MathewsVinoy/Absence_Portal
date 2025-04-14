import 'package:app/ui/color.dart';
import 'package:flutter/material.dart';

Widget errormsg(String error) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, size: 60, color: red),
          const SizedBox(height: 16),
          Text(
            'Error: $error',
            style: TextStyle(
              fontSize: 16,
              color: red,
            ),
          ),
        ],
      ),
    );
