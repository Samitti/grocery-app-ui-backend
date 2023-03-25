import 'package:flutter/material.dart';
import 'package:grocery/constants/dimension.dart';
import 'package:grocery/constants/utils.dart';
import 'package:grocery/models/product_model.dart';
import 'package:grocery/provider/product_provider.dart';
import 'package:grocery/widgets/empty_widget.dart';
import 'package:grocery/widgets/feed_items_widget.dart';
import 'package:provider/provider.dart';

class BodyFeedScreen extends StatefulWidget {
  const BodyFeedScreen({super.key});

  @override
  State<BodyFeedScreen> createState() => _BodyFeedScreenState();
}

class _BodyFeedScreenState extends State<BodyFeedScreen> {
  final TextEditingController _searchBarController = TextEditingController();
  final FocusNode _searchFouceNode = FocusNode();
  List<ProductModel> listProdcutSearch = [];
  @override
  void dispose() {
    _searchBarController.dispose();
    _searchFouceNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    List<ProductModel> allProducts = productProvider.getProducts;
    final AppDimensions dimensions = AppDimensions(context);
    final Color color = Utils(context).color;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(dimensions.getScreenW(15)),
            child: SizedBox(
              height: kBottomNavigationBarHeight,
              child: TextField(
                focusNode: _searchFouceNode,
                controller: _searchBarController,
                onChanged: (value) {
                  setState(() {
                    listProdcutSearch = productProvider.searchQuery(value);
                  });
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(dimensions.getScreenW(12)),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 119, 131, 125), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(dimensions.getScreenW(12)),
                    borderSide:
                        const BorderSide(color: Colors.greenAccent, width: 2),
                  ),
                  hintText: 'Search Here',
                  prefixIcon: const Icon(Icons.search),
                  suffix: IconButton(
                    onPressed: () {
                      _searchBarController.clear();
                      _searchFouceNode.unfocus();
                    },
                    icon: Icon(
                      Icons.close,
                      color: _searchFouceNode.hasFocus ? Colors.red : color,
                    ),
                  ),
                ),
              ),
            ),
          ),
          _searchBarController.text.isNotEmpty && listProdcutSearch.isEmpty
              ? const EmptyWidget()
              : GridView.count(
                  padding: const EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                    _searchBarController.text.isNotEmpty
                        ? listProdcutSearch.length
                        : allProducts.length,
                    (index) {
                      return ChangeNotifierProvider.value(
                        value: _searchBarController.text.isNotEmpty
                            ? listProdcutSearch[index]
                            : allProducts[index],
                        child: const FeedsWidgets(),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
