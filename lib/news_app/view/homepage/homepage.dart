import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/provider/news_provider.dart';
import '../../model/news_model.dart';
import '../../utils/colors.dart';
import '../../utils/textStyle.dart';
import '../news_details_page/news_details_page.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: greyShade200,
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height * 0.06,
                width: width,
                alignment: Alignment.bottomCenter,
                child: Text(
                  'News Today',
                  style: headingStyle,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                child: Consumer<NewsProvider>(
                  builder: (context, newsProvider, child) {
                    if (newsProvider.isLoading == true) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: white,
                            highlightColor: lightGreen,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: height * 0.01,
                                horizontal: width * 0.03,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: white,
                              ),
                              height: height * 0.3,
                              width: width,
                            ),
                          );
                        },
                      );
                    } else {
                      if (newsProvider.products.isNotEmpty) {
                        return ListView.builder(
                            itemCount: newsProvider.products.length,
                            itemBuilder: (context, index) {
                              NewsModel currentNewsModel =
                                  newsProvider.products[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: NewsDetailsPage(
                                        newsModel: currentNewsModel,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.02,
                                      vertical: height * 0.005),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: width * 0.03,
                                      vertical: height * 0.007),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: white,
                                  ),
                                  height: height * 0.3,
                                  width: width,
                                  child: Column(children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      height: height * 0.2,
                                      width: width,
                                      child: Image(
                                        image: NetworkImage(
                                            currentNewsModel.urlToImage!),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: height * 0.08,
                                      width: width,
                                      child: Text(
                                        currentNewsModel.title!,
                                        maxLines: 2,
                                        textAlign: TextAlign.left,
                                        style: bannerTitleStyle,
                                      ),
                                    )
                                  ]),
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text('No News Found'),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
