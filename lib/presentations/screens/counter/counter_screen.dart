import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentations/providers/counter_provider.dart';
import 'package:widgets_app/presentations/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool darkMode = ref.watch(isDarkmodeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter RiverPod'),
          actions: [
            IconButton(
              icon: darkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined),
              onPressed: () {
                // if (darkMode) {
                //   ref.read(isDarkmodeProvider.notifier).state = false;
                // } else {
                //   ref.read(isDarkmodeProvider.notifier).state = true;
                // }
                ref.read(isDarkmodeProvider.notifier).update((stateDark) => !stateDark);
              },
            )
          ],
        ),
        body: Center(
          child: Text(
            "Valor: $clickCounter",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
            //ref.read(counterProvider.notifier).update((state) => state + 1);
          },
        ));
  }
}
