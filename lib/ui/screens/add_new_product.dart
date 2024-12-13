import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});
  static  const String name  = "/add-new-product";

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final TextEditingController _nameTExtController = TextEditingController();
  final TextEditingController _priceTExtController = TextEditingController();
  final TextEditingController _totalPriceTExtController = TextEditingController();
  final TextEditingController _quantityTExtController = TextEditingController();
  final TextEditingController _imageTExtController = TextEditingController();
  final TextEditingController _codeTExtController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 bool addNewProductInProgress = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("Add New Product"),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _buildProductForm(),



      ),











    );
  }

  Widget _buildProductForm() {
    return Form(
        child: Column(
          children: [
        TextFormField(
          controller: _nameTExtController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(

            border: OutlineInputBorder(),
            hintText: 'name',
            labelText: 'Product Name',
          ),
            validator: ( String ? value) {

              if(value == null || value.isEmpty?? true){
        return "Enter Product name";

              }
            }

        ),
        SizedBox(height: 16,),
        TextFormField(
          controller: _codeTExtController,
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(

            border: OutlineInputBorder(),
            labelText: 'Product Code',
            hintText: 'Product Code',

          ),
            validator: ( String ? value) {

              if(value == null || value.isEmpty?? true){
                return "Enter Product code";
              }
            }

        ),
            SizedBox(height: 16,),
        TextFormField(
          controller: _priceTExtController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(

            border: OutlineInputBorder(),
            labelText: 'Product Price',
            hintText: 'Price',
          ),
          validator: ( String ? value) {

            if(value == null || value.isEmpty?? true){
              return "Enter Product name";

            }
          }

        ),
        SizedBox(height: 16,),
        TextFormField(
          controller: _quantityTExtController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Product Quantity',
            hintText: 'Quantity',
          ),
            validator: ( String ? value) {

              if(value == null || value.isEmpty?? true){
        return "Enter Product name";

              }
            }

        ),
        SizedBox(height: 16,),
        TextFormField(
          controller: _totalPriceTExtController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Total Price',
            hintText: 'Total Price',
          ),
            validator: ( String ? value) {

              if(value == null || value.isEmpty?? true){
        return "Enter Product name";

              }
            }

        ),
        SizedBox(height: 16,),
            TextFormField(
                controller: _imageTExtController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Image',
                  hintText: 'Image',
                ),
                validator: ( String ? value) {

                  if(value == null || value.isEmpty?? true){
                    return "Enter Product name";

                  }
                }

            ),
        // ElevatedButton(onPressed: (){}, child: Text("Add New Product"),),
        // SizedBox(height: 16,),
        // ElevatedButton(onPressed: (){}, child: Text("Cancel"),),
        // SizedBox(height: 16,),
        Visibility(
          visible:addNewProductInProgress == false,
          replacement: Center(

            child: CircularProgressIndicator(),
          ),
          child: ElevatedButton(onPressed: (){
            if(_formKey.currentState!.validate()){

              _addNewProduct();


            }




          }, child: Text("Add New Product")),
                  // style: ElevatedButton.styleFrom(
                  //
                  // backgroundColor: Colors.green
                  // )
                  // ),
        ),




          ],



        ),
      );
  }
  Future<void> _addNewProduct() async {
bool addNewProductInProgress = true;
setState(() {

});

Uri url = Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct');
Map<String, dynamic> requestBody = {
  "Img": _imageTExtController.text.trim(),
  "ProductCode": _codeTExtController.text.trim(),
  "ProductName": _nameTExtController.text.trim(),
  "Qty": _quantityTExtController.text.trim(),
  "TotalPrice": _totalPriceTExtController.text.trim(),
  "UnitPrice": _priceTExtController.text.trim(),


};
Response response = await post(url,
    headers: {
  'Content-Type': 'application/json',




    },



    body: jsonEncode(requestBody));
print(response.body);
print(response.statusCode);
addNewProductInProgress = false;
setState(() { });

if (response.statusCode == 200) {
  _clerTextFields();
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Product added successfully'),
    ),
  );
} else {      ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Failed to add product'),
)
  ) ;

}




}
void _clerTextFields(){
  _nameTExtController.clear();
  _priceTExtController.clear();
  _totalPriceTExtController.clear();
  _quantityTExtController.clear();
  _imageTExtController.clear();
  _codeTExtController.clear();

}
  void dispose(){
    _nameTExtController.dispose();
    _priceTExtController.dispose();
    _totalPriceTExtController.dispose();
    _quantityTExtController.dispose();
    _imageTExtController.dispose();
    _codeTExtController.dispose();
    super.dispose();





  }

}
