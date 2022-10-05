import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils(this.context);
  Size get getScreenSize => MediaQuery.of(context).size;

  bool get getTheme => Provider.of<ThemeProvider>(context).getDarkTheme;
  Color get getColor => getTheme ? Colors.white : Colors.black;

  Color ? get baseShimmerColour => 
                  getTheme ? Colors.grey[500] : Colors.grey[200];
  
  Color ? get highlightShimmerColour => 
                  getTheme ? Colors.grey[700] : Colors.grey[400];
  
  Color ? get widgetShimmerColour => 
                  getTheme ? Colors.grey[600] : Colors.grey[100];



}
