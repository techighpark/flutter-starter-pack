import 'package:dev_app_1/constants/gaps.dart';
import 'package:flutter/material.dart';

class TextThemeView extends StatelessWidget {
  const TextThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'displaySmall',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Gaps.v20,
          Text(
            'headlineLarge 42',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'headlineMedium 33',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'headlineSmall 24',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Gaps.v20,
          Text(
            'titleLarge 20',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'titleMedium 16',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'titleSmall 14',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Gaps.v20,
          Text(
            'bodyLarge 16',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'bodyMedium 14',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'bodySmall 12',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Gaps.v20,
          Text(
            'labelLarge 14',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            'labelMedium 12',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            'labelSmall 10',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
