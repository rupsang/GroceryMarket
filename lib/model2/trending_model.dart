import 'package:flutter/material.dart';

class Product {
  final int id, price;
  final String title, image;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our trending Products

List<Product> trendingProducts = [
  Product(
    id: 4,
    image: "assets/products/fruits/banana.jpg",
    title: "Mango",
    price: 50,
  ),
  Product(
    id: 2,
    image: "assets/products/vegetables/tomatos.jpg",
    title: "Brinjal",
    price: 135,
  ),
  Product(
    id: 4,
    image: "assets/products/vegetables/potatos.jpg",
    title: "Carrot",
    price: 65,
  ),
  Product(
    id: 3,
    image: "assets/products/fruits/kiwi.jpg",
    title: "Kiwi",
    price: 95,
  ),
];
