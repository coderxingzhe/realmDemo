//
//  UIViiew+extension.m
//  chaLingPengHu
//  Created by 段自强 on 2016/12/20.
//  Copyright © 2016年 DJ. All rights reserved.

#import "UIView+extension.h"
#import <objc/runtime.h>



@interface UIView()

@property (nonatomic, copy) doNextBlock block;
@end

@implementation UIView (extension)


- (doNextBlock)block
{
    return objc_getAssociatedObject(self, @selector(block));
}

- (void)setBlock:(doNextBlock)block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

//init 
- (void)setting
{
    
}

//监听
- (void)addTaperWithBlock:(doNextBlock)nextBlock
{
    UITapGestureRecognizer *taper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction: )];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:taper];
    self.block = nextBlock;
}

- (void)tapAction:(id)obj
{
    UITapGestureRecognizer *tab = (UITapGestureRecognizer *)obj;
    if (self.block)
    {
        self.block(tab.view);
    }
    
}

- (void)addChildViews
{
    
}

- (void)setDebugColor
{
    self.backgroundColor = [UIColor lightGrayColor];
    
}

- (NSString *)myTag
{
    return objc_getAssociatedObject(self, @selector(enterOrder));
}

- (void)setMyTag:(NSString *)value {
    objc_setAssociatedObject(self, @selector(enterOrder), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)moveTimeViewToUser:(int)userTag
{
    if (userTag == 0) //我
    {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(180);
            make.centerY.mas_equalTo(50);
            make.width.height.mas_equalTo(30);
        }];
    }else if (userTag == 1) //我
    {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(180);
            make.centerY.mas_equalTo(-50);
            make.width.height.mas_equalTo(30);
        }];
    }else if (userTag == 2) //我
    {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(-180);
            make.centerY.mas_equalTo(-50);
            make.width.height.mas_equalTo(30);
        }];
    }else if (userTag == 3) //我
    {
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(-180);
            make.centerY.mas_equalTo(50);
            make.width.height.mas_equalTo(30);
        }];
    }
}

#pragma mark -setup
- (void)setupCollectionViewWithCell:(Class)class cellID:(NSString *)cellID
{
    //tableView
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    
    [self.collectionView registerClass:class forCellWithReuseIdentifier:cellID];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (UICollectionView *)collectionView
{
    return objc_getAssociatedObject(self, @selector(collectionView));
}
- (void)setCollectionView:(UICollectionView *)collectionView
{
    objc_setAssociatedObject(self, @selector(collectionView), collectionView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



#pragma mark - getter view
- (UIView *)myView
{
    UIView *myView = [[UIView alloc] init];
    [self addSubview:myView];
    return myView;
}

- (UIStackView *)myStackView
{
    UIStackView *stackView = [UIStackView new];
    [self addSubview:stackView];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 10;
    return stackView;
}


- (UIStackView *)myStackViewOfHorizontal
{
    UIStackView *stackView = [self myStackView];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    return stackView;
}

- (UIStackView *)myStackViewOfVertical
{
    return [self myStackView];
}

- (UIImageView *)myImageView
{
    UIImageView *imgView = [UIImageView new];
    [self addSubview:imgView];
    return imgView;
}
- (UIButton *)myButton
{
    UIButton *btn = [UIButton new];
    [self addSubview:btn];
    [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    return btn;
}

- (UITextField *)myTextFiledWithHolder:(NSString *)str fontNum:(int)Num borderStyle:(UITextBorderStyle )style
{
    return [self myTextFiledWithHolder:str fontNum:Num textColor:[UIColor blackColor] borderStyle:style];
}

- (UITextField *)myTextFiledWithHolder:(NSString *)str fontNum:(int)Num textColor:(UIColor *)color borderStyle:(UITextBorderStyle )style
{
    UITextField *filed = [UITextField new];
    [self addSubview:filed];
    filed.placeholder = str;
    filed.font = [UIFont systemFontOfSize:Num];
    filed.textColor = color;
    filed.borderStyle = style;
    return filed;
}

- (UILabel *)myLabel
{
   return [self myLabelWithText:nil fontNum:14 alignment:NSTextAlignmentCenter textColor:[UIColor blackColor]];
}

- (UILabel *)myLabelWithText:(NSString *)text
{
   return [self myLabelWithText:text fontNum:14 alignment:NSTextAlignmentCenter textColor:[UIColor blackColor]];
}
- (UILabel *)myLabelWithText:(NSString *)text fontNum:(int)num
{
    return [self myLabelWithText:text fontNum:14 alignment:NSTextAlignmentCenter textColor:[UIColor blackColor]];
}
- (UILabel *)myLabelWithText:(NSString *)text fontNum:(int)num alignment:(NSTextAlignment) alignment textColor:(UIColor *) color
{
    UILabel *label = [UILabel new];
    [self addSubview:label];
    label.text = text;
    label.textAlignment = alignment;
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:num];
    label.textColor = color;
    return label;
}







#pragma mark - getter frame
//宽度
- (CGFloat)myWidth {
    return self.frame.size.width;
}

- (void)setMyWidth:(CGFloat)myWidth
{
    CGRect frame = self.frame;
    frame.size.width = myWidth;
    self.frame = frame;
}



//高度
- (CGFloat)myHeight {
    return self.frame.size.height;
}

- (void)setMyHeight:(CGFloat)myHeight
{
    CGRect frame = self.frame;
    frame.size.height = myHeight;
    self.frame = frame;
}


//x值,y值
- (CGFloat)dj_x {
    return self.frame.origin.x;
}

- (void)setDj_x:(CGFloat)dj_x {
    CGRect frame = self.frame;
    frame.origin.x = dj_x;
    self.frame = frame;
}
- (CGFloat)dj_y {
    return self.frame.origin.y;
}

- (void)setDj_y:(CGFloat)dj_y {
    CGRect frame = self.frame;
    frame.origin.y = dj_y;
    self.frame = frame;
}
//x,y的最大值
- (CGFloat)dj_maxX {
    return self.frame.origin.x + self.frame.size.width;
}
- (CGFloat)dj_maxY {
    return self.frame.origin.y + self.frame.size.height;
}

//中心X
- (CGFloat)dj_centerX {
    return self.center.x;
}

- (void)setDj_centerX:(CGFloat)dj_centerX {
    CGPoint center = self.center;
    center.x = dj_centerX;
    self.center = center;
}

//中心Y
- (CGFloat)dj_centerY {
    return self.center.y;
}

- (void)setDj_centerY:(CGFloat)dj_centerY {
    CGPoint center = self.center;
    center.y = dj_centerY;
    self.center = center;
    
}



//屏幕H
- (CGFloat)dj_screenH
{
    return [UIScreen mainScreen].bounds.size.height;
}

//屏幕W
- (CGFloat)dj_screenW
{
    return [UIScreen mainScreen].bounds.size.width;
}

#pragma mark - runtime
- (void(^)(UIView *view))clickBlock
{
    return objc_getAssociatedObject(self, @selector(clickBlock));
}

- (void)setClickBlock:(void(^)(UIView *view))clickBlock
{
    objc_setAssociatedObject(self, @selector(clickBlock), clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
