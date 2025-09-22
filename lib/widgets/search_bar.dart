import 'package:flutter/material.dart';

/// Reusable search bar widget for client search functionality
class ClientSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearch;
  final TextEditingController? controller;

  const ClientSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onSearch,
    this.controller,
  });

  @override
  State<ClientSearchBar> createState() => _ClientSearchBarState();
}

class _ClientSearchBarState extends State<ClientSearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: ShapeDecoration(
        color: const Color(0xFFEAEDEF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        children: [
          // Search icon
          Container(
            height: double.infinity,
            padding: const EdgeInsets.only(left: 16),
            child: const Icon(
              Icons.search,
              color: Color(0xFF66707F),
              size: 20,
            ),
          ),
          
          // Search input
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: widget.onChanged,
              onSubmitted: (_) => widget.onSearch?.call(),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF66707F),
                  fontSize: 16,
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              style: const TextStyle(
                color: Color(0xFF111416),
                fontSize: 16,
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          
          // Clear button (when text is not empty)
          if (_controller.text.isNotEmpty)
            IconButton(
              onPressed: () {
                _controller.clear();
                widget.onChanged?.call('');
              },
              icon: const Icon(
                Icons.clear,
                color: Color(0xFF66707F),
                size: 20,
              ),
            ),
        ],
      ),
    );
  }
}

