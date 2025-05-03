

import 'package:examcollectors/utils/AppColorCollections.dart';
import 'package:examcollectors/widgets/AllCommonWidget.dart';
import 'package:flutter/material.dart';


void showExamSelectionHelp(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title:
      ReusableText(
        FromTop: 0,
        FromLeft: 10,
        FromBottom: 0,
        TextString: 'How to Use the Exam App',
        FontSize: 20,
        TextFontWeight: FontWeight.w800,
        TextColor: ColorCollections.TextColor,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Select in this exact order:", style: TextStyle(fontWeight: FontWeight.w500)),
          const SizedBox(height: 12),
          _buildStep(1, "Choose your University"),
          _buildStep(2, "Select your Department"),
          _buildStep(3, "Pick your Subject"),
          _buildStep(4, "Select Exam Year"),
          _buildStep(5, "Choose Exam Type"),
          const SizedBox(height: 16),
          Text(
            "Note: You can't skip steps - each selection unlocks the next one.",
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: ReusableText(
            FromTop: 0,
            FromLeft: 10,
            FromBottom: 0,
            TextString: 'GOT IT',
            FontSize: 18,
            TextFontWeight: FontWeight.w800,
            TextColor: ColorCollections.TextColor.withOpacity(0.6),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

Widget _buildStep(int number, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$number.", style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    ),
  );
}
