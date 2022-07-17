import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fisrtflutter/core/presentation/screen/home/home_screen.dart';
import 'package:fisrtflutter/data/models/product.dart';
import 'package:fisrtflutter/utils/mycolors.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var productList=[
    Product("1","safwflvfd"),
    Product("2","sefalvfd"),
    Product("3","slvfd"),
    Product("4","shtyhlvfd"),
    Product("5","slvfd"),
    Product("6","slvfd"),
  ];

  RxList cartList=[].obs;

  addcart(Product product){
    cartList.add(product);
  }

}