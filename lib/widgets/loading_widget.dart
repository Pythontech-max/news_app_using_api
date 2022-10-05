import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:news_app_flutter_course/services/utils.dart';

import '../consts/vars.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({
    Key? key,
    required this.newsType,
  }) : super(key: key);

  final NewsType newsType;

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  BorderRadius borderRadius = BorderRadius.circular(18);
  late Color baseShimmerColour, highlightShimmerColour, widgetShimmerColour;

  @override
  void didChangeDependencies() {
    var utils = Utils(context);
    baseShimmerColour = utils.baseShimmerColour!;
    highlightShimmerColour = utils.highlightShimmerColour!;
    widgetShimmerColour = utils.widgetShimmerColour!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return widget.newsType == NewsType.topTrending ?  Swiper(
      itemWidth: size.width * 0.9,
      layout: SwiperLayout.STACK,
      viewportFraction: 0.9,
      autoplay: true,
      autoplayDelay: 2000,
      itemCount: 5,
      itemBuilder: (context, index) {
        return TopTrendingLoadingWidget(
            baseShimmerColour: baseShimmerColour,
            highlightShimmerColour: highlightShimmerColour,
            size: size,
            widgetShimmerColour: widgetShimmerColour,
            borderRadius: borderRadius);
      },
    ):
    Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (ctx, index) {
              return Articles_Shimmer_Effect_Widget(
        baseShimmerColour: baseShimmerColour,
        highlightShimmerColour: highlightShimmerColour,
        widgetShimmerColour: widgetShimmerColour,
        size: size,
        borderRadius: borderRadius);
              //ArticleWidget();
           
    }));
  }
}

class TopTrendingLoadingWidget extends StatelessWidget {
  const TopTrendingLoadingWidget({
    Key? key,
    required this.baseShimmerColour,
    required this.highlightShimmerColour,
    required this.size,
    required this.widgetShimmerColour,
    required this.borderRadius,
  }) : super(key: key);

  final Color baseShimmerColour;
  final Color highlightShimmerColour;
  final Size size;
  final Color widgetShimmerColour;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12)),
        child: Shimmer.fromColors(
          baseColor: baseShimmerColour,
          highlightColor: highlightShimmerColour,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: size.height * 0.33,
                  width: double.infinity,
                  color: widgetShimmerColour,
                ),
              ),
              // Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      color: widgetShimmerColour, borderRadius: borderRadius),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      height: size.height * 0.025,
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: widgetShimmerColour),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Articles_Shimmer_Effect_Widget extends StatelessWidget {
  const Articles_Shimmer_Effect_Widget({
    Key? key,
    required this.baseShimmerColour,
    required this.highlightShimmerColour,
    required this.widgetShimmerColour,
    required this.size,
    required this.borderRadius,
  }) : super(key: key);

  final Color baseShimmerColour;
  final Color highlightShimmerColour;
  final Color widgetShimmerColour;
  final Size size;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
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
              child: Shimmer.fromColors(
                baseColor: baseShimmerColour,
                highlightColor: highlightShimmerColour,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        color: widgetShimmerColour,
                        width: size.height * 0.15,
                        height: size.height * 0.15,
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
                        Container(
                          height: size.height * 0.08,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: widgetShimmerColour,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: size.height * 0.03,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: borderRadius,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        FittedBox(
                          child: Row(
                            children: [
                              ClipOval(
                                  child: Container(
                                height: 25,
                                width: 25,
                                color: Colors.red,
                              )),
                              const SizedBox(width: 5),
                              Container(
                                height: size.height * 0.03,
                                width: size.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: borderRadius,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
