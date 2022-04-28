import 'package:flutter/material.dart';

class IphoneProduct {
  final int id, price;
  final String title, image;

  IphoneProduct({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our iPhone Products

List<IphoneProduct> iPhoneProducts = [
  IphoneProduct(
    id: 1,
    image: 'assets/products/vegetables/cauliflower.jpg',
    title: "Cabbage",
    price: 35,
  ),
  IphoneProduct(
    id: 2,
    image: "assets/products/vegetables/onions.jpg",
    title: "Mushroom",
    price: 50,
  ),
  IphoneProduct(
    id: 3,
    image: "assets/products/vegetables/potatos.jpg",
    title: "Carrot",
    price: 65,
  ),
  IphoneProduct(
    id: 4,
    image: "assets/products/vegetables/tomatos.jpg",
    title: "Brinjal",
    price: 135,
  ),
];
