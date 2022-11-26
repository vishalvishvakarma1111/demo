import 'package:flutter/material.dart';

class EditTitle extends StatelessWidget {
  final controller = TextEditingController();

  EditTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)?.settings.arguments as String;
    controller.text = title;
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Title")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: controller,
              ),
              MaterialButton(
                onPressed: () => Navigator.pop(context, controller.text.trim()),
                minWidth: 250,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                color: Colors.blue,
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
