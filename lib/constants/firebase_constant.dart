import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

// collection constant
const String constUser = "users";
const String constProduct = "products";
const String constOrder = "orders";

// user constant
const String constUserId = "id";
const String constUserName = "name";
const String constUserEmail = "email";
const String constUserAddress = "shipping-address";
const String constUserCart = "userCart";
const String constUserWishlist = "userWish";

// product constant
const String constProductId = "id";
const String constProductTitle = "title";
const String constProductImage = "imageUrl";
const String constProductCategory = "productCategory";
const String constProductPrice = "price";
const String constProductPriceSale = "salePrice";
const String constProductIsOnSale = "isOnSale";
const String constProductIsPiece = "isPiece";

// cart constant

const String constCartId = "cartId";
const String constCartProductId = "productCartId";
const String constCartQuantity = "productCartQuantity";

// whislist constant
const String constWishtId = "wishId";
const String constProductWishId = "productWishId";


// order constant
const String constOrderId = "orderId";
const String constOrderUserId = "userid";
const String constOrderUserName = "username";
const String constOrderUserAddress = "user-shipping-address";
const String constOrderProductId = "productid";
const String constOrderProductImage = "productimageUrl";
const String constOrderQuantity = "productquantity";
const String constOrderProductPrice = "productprice";
const String constOrderDate = "createdAt";

