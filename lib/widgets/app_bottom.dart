import 'package:flutter/material.dart';

// Shortcut for create stateless widget => stl
class AppBottom extends StatelessWidget {
  final String label;
  final Color color;
  final void Function()? onTap;
  final double width;
  const AppBottom({
    super.key,
    required this.label,
    required this.color,
    this.width = 280,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 280,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
