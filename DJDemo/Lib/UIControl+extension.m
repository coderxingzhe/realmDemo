//
//  UIControl+extension.m
//  chaLingPengHu
//
//  Created by 段自强 on 2017/1/6.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "UIControl+extension.h"

@implementation UIControl (extension)

//pack rac
//- (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock

- (RACDisposable *)rac_getTouchEventWithBlock:(void(^)(id x)) block
{
    return  [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:block];
}


- (RACDisposable *)rac_signalTouchUpInsideWithBlock:(void(^)(id x)) block
{
   return nil;
   //return  [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:block];
}

@end
