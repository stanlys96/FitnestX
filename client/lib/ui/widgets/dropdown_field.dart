import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownField extends StatelessWidget {
  const DropdownField({
    required this.data,
  });

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 16,
      padding: const EdgeInsets.only(
        top: 1,
        bottom: 2.5,
        left: 12.5,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFDDDADA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.person_outline),
          Expanded(
            child: DropdownButtonFormField(
              isExpanded: true,
              hint: Text('Choose Gender'),
              icon: const Icon(Icons.keyboard_arrow_down_sharp),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintStyle: GoogleFonts.poppins(fontSize: 14),
              ),
              items: data.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
