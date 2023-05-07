import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/authentication/views/sign_in_form_view.dart';
import 'package:dev_app_1/common/widgets/form_button.dart';
import 'package:dev_app_1/common/widgets/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpFormView extends StatefulWidget {
  static String routeUrl = "/signup";
  static String routeName = "signup";
  const SignUpFormView({Key? key}) : super(key: key);

  @override
  State<SignUpFormView> createState() => _SignUpFormViewState();
}

class _SignUpFormViewState extends State<SignUpFormView> {
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

  void _onSignInTab() {
    context.push(SignInFormView.routeUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
            vertical: Sizes.size96,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                    FormTextField(
                      isObscure: false,
                      onChangedValue: (value) =>
                          _onChangedField(value, 'password'),
                      onSavedValue: (value) => _onSavedValue(value, 'password'),
                    ),
                    Gaps.v20,
                    FormTextField(
                      isObscure: true,
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
              onTap: _onSignInTab,
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
