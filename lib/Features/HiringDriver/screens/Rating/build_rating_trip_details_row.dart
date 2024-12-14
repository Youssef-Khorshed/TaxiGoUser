import 'package:flutter/material.dart';

class BuildRatingTripDetailsRow extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  const BuildRatingTripDetailsRow(
      {super.key,
      required this.label,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Icon(icon, color: iconColor, size: size.height * 0.025),
        SizedBox(width: size.width * 0.03),
        Text(
          label,
          style: TextStyle(fontSize: size.height * 0.02),
        ),
      ],
    );
  }
}
