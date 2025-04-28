import 'dart:async';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    required this.controller,
    required this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  Timer? _debounce;

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query.length >= 3) {
        widget.onChanged(query);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: _onSearchChanged,
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
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              widget.onChanged(widget.controller.text);
            },
          ),
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
