// ignore_for_file: file_names
import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final IconData icon;
  final String time;
  final String temperature;
  const HourlyForecastItem({
    super.key,
    required this.icon,
    required this.time,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      height: 130,
      child: Card(
        color: Colors.black38,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              time,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Icon(
              // Icons.cloud,
              icon,
              size: 32,
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              temperature,
              style: TextStyle(
                color: Colors.white38,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
