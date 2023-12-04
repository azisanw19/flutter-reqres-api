import 'package:flutter/material.dart';

class ReqresTextFormField extends StatefulWidget {
  final String? Function(String? value)? valueValidator;
  final Function(String value)? valueChanged;
  final Function(bool? isValid)? isValidChanged;
  final String? initialValue;
  final InputDecoration? decoration;
  final TextAlign textAlign;
  final bool? enabled;
  final TextInputType? keyboardType;
  final bool obscureText;

  const ReqresTextFormField({
    super.key,
    this.valueValidator,
    this.valueChanged,
    this.isValidChanged,
    this.initialValue,
    this.decoration,
    this.textAlign = TextAlign.start,
    this.enabled,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  State<ReqresTextFormField> createState() => _ProfileTextFormFieldState();
}

class _ProfileTextFormFieldState extends State<ReqresTextFormField> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: TextFormField(
        enabled: widget.enabled,
        validator: widget.valueValidator,
        onChanged: (value) {
          widget.valueChanged?.call(value);
          bool? isValid = _globalKey.currentState?.validate();
          widget.isValidChanged?.call(isValid);
        },
        initialValue: widget.initialValue,
        keyboardType: widget.keyboardType,
        decoration: widget.decoration,
        textAlign: widget.textAlign,
        obscureText: widget.obscureText,
      ),
    );
  }

  @override
  void dispose() {
    _globalKey.currentState?.dispose();
    super.dispose();
  }
}
