import 'package:e_commerce_app/e_commerce_app/controller/model/products_model.dart';
import 'package:e_commerce_app/e_commerce_app/controller/provider/products_provider.dart';
import 'package:e_commerce_app/e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/e_commerce_app/utils/textStyle.dart';
import 'package:e_commerce_app/e_commerce_app/view/display_products/product_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../constant/spacing/spacing.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            'My Cart',
            style: TextStyle(fontSize: 16, color: white),
          )),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    height: 6.h,
                    width: 100.w,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        const Text('Deliver to: '),
                        const Text(
                          'Delhi - 342716',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          alignment: Alignment.center,
                          height: 5.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: greyShade1, width: 1)),
                          child: Text(
                            'Change',
                            style: TextStyle(fontSize: 16, color: blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1.h,
                    width: 100.w,
                    color: greyShade1,
                  ),
                  Expanded(
                    child: Consumer<ProductsProvider>(
                        builder: (context, productProvider, child) {
                      List<ProductsModel> favorites = productProvider.products
                          .where((element) => element.isFavorite == true)
                          .toList();

                      if (favorites.isNotEmpty) {
                        return ListView.builder(
                            itemCount: favorites.length,
                            itemBuilder: (context, index) {
                              ProductsModel currentModel = favorites[index];
                              return Container(
                                height: 28.h,
                                width: 100.w,
                                margin: EdgeInsets.symmetric(vertical: 1.h),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                          width: 50.w,
                                          child: Image(
                                            image: NetworkImage(
                                                currentModel.image!),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                          width: 50.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 10.h,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      currentModel.title!,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '₹' +
                                                              (currentModel
                                                                          .price! *
                                                                      1.3)
                                                                  .toStringAsFixed(
                                                                      2),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              color: grey,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        sizedBoxWS,
                                                        Text(
                                                          '₹' +
                                                              currentModel
                                                                  .price!
                                                                  .toString(),
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        sizedBoxWS,
                                                      ],
                                                    ),
                                                    Text(
                                                      '1 offer applied',
                                                      style: offerCart,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 5.h,
                                                width: 30.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: black, width: 1),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    const Text(
                                                      'Qty : 1',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    FaIcon(
                                                      FontAwesomeIcons
                                                          .caretDown,
                                                      size: 2.5.h,
                                                      color: black,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    sizedBoxHVS,
                                    InkWell(
                                      onTap: () {
                                        productProvider
                                            .removeFavorite(currentModel);
                                      },
                                      child: Container(
                                        height: 6.h,
                                        width: 100.w,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: greyShade1, width: 1)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Remove Item',
                                              style: TextStyle(color: grey),
                                            ),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.trash,
                                              color: grey,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    sizedBoxHVS,
                                    Container(
                                      height: 1.h,
                                      width: 100.w,
                                      color: greyShade1,
                                    )
                                  ],
                                ),
                              );
                            });
                      } else {
                        return const Center(
                          child: Text('Opps! No Items in Favorites'),
                        );
                      }
                    }),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  // color: deepOrange,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(color: black, blurRadius: 3)],
                      color: white),
                  child: Container(
                    height: 6.h,
                    width: 60.w,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: deepOrange),
                    alignment: Alignment.center,
                    child: Text(
                      'Proceed to CheckOut',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
