import 'package:flutter/material.dart';
import 'package:ui_design/ui/screens/add_new_product.dart';
import 'package:ui_design/ui/screens/product_list_screen.dart';

import 'package:ui_design/ui/screens/update_productlist.dart';

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ProductListScreen(),
        AddNewProduct.name: (context) => const AddNewProduct(),
        UpdateProductScreen.name: (context) => const UpdateProductScreen(),
      },
    );
  }
}
