class ProductModel {
  final String productid, productTitle, productImageUrl, productCategory;
  final double productPrice, productSalePrice;
  final bool productIsOnSale, productIsPiece;

  ProductModel({
    required this.productid,
    required this.productTitle,
    required this.productImageUrl,
    required this.productCategory,
    required this.productPrice,
    required this.productSalePrice,
    required this.productIsOnSale,
    required this.productIsPiece,
  });
}
