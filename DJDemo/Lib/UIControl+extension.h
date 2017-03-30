//
//  UIControl+extension.h
//  chaLingPengHu
//
//  Created by 段自强 on 2017/1/6.
//  Copyright © 2017年 DJ. All rights reserved.
//

@class RACSignal;
@class RACDisposable;

#import <UIKit/UIKit.h>
@interface UIControl (extension)
- (RACDisposable *)rac_getTouchEventWithBlock:(void(^)(id x)) block;

- (RACDisposable *)rac_signalTouchUpInsideWithBlock:(void(^)(id x)) block;
@end
