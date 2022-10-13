import 'package:e_commerce_app/e_commerce_app/controller/model/products_model.dart';
import 'package:e_commerce_app/e_commerce_app/controller/provider/products_provider.dart';
import 'package:e_commerce_app/e_commerce_app/utils/colors.dart';
import 'package:e_commerce_app/e_commerce_app/view/cart/cart.dart';
import 'package:e_commerce_app/e_commerce_app/view/display_products/product_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class DisplayProducts extends StatelessWidget {
  const DisplayProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Cart(),
            ),
          );
        },
        child: FaIcon(
          FontAwesomeIcons.cartShopping,
          size: 3.h,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Products',
          style: TextStyle(
            color: white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer<ProductsProvider>(
                builder: (context, productProvider, index) {
                  if (productProvider.isLoading == true) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (productProvider.products.isNotEmpty) {
                      return ListView.builder(
                          itemCount: productProvider.products.length,
                          itemBuilder: (context, index) {
                            ProductsModel currentModel =
                                productProvider.products[index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 0.5.h, horizontal: 2.w),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue.shade200)),
                              height: 8.h,
                              width: 100.w,
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: Product(id: currentModel.id!)),
                                  );
                                },
                                leading: SizedBox(
                                  height: 6.h,
                                  width: 6.h,
                                  child: Image(
                                    image: NetworkImage(
                                      currentModel.image!,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                title: Text(
                                  currentModel.title!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: Row(
                                  children: [
                                    const FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      currentModel.rating!.rate!.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800),
                                    )
                                  ],
                                ),
                                trailing: Text(
                                  '₹ ' + currentModel.price!.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text('empty List'),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
