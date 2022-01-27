import 'package:flutter/material.dart';
import 'draggable_resizable.dart';
import 'stickerview.dart';

class DraggableStickers extends StatefulWidget {
  //List of stickers (elements)
  final List<Sticker>? stickerList;

  // ignore: use_key_in_widget_constructors
  const DraggableStickers({this.stickerList});
  @override
  State<DraggableStickers> createState() => _DraggableStickersState();
}

String? selectedAssetId;

class _DraggableStickersState extends State<DraggableStickers> {
  // initial scale of sticker
  final _initialStickerScale = 5.0;

  List<Sticker> stickers = [];
  @override
  void initState() {
    setState(() {
      stickers = widget.stickerList ?? [];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return stickers.isNotEmpty && stickers != []
        ? Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: GestureDetector(
                  key: const Key('stickersView_background_gestureDetector'),
                  onTap: () {},
                ),
              ),
              for (final sticker in stickers)

                // Main widget that handles all features like rotate, resize, edit, delete, layer update etc.
                DraggableResizable(
                  key:
                      Key('stickerPage_${sticker.id}_draggableResizable_asset'),
                  canTransform: selectedAssetId == sticker.id ? true : false

                  //  true
                  /*sticker.id == state.selectedAssetId*/,
                  onUpdate: (update) => {},

                  // To update the layer (manage position of widget in stack)
                  onLayerTapped: () {
                    var listLength = stickers.length;
                    var ind = stickers.indexOf(sticker);
                    stickers.remove(sticker);
                    if (ind == listLength - 1) {
                      stickers.insert(0, sticker);
                    } else {
                      stickers.insert(listLength - 1, sticker);
                    }

                    selectedAssetId = sticker.id;
                    setState(() {});
                  },

                  // To edit (Not implemented yet)
                  onEdit: () {},

                  // To Delete the sticker
                  onDelete: () async {
                    {
                      stickers.remove(sticker);
                      setState(() {});
                    }
                  },

                  // Size of the sticker
                  size: sticker.isText == true
                      ? Size(64 * _initialStickerScale / 3,
                          64 * _initialStickerScale / 3)
                      : Size(
                          64 * _initialStickerScale, 64 * _initialStickerScale),

                  // Constraints of the sticker
                  constraints: sticker.isText == true
                      ? BoxConstraints.tight(
                          Size(
                            64 * _initialStickerScale / 3,
                            64 * _initialStickerScale / 3,
                          ),
                        )
                      : BoxConstraints.tight(
                          Size(
                            64 * _initialStickerScale,
                            64 * _initialStickerScale,
                          ),
                        ),

                  // Child widget in which sticker is passed
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      // To update the selected widget
                      selectedAssetId = sticker.id;
                      setState(() {});
                    },
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: sticker.isText == true
                          ? FittedBox(child: sticker)
                          : sticker,
                    ),
                  ),
                ),
            ],
          )
        : Container();
  }
}
