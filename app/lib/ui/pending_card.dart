import 'package:app/database/outpass.dart';
import 'package:app/ui/color.dart';
import 'package:flutter/material.dart';

class PendingCard extends StatelessWidget {
  final OutPass outPass;
  final GestureTapCallback onTap;
  const PendingCard({super.key, required this.onTap, required this.outPass});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  'http://mbccet.com/img_small/${outPass.admno}.jpg',
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Icon(Icons.error, size: 70, color: red),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ID: ${outPass.admno}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Name: ${outPass.name}',
                      style: TextStyle(fontSize: 14, color: black),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Date: ${outPass.startDate} - ${outPass.endDate}',
                      style: TextStyle(
                          fontSize: 14,
                          color: mainColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
