import 'package:fisrtflutter/core/controllers/product_controller.dart';
import 'package:fisrtflutter/core/presentation/screen/cart/cart_view.dart';
import 'package:fisrtflutter/core/presentation/screen/product/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CartScreen extends GetWidget<ProductController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CartView();
  }
}
