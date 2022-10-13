import 'package:e_commerce_app/e_commerce_app/controller/model/products_model.dart';
import 'package:e_commerce_app/e_commerce_app/controller/provider/products_provider.dart';
import 'package:e_commerce_app/e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/e_commerce_app/view/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../constant/spacing/spacing.dart';
import '../../widgets/button/app_bar_icon_button.dart';
import '../../widgets/button/bottom_navigation_bar_botton.dart';

class Product extends StatelessWidget {
  int id;
  Product({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //     icon: InkWell(
      //       onTap: (){

      //       },
      //       child: Container(
      //         height: 6.h,
      //         width: 50.w,
      //         margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(5),
      //             color: Color.fromARGB(159, 205, 203, 203)),
      //         alignment: Alignment.center,
      //         child: const Text(
      //           'Add to Cart',
      //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      //         ),
      //       ),
      //     ),
      //     label: '',
      //   ),
      //   BottomNavigationBarItem(
      //     icon: InkWell(
      //       child: Container(
      //         height: 6.h,
      //         width: 50.w,
      //         margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 3.w),
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(5), color: deepOrange),
      //         alignment: Alignment.center,
      //         child: Text(
      //           'BUY NOW',
      //           style: TextStyle(
      //               fontSize: 16, color: white, fontWeight: FontWeight.w500),
      //         ),
      //       ),
      //     ),
      //     label: '',
      //   ),
      // ]),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppBarIconButton(
              icon: FontAwesomeIcons.magnifyingGlass,
              onTap: () {},
            ),
            AppBarIconButton(
              icon: FontAwesomeIcons.microphone,
              onTap: () {},
            ),
            AppBarIconButton(
              icon: FontAwesomeIcons.cartShopping,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
            ),
          ],
        ),
      ),
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Consumer<ProductsProvider>(
            builder: (context, productProvider, child) {
          ProductsModel currentProduct = productProvider.fetchProductById(id);
          return Stack(
            children: [
              ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 1.h,
                    ),
                    height: 45.h,
                    width: 100.w,
                    child: Image(
                      image: NetworkImage(currentProduct.image!),
                      fit: BoxFit.fill,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      currentProduct.title!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      currentProduct.description!,
                      style: TextStyle(color: grey, fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 10.h,
                    width: 100.w,
                    margin: EdgeInsets.all(1.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                      color: greenShade1,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Crazy Deal',
                          style: TextStyle(color: green, fontSize: 16),
                        ),
                        Row(
                          children: [
                            Text(
                              '₹' +
                                  (currentProduct.price! * 1.3)
                                      .toStringAsFixed(2),
                              style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            sizedBoxWS,
                            Text(
                              '₹' + currentProduct.price!.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            sizedBoxWS,
                            Text(
                              '30% off',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: green),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [BoxShadow(blurRadius: 3, color: black)]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomNavigationBarButton(
                        color: greyShade1,
                        textColor: black,
                        text: 'Add to Cart',
                        onTap: () {
                          productProvider.addFavorite(currentProduct);
                        },
                      ),
                      BottomNavigationBarButton(
                        color: deepOrange,
                        textColor: white,
                        text: 'BUY NOW',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
