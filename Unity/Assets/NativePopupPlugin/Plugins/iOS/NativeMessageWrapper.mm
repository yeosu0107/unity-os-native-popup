
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NativePopup/NativePopup-Swift.h"
//#import "IOSNativePlugin/IOSNativePlugin-Swift.h"

extern void UnitySendMessage(const char *, const char *, const char *);
//extern UIViewController *UnityGetGLViewController();

static const char* _nativeMessageObjectName = "NativeMessageObject";

@interface NativePopupBridge: NSObject<NativePopupProtocol>
@end

@implementation NativePopupBridge

- (void)OnOK {
    UnitySendMessage(_nativeMessageObjectName, [@"OnOk" UTF8String], [@"Ok" UTF8String]);
}

- (void)OnCancel {
    UnitySendMessage(_nativeMessageObjectName, [@"OnCancel" UTF8String], [@"Cancel" UTF8String]);
}

@end

extern "C" {
    void _init() {
    }
    /*
    void _ShowAlertOneButton(const char* title, const char* message, const char* ok) {
        NativePopupManager* nativePopupMgr = [NativePopupManager alloc];
        NativePopupBridge* bridgeDelegate = [NativePopupBridge alloc];
        
        [nativePopupMgr showAlertWithTitle:[NSString stringWithUTF8String:title] message:[NSString stringWithUTF8String:message] ok:[NSString stringWithUTF8String:ok] delegate:bridgeDelegate];
    }
    */
    
    void _ShowAlertTwoButton(const char* title, const char* message, const char* ok, const char* cancel) {
        NativePopupManager* nativePopupMgr = [NativePopupManager alloc];
        NativePopupBridge* bridgeDelegate = [NativePopupBridge alloc];
        
        [nativePopupMgr showAlertWithTitle:[NSString stringWithUTF8String:title] message:[NSString stringWithUTF8String:message] ok:[NSString stringWithUTF8String:ok] cancel:[NSString stringWithUTF8String:cancel] delegate:bridgeDelegate];
    }
    
    void _ShowToast(const char* message, double duration) {
        NativePopupManager* nativePopupMgr = [NativePopupManager alloc];
        [nativePopupMgr showToastWithMessage:[NSString stringWithUTF8String:message] duration:duration];
    }
}


/*
@interface NativeMessageBridge : NSObject<NativeMessageProtocol>

@end

@implementation NativeMessageBridge

static NativeMessageBridge* _nativeMessageBridge = [NativeMessageBridge alloc];

- (void)OnOk {
    //NSLog(@"OnOK");
    UnitySendMessage(_nativeMessageObjectName, [@"OnOk" UTF8String], [@"Ok" UTF8String]);
}

- (void)OnCancel {
    //NSLog(@"OnCancel");
    UnitySendMessage(_nativeMessageObjectName, [@"OnCancel" UTF8String], [@"Cancel" UTF8String]);
}

@end

extern "C" {
    void _init() {
        [[NativeMessage getInstance] initializeWithVc:UnityGetGLViewController() delegate:_nativeMessageBridge];
    }

    void _ShowAlertOneButton(const char* title, const char* message, const char* ok) {
        [[NativeMessage getInstance] showAlertWithTitle:[NSString stringWithUTF8String:title]
                                                message:[NSString stringWithUTF8String:message]
                                                     ok:[NSString stringWithUTF8String:ok]];
    }

    void _ShowAlertTwoButton(const char* title, const char* message, const char* ok, const char* cancel) {
        [[NativeMessage getInstance] showAlertWithTitle:[NSString stringWithUTF8String:title]
                                                message:[NSString stringWithUTF8String:message]
                                                     ok:[NSString stringWithUTF8String:ok]
                                                 cancel:[NSString stringWithUTF8String:cancel]];
    }

    void _ShowToast(const char* message, double duration) {
        [[NativeMessage getInstance] showToastWithMessage:[NSString stringWithUTF8String:message]
                                                 duration:duration];
    }
}
*/
