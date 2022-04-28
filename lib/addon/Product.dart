import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

List<Product> demoProducts = [
  Product(
    id: 1,
    image: "assets/products/dairy/cheese.jpg",
    title: "milk",
    price: 50,
  ),
  Product(
    id: 2,
    image: 'assets/products/fruits/apple.jpg',
    title: "Orange",
    price: 55,
  ),
  Product(
    id: 3,
    image: 'assets/products/vegetables/cauliflower.jpg',
    title: "Cabbage",
    price: 35,
  ),
  Product(
    id: 3,
    image: 'assets/products/vegetables/cauliflower.jpg',
    title: "Cabbage",
    price: 35,
  ),
];
