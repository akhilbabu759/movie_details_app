import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 21, 21, 27),
              Color.fromARGB(255, 32, 103, 133),
            ],
          ),
        ),
        padding: const EdgeInsets.only(top: 20.0),
        child: TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white38),
                borderRadius: BorderRadius.circular(20)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            labelText: 'Search movies',
            labelStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
