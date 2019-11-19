import 'package:flutter/material.dart';

import 'Models/global.dart';
import 'Models/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> products;
  Color inactive = Colors.transparent;
  int page = 0;
  Map active = {
    0 : Colors.black.withOpacity(0.3),
    1 : Colors.transparent
  };
  @override
  initState() {
    products = [];
    for (int i = 1; i < 9; i++) {
      products.add(new Product("Blueberries", "401" + i.toString(), 12.0, AssetImage('lib/Assets/blue.png'), 3));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // margin: EdgeInsets.only(top: 150),
            child: Stack(children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 120, left: 30, right: 30),
        margin: EdgeInsets.only(top: 250),
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: greenColor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(50), topLeft: Radius.circular(50)),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
          ],
        ),
        child: Container(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Container(
                width: 120,
                height: 40,
                child: FlatButton(
                  color: active[0],
                  child: Text("In Cart", style: whiteTitleAvenir),
                  onPressed: () {
                    if (page != 0) {
                      setState(() {
                        active[page]  = Colors.transparent;
                        page = 0;
                        active[page] = Colors.black.withOpacity(0.3);
                      });
                    }
                  },
                  shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  //side: BorderSide(color: Colors.red)
                ),
                ),
              ),
              Container(
                width: 170,
                height: 40,
                child: FlatButton(
                  color: active[1],
                  child: Text("Shopping List", style: whiteTitleAvenir),
                  onPressed: () {
                    if (page != 1) {
                      setState(() {
                        active[page]  = Colors.transparent;
                        page = 1;
                        active[page] = Colors.black.withOpacity(0.3);
                      });
                    }
                  },
                  shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                  //side: BorderSide(color: Colors.red)
                ),
                )
              )
            ],),
            getCart()
          ],)
        )
      ),
      Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.only(top: 150, left: 20, right: 20),
          constraints: BoxConstraints.expand(height: 200),
          decoration: BoxDecoration(
            color: purpleColorLight,
            borderRadius: BorderRadius.all(Radius.circular(40)),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 5)
            ],
          ),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total", style: whiteTitleLarge),
                Text("\$" + getTotal().toString(), style: whiteTitle)
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:50),
              width: 300,
              height: 50,
              child: RaisedButton(
                color: purpleColor,
                child: Text("Check Out", style: whiteTitle),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  //side: BorderSide(color: Colors.red)
                ),
              ),
            )
          ])),
    ])) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget getCart() {
    List<Widget> items = [];
    for (Product product in products) {
      items.add(productListItem(product));
    }
    return Container(
      height: 402,
      child: ListView(children: items,)
    );
  }

  Widget productListItem(Product product) {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
            Text(product.name + " x" + product.amount.toString(), style: smallWhiteTitle ),
            Text("\$" + (product.price * product.amount).toString(), style: smallWhiteTitle)
          ],),
          Text(product.info, style: smallWhiteTitleTransparent,),
          Divider(color: Colors.white.withOpacity(0.5))
        ]
      )
    );
  }

  int getTotal() {
    return (23.0).toInt();
  }
}
