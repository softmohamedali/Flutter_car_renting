import 'package:fisrtflutter/core/controllers/product_controller.dart';
import 'package:fisrtflutter/core/presentation/screen/product/product_view.dart';
import 'package:fisrtflutter/core/presentation/widgets/products_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

class ProductScreen extends GetWidget<ProductController> {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductView();
  }
}
