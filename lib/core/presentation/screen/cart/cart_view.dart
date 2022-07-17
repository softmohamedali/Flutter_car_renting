import 'package:fisrtflutter/core/controllers/product_controller.dart';
import 'package:fisrtflutter/core/presentation/widgets/products_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products=Get.find<ProductController>();
    print(products.productList);
    print("products.productList");
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text("Products"),
          Container(
            child:ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: products.cartList[index],
                  onAddProductClick: (product){
                    products.addcart(product);
                  },
                );
              },
              itemCount: products.cartList.length,
              scrollDirection: Axis.vertical,
            ),
          ),
        ],
      ),
    );
  }
}
