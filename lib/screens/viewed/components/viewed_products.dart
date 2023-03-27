import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/viewed_model.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/screens/details/details_screen.dart';
import 'package:grocery/services/products/products_firestore.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ViewedProduct extends StatefulWidget {
  const ViewedProduct({super.key});

  @override
  State<ViewedProduct> createState() => _ViewedProductState();
}

class _ViewedProductState extends State<ViewedProduct> {
  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;

    final viewedModel = Provider.of<ViewedModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final currentProduct = productProvider.findById(viewedModel.productId);
    final double price = currentProduct.productIsOnSale
        ? currentProduct.productSalePrice
        : currentProduct.productPrice;
    bool isInCart =
        cartProvider.getcartItems.containsKey(currentProduct.productid);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dimensions.getScreenW(10),
          vertical: dimensions.getScreenH(5)),
      child: Container(
        height: dimensions.getScreenH(100),
        width: dimensions.getScreenH(100),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(dimensions.getScreenH(20))),
        child: Center(
          child: ListTile(
            subtitle: TextWidget(
                text: '\$${price.toStringAsFixed(2)}',
                color: color,
                textSize: dimensions.getScreenH(18)),
            onTap: () {
              Navigator.pushNamed(
                context,
                DetailsScreen.routeName,
                arguments: viewedModel.productId,
              );
            },
            leading: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(dimensions.getScreenW(12))),
              child: FancyShimmerImage(
                imageUrl: currentProduct.productImageUrl,
                width: dimensions.getScreenH(70),
                height: dimensions.getScreenH(100),
                boxFit: BoxFit.fill,
              ),
            ),
            title: TextWidget(
              text: currentProduct.productTitle,
              color: color,
              textSize: dimensions.getScreenW(20),
              isTitle: true,
            ),
            trailing: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(dimensions.getScreenW(8)),
                  color: Colors.green),
              child: InkWell(
                borderRadius: BorderRadius.circular(dimensions.getScreenW(8)),
                onTap: isInCart
                    ? null
                    : () async {
                        if (firebaseAuth.currentUser == null) {
                          CommonFunction.errorToast(
                            error: 'Please Login First',
                          );
                          return;
                        }
                        await ProductFireStore.addProductToUserCart(
                          productId: currentProduct.productid,
                          quantity: 1,
                        );
                        await cartProvider.fetchCart();
                      },
                child: Padding(
                    padding: EdgeInsets.all(dimensions.getScreenW(8)),
                    child: Icon(
                      isInCart ? Icons.check : IconlyBold.plus,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
