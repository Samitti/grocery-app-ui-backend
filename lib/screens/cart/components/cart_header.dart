import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/common_functions.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/firebase_constant.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/order_model.dart';
import 'package:grocery/models/user_model.dart';
import 'package:grocery/provider/cart_provider.dart';
import 'package:grocery/provider/order_provider.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/services/auth/auth_firestore.dart';
import 'package:grocery/services/products/products_firestore.dart';
import 'package:grocery/widgets/green_widget.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final orderProvider = Provider.of<OrderProvider>(context);
    final Color color = Utils(context).color;
    double totalPrice = 0.0;

    cartProvider.getcartItems.forEach(
      (key, value) {
        final currentProduct = productProvider.findById(value.productId);
        totalPrice += (currentProduct.productIsOnSale
                ? currentProduct.productSalePrice
                : currentProduct.productPrice) *
            value.quantity;
      },
    );

    void orderPlacing() async {
      final orderId = const Uuid().v4();
      cartProvider.getcartItems.forEach((key, value) async {
        final currentProduct = productProvider.findById(
          value.productId,
        );
        UserModel? user =
            await AuthFireStore.getUserData(firebaseAuth.currentUser!.uid);
        ProductFireStore.orderPlaced(
          orderId,
          OrderModel(
            orderId: orderId,
            userId: user!.id,
            userName: user.name,
            userAddress: user.address,
            productId: value.productId,
            productImageUrl: currentProduct.productImageUrl,
            totalPrice: totalPrice.toString(),
            productQuantity: value.quantity.toString(),
            orderDate: Timestamp.now(),
          ),
        );
      });
      await cartProvider.clearCart();
      await orderProvider.fetchOrders(userId: firebaseAuth.currentUser!.uid);
      CommonFunction.errorToast(
          error: 'You order has been placed successfully');
    }

    return SizedBox(
      width: double.infinity,
      height: dimensions.getScreenH(100),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: dimensions.getScreenW(10)),
        child: Row(
          children: [
            GreenButtonWidget(
              text: 'Order Now',
              press: () {
                orderPlacing();
              },
            ),
            const Spacer(),
            FittedBox(
              child: TextWidget(
                text: 'Total: \$${totalPrice.toStringAsFixed(2)}',
                color: color,
                textSize: dimensions.getScreenW(20),
                isTitle: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
