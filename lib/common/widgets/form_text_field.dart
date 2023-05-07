import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final Function onChangedValue;
  final Function onSavedValue;
  final bool isObscure;

  const FormTextField({
    Key? key,
    required this.onChangedValue,
    required this.onSavedValue,
    required this.isObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Please write your password";
        }
        return null;
      },
      obscureText: isObscure,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: Sizes.size20,
          vertical: Sizes.size16,
        ),
        hintText: 'hintText',
        labelText: 'labelText',
      ),
      onChanged: (value) {
        onChangedValue(value);
      },
      onSaved: (newValue) {
        if (newValue != null) {
          onSavedValue(newValue);
        }
      },
    );
  }
}
