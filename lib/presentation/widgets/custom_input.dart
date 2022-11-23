import 'package:chats/styles/color_styles.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String? hintText;
  final double? width;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? title;

  const CustomInput({
    Key? key,
    this.hintText,
    this.width,
    required this.controller,
    this.onChanged,
    this.title,
  }) : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, TextEditingValue value, __) {
        return Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title ?? '',
                style: const TextStyle(
                  color: ColorStyles.primaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: widget.width,
              child: TextFormField(
                minLines: 1,
                maxLines: 10,
                controller: widget.controller,
                cursorColor: ColorStyles.elementsColor,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black45,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: ColorStyles.primaryTextColor.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.5,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(color: Colors.white12, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: ColorStyles.elementsColor, width: 1),
                  ),
                ),
                style: TextStyle(
                  color: ColorStyles.primaryTextColor.withOpacity(0.8),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: widget.onChanged,
              ),
            ),
          ],
        );
      },
    );
  }
}
