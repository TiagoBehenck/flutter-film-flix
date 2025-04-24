import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
      color: Theme.of(context).colorScheme.primary,
      ),
      decoration: InputDecoration(
      hintText: 'Search for a title...',
      hintStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      prefixIcon: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.menu),
      ),
      prefixIconColor: Theme.of(context).colorScheme.primary,
      suffixIcon: const Padding(
        padding: EdgeInsets.only(right: 8),
        child: Icon(Icons.search),
      ),
      suffixIconColor: Theme.of(context).colorScheme.primary,
      filled: true,
      fillColor: const Color(0xFF2B2930),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      ),
    );
  }
}
