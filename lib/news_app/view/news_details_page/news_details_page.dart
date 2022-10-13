import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../model/news_model.dart';
import '../../utils/colors.dart';
import '../../utils/textStyle.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({Key? key, required this.newsModel}) : super(key: key);
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: white,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.03),
        height: height,
        width: width,
        child: SafeArea(
          child: ListView(
            children: [
              // SizedBox(
              //   height: 5.h,
              // ),
              Container(
                // height: 8.h,
                width: width,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Container(
                        height: height * 0.05,
                        width: height * 0.05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: black, width: 1)),
                        child: FaIcon(
                          FontAwesomeIcons.arrowLeft,
                          size: height * 0.02,
                          color: black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.8,
                      child: Text(
                        newsModel.title!,
                        style: headingStyle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                height: height * 0.3,
                width: width,
                child: Image(
                  image: NetworkImage(
                    newsModel.urlToImage!,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.04,
                width: width,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.7,
                      child: Text(
                        'Author : ${newsModel.author!}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launchUrl(Uri.parse(newsModel.url!),
                            mode: LaunchMode.externalApplication);
                      },
                      child: Container(
                        height: height * 0.03,
                        width: width * 0.23,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: lightGreen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Visit',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: darkGreen,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            FaIcon(
                              FontAwesomeIcons.squareArrowUpRight,
                              size: 15,
                              color: darkGreen,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width,
                child: Text(
                  'Content : ',
                  textAlign: TextAlign.left,
                  style: subheadingStyle,
                ),
              ),
              Text(
                newsModel.content!,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              SizedBox(
                width: width,
                child: Text(
                  'Description : ',
                  textAlign: TextAlign.left,
                  style: subheadingStyle,
                ),
              ),
              Text(
                newsModel.description!,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
