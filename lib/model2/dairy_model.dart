import 'package:flutter/material.dart';

class HeadPhoneProduct {
  final int id, price;
  final String title, image;

  HeadPhoneProduct({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our headphone Products

List<HeadPhoneProduct> headphoneProducts = [
  HeadPhoneProduct(
    id: 1,
    image: 'assets/products/dairy/butter.jpg',
    title: "Chocobar",
    price: 35,
  ),
  HeadPhoneProduct(
    id: 2,
    image: "assets/products/dairy/cheese.jpg",
    title: "milk",
    price: 50,
  ),
  HeadPhoneProduct(
    id: 3,
    image: "assets/products/dairy/ddc.jpg",
    title: "Brown Bread",
    price: 45,
  ),
  HeadPhoneProduct(
    id: 4,
    image: "assets/products/dairy/icecream.jpg",
    title: "Curd",
    price: 30,
  ),
    HeadPhoneProduct(
    id: 5,
    image: "assets/products/dairy/churpi.jpg",
    title: "Panner",
    price: 125,
  ),
];
