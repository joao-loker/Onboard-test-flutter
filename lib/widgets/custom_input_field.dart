import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? hintText;

  const CustomInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.hintText,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        Container(
          height: 20, // Altura fixa para o label
          child: Text(
            widget.labelText.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF616161),
              fontSize: 14,
              fontFamily: 'Cera Pro',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 8), // Espaço exato de 8px
        // Input field
        Container(
          width: double.infinity,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: ShapeDecoration(
            color: const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 2,
                color: _isFocused 
                    ? const Color(0xFF313131) 
                    : const Color(0xFFEEEEEE),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Center(
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              obscureText: widget.obscureText,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
                isCollapsed: true,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color(0xFF616161),
                  fontSize: 16,
                  fontFamily: 'Cera Pro',
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: const TextStyle(
                color: Color(0xFF616161),
                fontSize: 16,
                fontFamily: 'Cera Pro',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
} 