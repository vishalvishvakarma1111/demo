import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateNotifierProvider<MYState, int>((ref) {
  return MYState(0);
});

class MYState extends StateNotifier<int> {
  int count = 0;

  MYState(super.state);

  void add() async {
    count++;
  }
}

class StateProDemo extends ConsumerWidget {
  const StateProDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStateProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // access the provider via ref.read(), then increment its state.
        onPressed: () => ref.read(counterStateProvider.notifier).state++,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              // 2. use the counter value
              'Value: $counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
