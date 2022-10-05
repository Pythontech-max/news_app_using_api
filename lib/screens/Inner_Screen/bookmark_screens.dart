import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/widgets/empty_screen.dart';

import '../../services/utils.dart';
import '../../widgets/article_widget.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen ({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
   
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    return Scaffold(appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          elevation: 1,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            "Bookmarks",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: color,
                    fontSize: 20,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.bold)),
          ),
          
        ) ,
        body: const EmptyNewsWidget(text: "No Bookmarks Added", imagepath:"assets/images/bookmark.png" )
               
               
              //  ListView.builder(itemCount: 20,itemBuilder: ((context, index)  {
              //   return const ArticleWidget();
              // })),
            
        
        
        
        
        );
  }
}
