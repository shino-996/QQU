//
//  QQUnRecall.m
//  QQUnRecall
//
//  Created by shino on 2017/11/29.
//  Copyright © 2017年 shino. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
void handleRecallNotifyIsOnline(id _i, SEL _s, void * _p, BOOL _b) {
    NSLog(@"已经阻止 QQ 撤回一条消息");
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
static void __attribute__((constructor)) initialize(void) {
    method_setImplementation(
        class_getInstanceMethod(
            NSClassFromString(@"QQMessageRevokeEngine"),
            @selector(handleRecallNotify:isOnline:)
        ),
        (IMP)&handleRecallNotifyIsOnline
    );
}
#pragma clang diagnostic pop
