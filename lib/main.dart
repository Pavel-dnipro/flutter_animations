import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_drawer.dart';
import 'package:flutter_animations/themes.dart';
import 'package:flutter_animations/themes_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    return MaterialApp(
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeModeState,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    return AnimatedDrawer(
        drawer: Material(
          child: Container(
            color: const Color(0xff24283b),
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 100, top: 100),
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Flutter Theming Riverpod Demo",
              style: TextStyle(fontSize: 18),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.teal,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Change Theme $themeModeState",
                  style: const TextStyle(fontSize: 18),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return Switch(
                        value: themeModeState == ThemeMode.dark,
                        onChanged: (value) {
                          ref.read(themesProvider.notifier).changeTheme(value);
                        });
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
