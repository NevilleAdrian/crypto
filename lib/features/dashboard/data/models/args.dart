import 'package:flutter/material.dart';

class Args {
  final bool isDarkMode;
  final String collectionName;
  final String collectionId;
  final String collectionProfileImg;
  final Size size;
  final dynamic data;
  final dynamic metaData;
  final dynamic collectionImg;

  const Args({
    required this.isDarkMode,
    required this.collectionName,
    required this.collectionId,
    required this.collectionProfileImg,
    required this.size,
    this.collectionImg,
    this.data,
    this.metaData,
  });
}
