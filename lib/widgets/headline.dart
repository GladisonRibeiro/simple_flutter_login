import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  const Headline(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: Theme.of(context).textTheme.headline3);
  }
}
