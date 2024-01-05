import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentations/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final darkMode = ref.watch(isDarkmodeProvider);
    // final selectedColor = ref.watch(selectedColorProvider);

    // Escuchar los cambios de los metodos del themeNotifierProvider
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Flutter Widgets',
      debugShowCheckedModeBanner: false,
      routerConfig: approuter,
      //theme: AppTheme(selectedColor: selectedColor , isDarkmode: darkMode ),
      theme: appTheme.getTheme(),
    );
  }
}
