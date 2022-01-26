import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'draggable_stickers.dart';

enum ImageQuality { low, medium, high }

///
/// StickerView
/// A Flutter widget that can rotate, resize, edit and manage layers of widgets.
/// You can pass any widget to it as Sticker's child
///
class StickerView extends StatefulWidget {
  final List<Sticker>? stickerList;
  final double? height; // height of the editor view
  final double? width; // width of the editor view

  // ignore: use_key_in_widget_constructors
  const StickerView({this.stickerList, this.height, this.width});

  // Method for saving image of the editor view as Uint8List
  // You have to pass the imageQuality as per your requirement (ImageQuality.low, ImageQuality.medium or ImageQuality.high)
  static Future<Uint8List?> saveAsUint8List(ImageQuality imageQuality) async {
    try {
      Uint8List? pngBytes;
      double pixelRatio = 1;
      if (imageQuality == ImageQuality.high) {
        pixelRatio = 2;
      } else if (imageQuality == ImageQuality.low) {
        pixelRatio = 0.5;
      }
      // delayed by few seconds because it takes some time to update the state by RenderRepaintBoundary
      await Future.delayed(const Duration(milliseconds: 700))
          .then((value) async {
        RenderRepaintBoundary boundary = stickGlobalKey.currentContext
            ?.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: pixelRatio);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        pngBytes = byteData?.buffer.asUint8List();
      });
      // returns Uint8List
      return pngBytes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  StickerViewState createState() => StickerViewState();
}

//GlobalKey is defined for capturing screenshot
final GlobalKey stickGlobalKey = GlobalKey();

class StickerViewState extends State<StickerView> {
  // You have to pass the List of Sticker
  List<Sticker>? stickerList;

  @override
  void initState() {
    setState(() {
      stickerList = widget.stickerList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return stickerList != null
        ? Column(
            children: [
              //For capturing screenshot of the widget
              RepaintBoundary(
                key: stickGlobalKey,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  height:
                      widget.height ?? MediaQuery.of(context).size.height * 0.7,
                  width: widget.width ?? MediaQuery.of(context).size.width,
                  child:
                      //DraggableStickers class in which stickerList is passed
                      DraggableStickers(
                    stickerList: stickerList,
                  ),
                ),
              ),
            ],
          )
        : const CircularProgressIndicator();
  }
}

// Sticker class

// ignore: must_be_immutable
class Sticker extends StatefulWidget {
  // you can pass any widget to it as child
  Widget? child;
  // set isText to true if passed Text widget as child
  bool? isText = false;
  // every sticker must be assigned with unique id
  String id;
  Sticker({Key? key, this.child, this.isText, required this.id})
      : super(key: key);
  @override
  _StickerState createState() => _StickerState();
}

class _StickerState extends State<Sticker> {
  @override
  Widget build(BuildContext context) {
    return widget.child != null ? widget.child! : Container();
  }
}
