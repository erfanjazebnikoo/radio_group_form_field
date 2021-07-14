#import "RadioGroupFormFieldPlugin.h"
#if __has_include(<radio_group_form_field/radio_group_form_field-Swift.h>)
#import <radio_group_form_field/radio_group_form_field-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "radio_group_form_field-Swift.h"
#endif

@implementation RadioGroupFormFieldPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftRadioGroupFormFieldPlugin registerWithRegistrar:registrar];
}
@end
