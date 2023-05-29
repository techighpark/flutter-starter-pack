import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechListTileView extends StatefulWidget {
  const TechListTileView({Key? key}) : super(key: key);

  @override
  State<TechListTileView> createState() => _TechListTileViewState();
}

class _TechListTileViewState extends State<TechListTileView> {
  bool _boolean = false;

  void _toggleBoolean(bool? newValue) {
    if (newValue == null) return;
    _boolean = newValue;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Tile View'),
        // automaticallyImplyLeading: false,
        actions: const [
          CloseButton(),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => showAboutDialog(
              context: context,
              applicationName: '[[showAboutDialog]]',
              applicationVersion: "[[1.0]]",
              applicationLegalese:
                  "[[All rights reserved. Please don't copy me.]]",
            ),
            title: const Text('[[showAboutDialog]]'),
            subtitle: const Text('[[subtitle]]'),
          ),
          const AboutListTile(
            applicationName: '[[AboutListTile]]',
            applicationVersion: "[[1.0]]",
            applicationLegalese:
                "[[All rights reserved. Please don't copy me.]]",
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1970),
                lastDate: DateTime(2030),
              );
              print(date);
            },
            title: const Text(
              'showDatePicker',
            ),
          ),
          ListTile(
            onTap: () async {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
            },
            title: const Text(
              'showTimePicker',
            ),
          ),
          ListTile(
            onTap: () async {
              final range = await showDateRangePicker(
                context: context,
                firstDate: DateTime(2022),
                lastDate: DateTime(2024),
                // builder: (context, child) {
                //   return Theme(
                //     data: ThemeData.dark(),
                //     child: child!,
                //   );
                // },
              );
              print(range);
            },
            title: const Text(
              'showDateRangePicker',
            ),
          ),
          Checkbox(
            value: _boolean,
            onChanged: (value) => _toggleBoolean(value),
          ),
          Switch(
            value: _boolean,
            onChanged: (value) => _toggleBoolean(value),
          ),
          Switch.adaptive(
            value: _boolean,
            onChanged: (value) => _toggleBoolean(value),
          ),
          CheckboxListTile(
            value: _boolean,
            onChanged: (value) => _toggleBoolean(value),
            title: const Text('CheckboxListTile'),
          ),
          SwitchListTile(
            value: _boolean,
            onChanged: (value) => _toggleBoolean(value),
            title: const Text('SwitchListTile'),
          ),
          SwitchListTile.adaptive(
            value: _boolean,
            onChanged: (value) => _toggleBoolean(value),
            title: const Text('SwitchListTile.adaptive'),
          ),
          ListTile(
            title: const Text(
              'showCupertinoDialog',
            ),
            subtitle: const Text('CupertinoAlertDialog'),

            /// Nothing happens when you tap outside the dialog
            onTap: () => showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('CupertinoAlertDialog'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Hello'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    child: const Text('Bye'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                    child: const Text('Bye'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.arrow_3_trianglepath,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'showDialog',
            ),
            subtitle: const Text('AlertDialog'),
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('AlertDialog'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Hello'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                    child: const Text('Bye'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.arrow_3_trianglepath,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'showCupertinoModalPopup',
            ),
            subtitle: const Text('CupertinoAlertDialog - ugly'),

            /// Tap outside modal popup to disappear
            onTap: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: const Text('CupertinoAlertDialog'),
                actions: [
                  CupertinoDialogAction(
                    child: const Text('Hello'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    child: const Text('Bye'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                    child: const Text('Bye'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.arrow_3_trianglepath,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'showCupertinoModalPopup',
            ),
            subtitle: const Text('CupertinoActionSheet - pretty'),

            /// Tap outside modal popup to disappear
            onTap: () => showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoActionSheet(
                title: const Text('CupertinoActionSheet'),
                message: const Text('message'),
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text('Hello'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    child: const Text('Bye'),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  TextButton(
                    child: const Text(
                      'Bye',
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  IconButton(
                    icon: const Icon(
                      CupertinoIcons.arrow_3_trianglepath,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
