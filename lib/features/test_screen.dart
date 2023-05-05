import 'package:dev_app_1/constants/gaps.dart';
import 'package:dev_app_1/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).padding);
    print(MediaQuery.of(context).viewPadding);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: Container(),
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
        )
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.ice_skating),
        //       label: 'primary',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.ice_skating),
        //       label: 'secondary',
        //     ),
        //   ],
        // ),
        );
  }
}
