import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueProvider = ChangeNotifierProvider<MyTestProvider>((ref) {
  return MyTestProvider();
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '${value.count} ',
              style: Theme.of(context).textTheme.headline4,
            ),
            IconButton(
              onPressed: () => value.add(),
              icon: const Icon(Icons.add),
            ),
            const SecondView(),
          ],
        ),
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final value = ref.watch(valueProvider);
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                value.changeText();
              },
              child: Text("second view ${value.secondViewText}"),
            ),
            TextButton(
              onPressed: () {
                value.add();
              },
              child: Text("second view ${value.count}"),
            )
          ],
        );
      },
    );
  }
}

class MyTestProvider extends ChangeNotifier {
  int count = 0;
  String secondViewText = "This starting";

  void changeText() {
    if (secondViewText == "This starting") {
      secondViewText = "Text changes successfully";
    } else {
      secondViewText = "This starting";
    }
    notifyListeners();
  }

  void add() {
    count++;
    notifyListeners();
  }
}

class DemoStateFull extends ConsumerStatefulWidget {
  const DemoStateFull({Key? key}) : super(key: key);

  @override
  _DemoStateFullState createState() => _DemoStateFullState();
}

class _DemoStateFullState extends ConsumerState<DemoStateFull> {
  @override
  void initState() {
    super.initState();
    final value = ref.read(valueProvider);
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(valueProvider);
    return Scaffold(
      body: Center(
        child: Text(
          'Value: ${value.count}',
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
