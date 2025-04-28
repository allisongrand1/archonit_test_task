import 'package:flutter/material.dart';

class HomeErrorView extends StatelessWidget {
  final String error;
  const HomeErrorView(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Center(child: Text(error)));
  }
}
