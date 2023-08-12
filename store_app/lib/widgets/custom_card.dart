import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.products});
  final ProductModal products;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProduct.id, arguments: products);
      },
      child: Container(
        padding: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              color: Colors.grey.withOpacity(.1),
              spreadRadius: 10,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products.title.substring(0, 11),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${products.price}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Icon(Icons.favorite),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: -25,
                right: 5,
                child: Image.network(
                  products.imaage,
                  height: 80,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
