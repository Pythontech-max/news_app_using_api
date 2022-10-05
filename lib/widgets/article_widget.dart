import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_flutter_course/services/utils.dart';

import '../consts/vars.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Material(
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: const Color(0xff52734D),
            ),
            Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                    height: 60, width: 60, color: const Color(0xff52734D))),
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: FancyShimmerImage(
                      width: size.height * 0.15,
                      height: size.height * 0.15,
                      boxFit: BoxFit.fill,
                      imageUrl:
                          "https://ychef.files.bbci.co.uk/1600x900/p0d1y94f.webp",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "title " * 100,
                        textAlign: TextAlign.justify,
                        style: smallTextstyle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.timer,
                            color: Color(0xff3D8361),
                          ),
                          Text(
                            "Reading time ",
                            style: smallTextstyle,
                          ),
                        ],
                      ),
                      FittedBox(
                        child: Row(children: [IconButton(onPressed: (() {
                          
                        } ),icon: const Icon(Icons.link_rounded) , color:Color(0xff3D8361) ,), Text("02-10-2022" , style: smallTextstyle,)],),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
