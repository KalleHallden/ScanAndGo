import 'package:flutter/material.dart';

class Product {
  String id;
  String name;
  double price;
  AssetImage image;
  int amount;
  String info = "Swedish home grown";
  Product(String name, String id, double price, AssetImage image, int amount) {
    this.id = id;
    this.name = name;
    this.price = price;
    this.image = image;
    this.amount = amount;
  }
}