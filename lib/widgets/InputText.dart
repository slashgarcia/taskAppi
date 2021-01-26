import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class InputText extends StatelessWidget {
  const InputText({
    @required this.stream,
    this.validator,
    @required this.title,
    this.sizeWidth,
    this.icon,
    this.padding,
    this.obscureText = false,
    this.textInputType,
    this.inputFormatters,
  });

  final BehaviorSubject stream;
  final String title;
  final Function(String) validator;
  final EdgeInsets padding;
  final double sizeWidth;
  final bool obscureText;
  final Widget icon;
  final TextInputType textInputType;
  final List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return Center(
          child: Container(
            padding: padding,
            width: sizeWidth,
            child: TextFormField(
              autofocus: false,
              onChanged: stream.sink.add,
              obscureText: obscureText,
              validator: validator,
              keyboardType: textInputType,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                hintText: title,
                suffixIcon: icon,
              ),
            ),
          ),
        );
      },
    );
  }
}
