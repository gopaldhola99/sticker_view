#import "StickerViewPlugin.h"
#if __has_include(<sticker_view/sticker_view-Swift.h>)
#import <sticker_view/sticker_view-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sticker_view-Swift.h"
#endif

@implementation StickerViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftStickerViewPlugin registerWithRegistrar:registrar];
}
@end
