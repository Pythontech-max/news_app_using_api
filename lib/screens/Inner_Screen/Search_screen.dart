import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app_flutter_course/consts/vars.dart';
import 'package:news_app_flutter_course/services/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app_flutter_course/widgets/empty_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchTextController;
  late final FocusNode focusNode;
  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    if (mounted) {
      _searchTextController.dispose();
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      focusNode.unfocus();
                    },
                    child: const Icon(IconlyLight.arrowLeft2),
                  ),
                  Flexible(
                      child: TextField(
                          focusNode: focusNode,
                          controller: _searchTextController,
                          onEditingComplete: (() {}),
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color(0xff3D8361), width: 2.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color: Color(0xff3D8361), width: 2.0),
                              ),
                              hintText: "Search Recent",
                              suffix: Padding(
                                padding: EdgeInsets.symmetric(),
                                child: GestureDetector(
                                  onTap: (() {
                                    _searchTextController.clear();
                                    focusNode.unfocus();
                                    setState(() {});
                                  }),
                                  child: const Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ))
                              )
                              )
                              
                  
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: MasonryGridView.count(
              itemCount: searchKeyWords.length,
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return  GestureDetector(
                      onTap: () {},
                      child: Container(
                          margin: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff3D8361)),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text(searchKeyWords[index])),
                          )),
                    );
                
              },
            ),
            ),
             const EmptyNewsWidget(text: "OOPS!! No Result Found ", imagepath: "assets/images/search.png" )
           
         ],
        )),
      ),
    );
  }
}
