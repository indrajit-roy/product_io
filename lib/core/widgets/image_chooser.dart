import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/subjects.dart';

class ImageChooser extends StatefulWidget {
  final double? height;
  final double? width;
  final Function(File imageFile)? onImageChanged;
  final ImageProvider? initialImage;
  const ImageChooser({Key? key, this.height, this.width, this.onImageChanged, this.initialImage}) : super(key: key);

  @override
  _ImageChooserState createState() => _ImageChooserState();
}

class _ImageChooserState extends State<ImageChooser> {
  late BehaviorSubject<ImageProvider> imageProvider;
  @override
  void initState() {
    imageProvider = BehaviorSubject<ImageProvider>.seeded(widget.initialImage ?? const AssetImage("chooser_dummy.png"));
    super.initState();
  }

  @override
  void dispose() {
    imageProvider.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: StreamBuilder<ImageProvider>(
              initialData: imageProvider.valueOrNull,
              stream: imageProvider,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  return Image(
                    image: snapshot.data!,
                    height: widget.height,
                    width: widget.width,
                    fit: BoxFit.cover,
                  );
                }
                return const SizedBox();
              }),
        ),
        ElevatedButton(
          onPressed: () async {
            final file = await ImagePicker().pickImage(source: ImageSource.camera);
            if (file != null) {
              widget.onImageChanged?.call(File(file.path));
              imageProvider.value = FileImage(File(file.path));
            }
          },
          child: const Text("Choose Image"),
        )
      ],
    );
  }
}
