import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/order_model.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class TilesOrders extends StatelessWidget {
  const TilesOrders({super.key});

  @override
  Widget build(BuildContext context) {
    late String orderDateToShow;
    final orderModel = Provider.of<OrderModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final getCurrProduct = productProvider.findById(orderModel.productId);
    final Color color = Utils(context).color;
    final AppDimensions dimensions = AppDimensions(context);
    var orderDate = orderModel.orderDate.toDate();
    orderDateToShow = '${orderDate.day}/${orderDate.month}/${orderDate.year}';
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dimensions.getScreenW(10),
          vertical: dimensions.getScreenH(5)),
      child: ListTile(
        subtitle: Text(
            'Paid: \$${double.parse(orderModel.totalPrice).toStringAsFixed(2)}'),
        leading: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(dimensions.getScreenW(12))),
          child: FancyShimmerImage(
            imageUrl: getCurrProduct.productImageUrl,
            width: dimensions.getScreenH(70),
            height: dimensions.getScreenH(100),
            boxFit: BoxFit.fill,
          ),
        ),
        title: TextWidget(
          text:
              '${getCurrProduct.productTitle}  x${orderModel.productQuantity}',
          color: color,
          textSize: dimensions.getScreenW(20),
          isTitle: true,
        ),
        trailing: TextWidget(
            text: orderDateToShow,
            color: color,
            textSize: dimensions.getScreenW(18)),
      ),
    );
  }
}
