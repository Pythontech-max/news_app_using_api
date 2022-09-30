import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          FancyShimmerImage(
            width: size.height*0.15,
            height: size.height*0.15,
            boxFit: BoxFit.fill,
            imageUrl: "https://ychef.files.bbci.co.uk/1600x900/p0d1y94f.webp",
          )
        ],
      ),
    );
  }
}
