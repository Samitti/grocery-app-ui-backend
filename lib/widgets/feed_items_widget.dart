import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/screens/home/components/price.dart';
import 'package:grocery/widgets/heart_widget.dart';
import 'package:grocery/widgets/text_widget.dart';

class FeedsWidgets extends StatefulWidget {
  const FeedsWidgets({super.key});

  @override
  State<FeedsWidgets> createState() => _FeedsWidgetsState();
}

class _FeedsWidgetsState extends State<FeedsWidgets> {
  final _quantityController = TextEditingController();

  @override
  void initState() {
    _quantityController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dimensions.getScreenH(15),
          vertical: dimensions.getScreenH(5)),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(dimensions.getScreenW(20)),
          ),
          child: Column(
            children: [
              FancyShimmerImage(
                imageUrl: 'https://i.ibb.co/F0s3FHQ/Apricots.png',
                height: dimensions.getScreenH(75),
                width: dimensions.getScreenH(75),
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: dimensions.getScreenW(10),
                  vertical: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Title',
                      color: color,
                      textSize: dimensions.getScreenW(20),
                      isTitle: true,
                    ),
                    HeartWidget(color: color, size: dimensions.getScreenW(22)),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: dimensions.getScreenW(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceWidget(
                      isOnSale: false,
                      salePrice: 2.99,
                      price: 5.0,
                      textPrice: _quantityController.text,
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          SizedBox(
                            width: dimensions.getScreenW(8),
                          ),
                          TextWidget(
                            text: 'KG',
                            color: color,
                            textSize: dimensions.getScreenW(18),
                            isTitle: true,
                          ),
                          SizedBox(
                            width: dimensions.getScreenW(25),
                          ),
                          Flexible(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: _quantityController,
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide()),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]'))
                              ],
                              onChanged: (value) {
                                setState(() {
                                  if (value.isEmpty) {
                                    _quantityController.text = "1";
                                  } else {}
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: TextWidget(
                    color: Colors.black,
                    text: 'Add to Cart',
                    textSize: dimensions.getScreenW(18),
                    maxLines: 1,
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
