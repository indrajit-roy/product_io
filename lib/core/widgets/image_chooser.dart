import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class ImageChooser extends StatefulWidget {
  final double? height;
  final double? width;
  const ImageChooser({Key? key, this.height, this.width}) : super(key: key);

  @override
  _ImageChooserState createState() => _ImageChooserState();
}

class _ImageChooserState extends State<ImageChooser> {
  late BehaviorSubject<ImageProvider> imageProvider;
  @override
  void initState() {
    imageProvider = BehaviorSubject<ImageProvider>();
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
      children: [
        StreamBuilder<ImageProvider>(
            stream: imageProvider,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Image(
                  image: snapshot.data!,
                  height: widget.height,
                  width: widget.width,
                );
              }
              return const SizedBox();
            }),
        ElevatedButton(onPressed: () {}, child: const Text("Choose Image"))
      ],
    );
  }
}
