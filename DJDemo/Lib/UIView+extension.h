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






#pragma mark - setup
@property (nonatomic, strong) UICollectionView *collectionView;
- (void)setupCollectionViewWithCell:(Class)class cellID:(NSString *)cellID;


#pragma mark - getter view
- (UIView *)myView;
- (UILabel *)myLabel;
- (UIButton *)myButton;
- (UIImageView *)myImageView
;
- (UIStackView *)myStackView;
- (UIStackView *)myStackViewOfVertical;
- (UIStackView *)myStackViewOfHorizontal;

//textFiled
- (UITextField *)myTextFiledWithHolder:(NSString *)str fontNum:(int)Num textColor:(UIColor *)color borderStyle:(UITextBorderStyle )style;
- (UITextField *)myTextFiledWithHolder:(NSString *)str fontNum:(int)Num borderStyle:(UITextBorderStyle )style;

//label
- (UILabel *)myLabelWithText:(NSString *)text;
- (UILabel *)myLabelWithText:(NSString *)text fontNum:(int)num;
- (UILabel *)myLabelWithText:(NSString *)text fontNum:(int)num textColor:(UIColor *) color;
- (UILabel *)myLabelWithText:(NSString *)text fontNum:(int)num alignment:(NSTextAlignment) alignment textColor:(UIColor *) color;

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
