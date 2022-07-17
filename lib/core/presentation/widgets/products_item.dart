import 'package:fisrtflutter/core/presentation/util/dimen.dart';
import 'package:fisrtflutter/data/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  Product product;
  Null Function(Product) onAddProductClick;
  ProductItem({
    required this.product,
    required this.onAddProductClick
  }){

  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.10),
      child: Container(
        padding: EdgeInsets.all(10),
          decoration:BoxDecoration(
            border: Border.all(color: Colors.blueAccent)
          ),
          child: Row(
            children: [
              Row(
                children: [
                  Text("name :"+product.name),
                  SizedBox(height: Dimen.SMALL_PADDING,),
                  Text("name :"+product.name),
                ],
              ),
              IconButton(
                  onPressed: (){
                    onAddProductClick(product);
                  },
                  icon: Icon(Icons.add)
              )
            ],
          ),
      ),
    );
  }
}
