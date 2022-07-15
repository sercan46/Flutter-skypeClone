import 'package:flutter/material.dart';

class CustomTextField {
  Widget returnCustom() {
    return TextField(
      style: const TextStyle(fontSize: 15.0, color: Color(0xFF9c9da2)),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF2b2b33),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xFF9c9da2),
        ),
        hintText: "Ara",
        hintStyle: const TextStyle(color: Color(0xFF9c9da2)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 32.0),
            borderRadius: BorderRadius.circular(15.0)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey, width: 32.0),
            borderRadius: BorderRadius.circular(15.0)),
      ),
    );
  }
}
