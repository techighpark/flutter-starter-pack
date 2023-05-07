import 'package:dev_app_1/features/authentication/views/sign_in_form_view.dart';
import 'package:dev_app_1/features/authentication/views/sign_up_form_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_tab_bar_view.dart';
import 'package:dev_app_1/features/onboarding/views/my_single_child_scroll_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider(
  (ref) => GoRouter(
    initialLocation: '/signin',
    routes: [
      GoRoute(
        path: SignInFormView.routeUrl,
        name: SignInFormView.routeName,
        builder: (context, state) => const SignInFormView(),
      ),
      GoRoute(
        path: SignUpFormView.routeUrl,
        name: SignUpFormView.routeName,
        builder: (context, state) => const SignUpFormView(),
      ),
      GoRoute(
        path: MySingleChildScrollView.routeUrl,
        name: MySingleChildScrollView.routeName,
        builder: (context, state) {
          final email = state.queryParams['email'] ?? 'no email';
          return MySingleChildScrollView(email: email);
        },
      ),
    ],
  ),
);
