import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ui_design/models/product.dart';
import 'package:ui_design/ui/screens/add_new_product.dart';
import 'package:ui_design/ui/widget/product_item.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
   const ProductListScreen({super.key});


  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
 List<Product> productlist = [];
 bool getProductListInProgress = false;
 //initState
 @override
  void initState() {

    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
      ),
      body: Visibility(
        visible: getProductListInProgress==false,
        replacement:Center(
          child: CircularProgressIndicator(
            color: Colors.red,
            backgroundColor: Colors.green,
            strokeWidth: 4,


          ),


        ) ,
        child: ListView.builder(
          itemCount: productlist.length,
          itemBuilder: (context, index) {
            return ProductItem(productItem: productlist[index]);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewProduct.name);
        },
        child: Icon(Icons.add),
      ),
    );
  }
   Future<void> _getProductList() async {
   getProductListInProgress = true;
   setState(() {

   });
    Uri url = Uri.parse('https://crud.teamrabbil.com/api/v1/ReadProduct');

    Response response=  await get(url) ;
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
     final decodeData = jsonDecode(response.body);
     for (Map<String, dynamic> product in decodeData['data']) {
       Product productItem = Product(
         id: product['_id'],
         ProductName: product['ProductName'],
         ProductCode: product['ProductCode'],
         UnitPrice: product['UnitPrice'],
         Qty: product['Qty'],
         TotalPrice: product['TotalPrice'],
         Img: product['Img'],
         CreatedDate: product['CreatedDate'],

       );
       productlist.add(productItem);


   }
     setState(() {

     });
     }
    getProductListInProgress = false;
    setState(() {

    });

    }










 }

