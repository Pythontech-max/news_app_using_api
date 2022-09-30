import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_course/consts/vars.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:news_app_flutter_course/widgets/article_widget.dart';
import 'package:news_app_flutter_course/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/tabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  int CurrentpageIndex = 0;
  String Sortby = SortByEmum.publishedAt.name;

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: color),
          elevation: 1,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title: Text(
            'News App',
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                    color: color,
                    fontSize: 20,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.bold)),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(IconlyLight.search))
          ],
        ),
        drawer: const DrawerWidget(),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                TabsWidget(
                  text: 'All news',
                  color: newsType == NewsType.allNews
                      ? Theme.of(context).cardColor
                      : Colors.transparent,
                  function: () {
                    if (newsType == NewsType.allNews) {
                      return;
                    }
                    setState(() {
                      newsType = NewsType.allNews;
                    });
                  },
                  fontSize: newsType == NewsType.allNews ? 22 : 14,
                ),
                const SizedBox(
                  width: 25,
                ),
                TabsWidget(
                  text: 'Top Trending',
                  color: newsType == NewsType.topTrending
                      ? Theme.of(context).cardColor
                      : Colors.transparent,
                  function: () {
                    if (newsType == NewsType.topTrending) {
                      return;
                    }
                    setState(() {
                      newsType = NewsType.topTrending;
                    });
                  },
                  fontSize: newsType == NewsType.topTrending ? 22 : 14,
                ),
              ],
            ),
          ),
          newsType == NewsType.topTrending
              ? Container()
              : SizedBox(
                  height: kBottomNavigationBarHeight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        paginationbottons(
                            function: () {
                              if (CurrentpageIndex == 0) {
                                return;
                              }
                              setState(() {
                                CurrentpageIndex -= 1;
                              });
                            },
                            text: "Prev"),
                        Flexible(
                            flex: 3,
                            child: Container(
                                child: ListView.builder(
                                    itemCount: 15,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Material(
                                          color: CurrentpageIndex == index
                                              ? const Color(0xff3D8361)
                                              : Theme.of(context).cardColor,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                CurrentpageIndex = index;
                                              });
                                            },
                                            child: Center(
                                                child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "${index + 1}",
                                                style: TextStyle(
                                                    color: CurrentpageIndex ==
                                                            index
                                                        ? Colors.white
                                                        : Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 19),
                                              ),
                                            )),
                                          ),
                                        ),
                                      );
                                    })))),
                        paginationbottons(
                            function: () {
                              if (CurrentpageIndex == 15) {
                                return;
                              }
                              setState(() {
                                CurrentpageIndex += 1;

                                print("${CurrentpageIndex} : index");
                              });
                            },
                            text: "Next")
                      ],
                    ),
                  ),
                ),
          SizedBox(
            height: 5,
          ),
           newsType == NewsType.topTrending ? Container(): Align(
              alignment: Alignment.topRight,
              child: Material(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff3D8361).withOpacity(0.2),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: DropdownButton(

                      elevation: 2,
                       borderRadius: BorderRadius.circular(25),
                        value: Sortby,
                        items: dropDownItems,
                        onChanged: (String? value) {})),
              )),
          Expanded(child: ListView.builder(itemCount:  20 ,itemBuilder: (ctx , index){
            return ArticleWidget();
          }))
        ]),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropDownItems {
  List<DropdownMenuItem<String>> menuItem = [
    DropdownMenuItem(
        child: Text(SortByEmum.relevency.name),
        value: SortByEmum.relevency.name),
    DropdownMenuItem(
        child: Text(SortByEmum.popularity.name),
        value: SortByEmum.popularity.name),
    DropdownMenuItem(
        child: Text(SortByEmum.publishedAt.name),
        value: SortByEmum.publishedAt.name),
  ];
  return menuItem;
}

Widget paginationbottons({required Function function, required String text}) {
  return ElevatedButton(
    onPressed: () {
      function();
    },
    child: Text(text),
    style: ElevatedButton.styleFrom(
        primary: Color(0xff3D8361),
        padding: EdgeInsets.all(8.0),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        )),
  );
}
