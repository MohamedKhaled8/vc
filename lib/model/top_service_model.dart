import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TopServiceModelCard {
  final String title;
  final String image;
  final double rate;
  final double price;
  final int id;
  final bool is_favorite;
  TopServiceModelCard({
    required this.title,
    required this.image,
    required this.rate,
    required this.price,
    required this.id,
    required this.is_favorite,
  });
}
