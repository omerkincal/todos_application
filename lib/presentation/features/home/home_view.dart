import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../blocs/theme_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ThemeMode newThemeMode =
                  Theme.of(context).brightness == Brightness.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeMode(newThemeMode);
            },
            icon: const Icon(Icons.brightness_4_sharp),
          )
        ],
      ),
    );
  }
}
