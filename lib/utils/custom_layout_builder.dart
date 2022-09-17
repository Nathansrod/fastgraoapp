/*
* This class implements useful layout building tools used
* throughout the project.
* */

import 'package:flutter/material.dart';

class CustomLayoutBuilder{
  static InputDecoration textFormFieldDecoration(IconData iconData, String fieldName, BuildContext context){
    return InputDecoration(
      prefixIcon: Icon(iconData, size: 30.0),
      labelText: fieldName,
      labelStyle: TextStyle(
          fontSize: 20.0,
          color: Theme.of(context).colorScheme.secondary,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.5,
              color: Theme.of(context).colorScheme.secondary
          ),
          borderRadius: BorderRadius.circular(10.0)
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.5,
              color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(10.0)
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    );
  }
}