import 'package:flutter/material.dart';

class Category {
  const Category({@required this.name, @required this.pngURL ,@required this.color});

  final Color color;
  final String name;
  final String pngURL;
}
