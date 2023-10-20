import 'package:flutter/material.dart';

class DialogView extends StatefulWidget {
  const DialogView({super.key});

  @override
  State<DialogView> createState() => _dialogViewState();
}

class _dialogViewState extends State<DialogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              title: Text("mohamed"),
              children: [
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 16.0),
                  child: Text("yes"),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:  EdgeInsetsDirectional.only(start: 16.0),
                  child: Text("No"),
                ),
              ],
            ),
          );
        },
        child: Text("Dialog"),
      ),
    );
  }
}
