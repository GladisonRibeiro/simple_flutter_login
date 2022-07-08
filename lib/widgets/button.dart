import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.onPressed,
    this.child,
    this.label,
  })  : assert((child != null && label == null) ||
            (child == null && label != null)),
        super(key: key);

  final void Function()? onPressed;
  final Widget? child;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      child: child ??
          Text(
            label!,
            style: const TextStyle(fontSize: 18),
          ),
    );
  }
}
