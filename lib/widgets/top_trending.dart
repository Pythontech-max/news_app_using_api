import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/services/utils.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FancyShimmerImage(
                    imageUrl:
                        "https://ychef.files.bbci.co.uk/1600x900/p0d3j8jk.webp",
                    boxFit: BoxFit.fill,
                    height: size.height * 0.33,
                    width: double.infinity,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Text",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Row(
                  children: [IconButton(onPressed: (() {
                    
                  }), icon:  Icon(Icons.link_outlined , color: color,)
                  ),
                  const Spacer(),

                  SelectableText("03-10-2022" ,style: GoogleFonts.montserrat(fontSize: 15),)

                        
                        ],
                )
              ],
            ),
        ),
      ),
    );
  }
}
