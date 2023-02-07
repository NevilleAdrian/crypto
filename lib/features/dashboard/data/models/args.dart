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
  final dynamic description;
  final dynamic verified;
  final dynamic floorPrice;
  final dynamic totalVol;
  final dynamic volume24hrs;

  const Args({
    required this.isDarkMode,
    required this.collectionName,
    required this.collectionId,
    required this.collectionProfileImg,
    required this.size,
    this.collectionImg,
    this.data,
    this.metaData,
    this.description,
    this.verified,
    this.floorPrice,
    this.totalVol,
    this.volume24hrs,
  });
}
