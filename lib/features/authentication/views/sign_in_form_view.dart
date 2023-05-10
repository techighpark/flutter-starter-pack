import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:dev_app_1/features/authentication/views/sign_up_form_view.dart';
import 'package:dev_app_1/common/widgets/form_button.dart';
import 'package:dev_app_1/common/widgets/form_text_field.dart';
import 'package:dev_app_1/features/main_navigation/views/main_navigation_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_single_child_scroll_view.dart';
import 'package:dev_app_1/features/widget_navigation/widget_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInFormView extends StatefulWidget {
  static String routeUrl = "/signin";
  static String routeName = "signin";
  const SignInFormView({Key? key}) : super(key: key);

  @override
  State<SignInFormView> createState() => _SignInFormViewState();
}

class _SignInFormViewState extends State<SignInFormView> {
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
        // context.push(
        //   FirstOnBoardView.routeUrl,
        //   extra: {
        //     'user': '123',
        //   },
        // );
        context.pushNamed(MySingleChildScrollView.routeName,
            queryParams: {'email': formData['email']});
      }
    }
  }

  void _onSignUpTap() {
    context.go(SignUpFormView.routeUrl);
  }

  void _onWidgetNavigationTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WidgetNavigation(),
      ),
    );
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
                    ),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: CupertinoButton(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        onPressed: _onWidgetNavigationTap,
                        child: Text(
                          'Widget Navigation',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
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
              onTap: _onSignUpTap,
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
