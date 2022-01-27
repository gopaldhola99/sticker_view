# sticker_view

A Flutter plugin to rotate, resize, move, delete any text, image or any other widget.

![](https://github.com/gopaldhola99/sticker_view/blob/main/example/assets/sticker_view.gif)

<br>

## Available Features


✅ &nbsp; Rotate </br>
✅ &nbsp; Resize</br>
✅ &nbsp; Move</br>
✅ &nbsp; Layer Update (Change Stack position)</br>
✅ &nbsp; Delete 
<br>
<br>

## :rocket: Installation

This plugin is available on Pub: [https://pub.dev/packages/sticker_view](https://pub.dev/packages/sticker_view)

Add this to `dependencies` in your app's `pubspec.yaml`

```yaml
sticker_view : latest_version
```

## :bookmark: Usage

Sample code to integrate can be found in [example/lib/main.dart](example/lib/main.dart).

#### Integrate sticker_view

```dart
 StickerView(
            // List of Stickers
            stickerList: [
              Sticker(
                // You can give any widget as it's child
                child: Image.network(
                    "https://tinyurl.com/48ne4wj5"),
                // Must have unique id for every Sticker
                id: "uniqueId_111",
              ),
              Sticker(
                child: const Text("Hello"),
                id: "uniqueId_222",
                isText: true,
              ),
            ],
          ),
```

#### Save StickerView as Uint8List

```dart
  // Give the Image Quality (High, Medium, Low)
  await StickerView.saveAsUint8List(ImageQuality.high);
```





***

### :heart:  Found this project useful?

If you found this project useful, then please consider giving it a :star:  on Github and sharing it with your friends via social media.

=======


<br>
****
## :🪄: Contributing, :disappointed: Issues and :bug: Bug Reports
>>>>>>> 8deb8d8fd1809d7a6a317c1ab8975edeb54d8d75
The project is open to public contribution. Please feel very free to contribute.
Experienced an issue or want to report a bug? Please, [report it here](https://github.com/gopaldhola99/sticker_view/issues). Remember to be as descriptive as possible.

