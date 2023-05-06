import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/authentication/widgets/form_button.dart';
import 'package:dev_app_1/features/authentication/widgets/form_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// TextFormField
/// don't need controller
class LogInFormView extends StatefulWidget {
  const LogInFormView({Key? key}) : super(key: key);

  @override
  State<LogInFormView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInFormView> {
  /// Form Widget을 사용하려면 GlobalKey 필요
  /// Unique Identifier
  /// Access state of Form
  /// Trigger some method of Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String?> formData = {'email': '', 'password': ''};
  bool _disabledButton = true;

  @override
  void initState() {
    super.initState();
    _disabledButton =
        formData['email']!.isEmpty || formData['password']!.isEmpty;
  }

  void _onChangedForm() {
    _disabledButton =
        formData['email']!.isEmpty || formData['password']!.isEmpty;
    setState(() {});
  }

  void _onChangedField(String value, String field) {
    formData[field] = value;
  }

  void _onSavedValue(String value, String field) {
    if (value.isNotEmpty) {
      formData[field] = value;
      print(field);
      print(formData);
    }
  }

  void _onSubmitTab() {
    /// print(_formKey.currentContext);
    // Form-[LabeledGlobalKey<FormState>#29477](state: FormState#b9575)

    /// print(_formKey.currentState);
    // FormState#b9575

    /// print(_formKey.currentState?.context);
    // Form-[LabeledGlobalKey<FormState>#29477](state: FormState#b9575)

    /// print(_formKey.currentState?.validate());
    // true = no error or false = has error

    /// print(_formKey.currentWidget);
    // Form-[LabeledGlobalKey<FormState>#29477]

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        /// trigger onSaved callback function of [TextFormField]
        _formKey.currentState!.save();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            left: Sizes.size40,
            right: Sizes.size40,
            top: Sizes.size96,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Sign in',
              //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
              //         fontWeight: FontWeight.w800,
              //       ),
              // ),
              // Gaps.v20,
              Text(
                'This is Description of this app. It can contain up to two lines in mobile.',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(),
              ),
              Gaps.v40,

              Form(
                key: _formKey,
                onChanged: _onChangedForm,
                child: Column(
                  children: [
                    /// TextFormField : email
                    TextFormField(
                      /// value = [TextFormField] Value
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please write your email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.surfaceVariant,
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
                        formData["email"] = value;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["email"] = newValue;
                        }
                      },
                    ),
                    Gaps.v20,

                    /// TextFormField : password
                    TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please write your password";
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.surfaceVariant,
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
                        formData["password"] = value;
                      },
                      onSaved: (newValue) {
                        if (newValue != null) {
                          formData["password"] = newValue;
                        }
                      },
                    ),
                    Gaps.v20,
                    FormTextField(
                      onChangedValue: (value) =>
                          _onChangedField(value, 'password'),
                      onSavedValue: (value) => _onSavedValue(value, 'password'),
                    ),
                    Gaps.v20,
                    FormTextField(
                      onChangedValue: (value) =>
                          _onChangedField(value, 'email'),
                      onSavedValue: (value) => _onSavedValue(value, 'email'),
                    ),
                    Gaps.v20,

                    /// form button
                    FormButton(
                      text: 'Sign in',
                      disabledButton: _disabledButton,
                      onSubmit: _onSubmitTab,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          top: Sizes.size32,
          bottom: MediaQuery.of(context).padding.bottom + Sizes.size10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () {},
              child: Text(
                'Sign up',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
