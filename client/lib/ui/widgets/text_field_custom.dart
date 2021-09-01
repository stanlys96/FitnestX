import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldCustom extends StatelessWidget {
  Icon? icon;
  String? hintText;
  Icon? suffixIcon;

  TextFieldCustom({@required this.icon, this.hintText, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 16,
      padding: const EdgeInsets.symmetric(
        horizontal: 12.5,
        vertical: 2.5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFDDDADA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          icon!,
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIconConstraints: BoxConstraints(
                  minWidth: 10,
                  minHeight: 2,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: hintText ?? "",
                hintStyle: GoogleFonts.poppins(fontSize: 14),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          suffixIcon != null
              ? GestureDetector(
            onTap: () {},
            child: suffixIcon,
          )
              : SizedBox(),
        ],
      ),
    );
  }
}