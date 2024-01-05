import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//false=>light, true=>dark
final isDarkmodeProvider = StateProvider<bool>((ref) => false);

//Listado de colores inmmutable
final colorListProvider = Provider((ref) => colorList);

//Provider para index del color seleccionado
final selectedColorProvider = StateProvider<int>((ref) => 0);

//Un objeto tipo AppTheme (custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = Estado = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toogleDarkMode() {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
