import 'package:flutter/material.dart';

class SamsungProduct {
  final int id, price;
  final String title, image;

  SamsungProduct({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our samsung Products

List<SamsungProduct> samsungProducts = [
  SamsungProduct(
    id: 1,
    image: 'assets/products/fruits/apple.jpg',
    title: "Orange",
    price: 55,
  ),
  SamsungProduct(
    id: 2,
    image: "assets/products/fruits/oranges.jpg",
    title: "Pineapple",
    price: 80,
  ),
  SamsungProduct(
    id: 3,
    image: "assets/products/fruits/kiwi.jpg",
    title: "Dragon fruit",
    price: 95,
  ),
  SamsungProduct(
    id: 4,
    image: "assets/products/fruits/banana.jpg",
    title: "Mango",
    price: 50,
  ),
];
