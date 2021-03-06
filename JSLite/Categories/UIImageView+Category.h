//
//  UIImageView+Category.h
//  JSLite
//
//  Created by 章力 on 15/7/8.
//  Copyright (c) 2015年 Juicyshare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Category)
+ (id) imageViewWithImageNamed:(NSString*)imageName;
+ (id) imageViewWithFrame:(CGRect)frame;
+ (id) imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame;

- (void) setImageWithStretchableImage:(NSString*)imageName;

// 画水印
// 图片水印
- (void) setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
// 文字水印
- (void) setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
- (void) setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;
@end
