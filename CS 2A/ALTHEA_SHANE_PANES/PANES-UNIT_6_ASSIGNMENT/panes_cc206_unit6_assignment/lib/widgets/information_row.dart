import 'package:flutter/material.dart';

//Reusable Information Row
class InformationRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String data;

  const InformationRow({
    required this.icon,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    //vertical spacing
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          //Icon on the left
          Icon(icon, color: Colors.blue),

          //Space between icon and label
          SizedBox(width: 10),

          //Label
          Text("$label:", style: TextStyle(fontWeight: FontWeight.bold)),

          //Space between label and data
          SizedBox(width: 8),

          //Expands to fill available space
          Expanded(child: Text(data)),
        ],
      ),
    );
  }
}
