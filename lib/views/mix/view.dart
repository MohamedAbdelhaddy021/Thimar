import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MixView extends StatefulWidget {
  const MixView({super.key});

  @override
  State<MixView> createState() => _MixViewState();
}

class _MixViewState extends State<MixView> {
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (image != null)
              SizedBox(
                height: 200,
                width: 200,
                child: Image.asset(image!),
              ),
            FloatingActionButton(
              onPressed: () async {
                var file = await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
                setState(() {
                  if (file?.path != null) {
                    image=file?.path;
                  }
                });
              },
              child: const Icon(Icons.picture_as_pdf),
            )
          ],
        ),
      ),
    );
  }
}
