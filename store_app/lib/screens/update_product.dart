import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({this.productname, this.description, this.price, this.image});
  static String id = 'UpdateProduct';
  String? productname, price, image, description;
  

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModal product =
        ModalRoute.of(context)!.settings.arguments as ProductModal;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Spacer(
                flex: 2,
              ),
              CustomText(
                hintname: 'product name',
                onchange: (data) {
                  productname:
                  data;
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(
                hintname: 'description',
                onchange: (data) {
                  description:
                  data;
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(
                inputType: TextInputType.number,
                hintname: 'price',
                onchange: (data) {
                  price:
                  data;
                },
              ),
              SizedBox(
                height: 5,
              ),
              CustomText(
                hintname: 'image',
                onchange: (data) {
                  image:
                  data;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtom(
                  hint: 'Update',
                  ontap: () async {
                    isloading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                    } catch (e) {
                      print(e.toString());
                    }
                    isloading = false;
                    setState(() {});
                  }),
              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModal product) async {
    await UpdateProductService().updateProduct(
      title: widget.productname == null ? product.title : widget.productname!,
      price: widget.price == null ? product.price.toString() : widget.price!,
      description: widget.description == null
          ? product.description
          : widget.description!,
      image: widget.image == null ? product.imaage : widget.image!,
      category: product.category,
      id: product.id,
    );
  }
}
