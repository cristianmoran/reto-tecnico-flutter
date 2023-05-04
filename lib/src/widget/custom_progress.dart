import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        color: Colors.white,
        child: const Center(child: CircularProgressIndicator()));
  }
}
