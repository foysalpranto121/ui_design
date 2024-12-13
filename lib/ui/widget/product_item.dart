// WIDGET EXTRACTION

import 'package:flutter/material.dart';
import 'package:ui_design/models/product.dart';
import 'package:ui_design/ui/screens/update_productlist.dart';

class ProductItem extends StatelessWidget {
   ProductItem({super.key, required this.productItem});
 final Product productItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        //leading:
       // Image.network(productItem.Img ?? ''),

        title: Text(productItem.ProductName ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( 'Product Code:${productItem.ProductCode ?? ''}'),
            Text('Product Quantity:${productItem.Qty ?? ''}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Expanded(child: Text('ProductUnit Price:${productItem.UnitPrice ?? ''}')),
                Expanded(child: Text('Price Total :${productItem.TotalPrice ?? ''}')),
              ],
            ),
          ],
        ),
        trailing: Wrap(
          children: [
            IconButton(onPressed: () {
              Navigator.pushNamed(context, UpdateProductScreen.name);




            }, icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ],
        ));
  }
}



