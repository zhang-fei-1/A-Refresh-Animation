//
//  HeadBgView.h
//  AirplainAnimation
//
//  Created by QingFengiOS_1 on 17/4/13.
//  Copyright © 2017年 QingFengiOS_1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeadBgView : UIView

//背景图
@property (nonatomic, strong) UIImageView *bgImageView;

//飞机图片
@property (nonatomic, strong) UIImageView *imageView;

- (void)starAnimation;

@end
