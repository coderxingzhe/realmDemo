//
//  UIViiew+extension.h
//  chaLingPengHu
//
//  Created by 段自强 on 2016/12/20.
//  Copyright © 2016年 DJ. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

typedef void(^doNextBlock)(UIView *view);
typedef void(^clickBlockType)(UIView *view);

@interface UIView (extension)
@property (nonatomic, strong) NSString *myTag;



#pragma mark init
- (void)setting;
- (void)addChildViews;


#pragma mark - action
@property (nonatomic, copy) void(^clickBlock)(UIView *view);
- (void)addTaperWithBlock:(doNextBlock)nextBlock;
- (void)tapAction:(id)obj; 





#pragma mark - getter view


#pragma mark - getter frame
@property CGFloat myWidth;
@property CGFloat myHeight;
@property CGFloat myX;
@property CGFloat myY;
@property CGFloat dj_centerX;
@property CGFloat dj_centerY;
@property CGFloat dj_screenW;
@property CGFloat dj_screenH;
@property CGFloat dj_maxX;
@property CGFloat dj_maxY;


//一些宏
#define djScreenW [UIScreen mainScreen].bounds.size.width
#define djScreenH [UIScreen mainScreen].bounds.size.height
#define djScreenSize [UIScreen mainScreen].bounds.size
@end
