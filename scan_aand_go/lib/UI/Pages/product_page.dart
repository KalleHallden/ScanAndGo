import 'package:flutter/material.dart';
import 'package:scan_aand_go/Models/global.dart';
import 'package:scan_aand_go/Models/product.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({Key key, this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: Container(
                child: Stack(children: <Widget>[
      Container(
          decoration: BoxDecoration(
              color: purpleColor,
              gradient: RadialGradient(
                center: const Alignment(-1.5, -0.9), // near the top right
                radius: 1.3,
                colors: [
                  const Color(0xFFC0F0F4), // yellow sun
                  purpleColor, // blue sky
                ],
                stops: [0.1, 1.0],
              )),
      )
    ])))
    );
  }
}