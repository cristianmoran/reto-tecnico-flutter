import 'package:flutter/material.dart';

class ItemDetail extends StatelessWidget {
  final String title;
  final String director;
  final String imageUrl;

  const ItemDetail({
    Key? key,
    required this.title,
    required this.director,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
          return const SizedBox(width: 50, height: 50);
        },
      ),
      title: Text(title),
      subtitle: Text(director),
      onTap: () {
        // Do something when the item is tapped
      },
    );
  }
}
