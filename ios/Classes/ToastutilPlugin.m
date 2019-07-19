#import "ToastutilPlugin.h"
#import "WHToast.h"

@implementation ToastutilPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"toastutil"
            binaryMessenger:[registrar messenger]];
  ToastutilPlugin* instance = [[ToastutilPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if([call.method isEqualToString : @"showMsg"]){
    [self showToast:call.arguments[@"msg"]];
  }else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)showToast:(NSString *)msg{
    [WHToast showMessage:msg originY:2000 duration:2 finishHandler:^{
        
    }];
}

@end
