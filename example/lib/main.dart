import 'package:flutter/material.dart';
import 'package:flutter_web_downloader/flutter_web_downloader.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController controller;
  late bool enabled;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController()
      ..text = 'https://picsum.photos/250/250';
    enabled = true;
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    controller: controller,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (_) => validateForm(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Value cannot be empty';
                      }
                      if (!FlutterWebDownloader.isValidUrl(value)) {
                        return 'Please enter a valid url';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!enabled) ...[
                        SizedBox.square(
                          dimension: 10,
                          child: CircularProgressIndicator(
                            color: Colors.grey.shade400,
                            strokeWidth: 2,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                      Text('Download'),
                    ],
                  ),
                  onPressed: enabled ? validateForm : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateForm() async {
    // Validate returns true if the form is valid, or false otherwise.
    if (formKey.currentState!.validate()) {
      setState(() => enabled = false);
      // Just to show some progress
      await Future.delayed(
        const Duration(seconds: 1),
        () => FlutterWebDownloader.downloadFileFromUrl(controller.text),
      );

      setState(() => enabled = true);
    } else {
      print('Form is not valid');
    }
  }
}
