import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
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
  Map<String, String> formData = {'email': '', 'password': ''};
  String? _email;
  String? _password;

  @override
  void initState() {
    super.initState();
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
                      onSaved: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        _email = value;
                        print(_email);
                        setState(() {});
                      },
                    ),
                    Gaps.v20,

                    /// TextFormField : password
                    TextFormField(
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
                      onSaved: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        _password = value;
                        print(value);
                        setState(() {});
                      },
                    ),
                    Gaps.v20,

                    /// form button
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: CupertinoButton.filled(
                        onPressed: _email?.isEmpty == true ||
                                _password?.isEmpty == true
                            ? null
                            : _onSubmitTab,
                        disabledColor: Theme.of(context).colorScheme.outline,
                        child: Padding(
                          padding: EdgeInsets.zero,
                          child: AnimatedDefaultTextStyle(
                            style: TextStyle(
                              color: _email?.isEmpty == true ||
                                      _password?.isEmpty == true
                                  ? Theme.of(context).colorScheme.outlineVariant
                                  : Theme.of(context).colorScheme.onPrimary,
                            ),
                            duration: const Duration(milliseconds: 500),
                            child: Text(
                                '${_email?.isEmpty} ${_password?.isEmpty}'),
                          ),
                        ),
                      ),
                    ),
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
