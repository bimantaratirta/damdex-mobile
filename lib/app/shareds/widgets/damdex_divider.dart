import 'package:flutter/material.dart';

class DamdexDivider extends StatelessWidget {
  const DamdexDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFd32228),
            Color(0xFFef9631),
            Color(0xFFa2b745),
            Color(0xFF2f458a),
            Color(0xFF821b6f),
          ],
        ),
      ),
    );
  }
}
