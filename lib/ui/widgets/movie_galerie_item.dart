import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieGalerieItem extends StatelessWidget {
  const MovieGalerieItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Alexandra_Daddario_Bywatch_premiere.jpg/800px-Alexandra_Daddario_Bywatch_premiere.jpg",
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => const Icon(Icons.error) 
    );
  }
}