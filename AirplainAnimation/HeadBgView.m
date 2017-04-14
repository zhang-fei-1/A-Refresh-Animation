//
//  HeadBgView.m
//  AirplainAnimation
//
//  Created by QingFengiOS_1 on 17/4/13.
//  Copyright © 2017年 QingFengiOS_1. All rights reserved.
//

#import "HeadBgView.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface HeadBgView()<CAAnimationDelegate>

@property (nonatomic, assign, readwrite) BOOL allowFly;

@end

@implementation HeadBgView

- (instancetype)init {

    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self UIConfig];
        self.allowFly = YES;
    }
    
    return self;
}

- (void)UIConfig {

    self.backgroundColor = [UIColor whiteColor];
    
    self.bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg1.jpg"]];
    
    self.bgImageView.frame = self.bounds;
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"air.png"]];
    
    self.imageView.frame = CGRectMake(10, 160, 40, 40);
    
    [self addSubview:self.bgImageView];
    
    [self insertSubview:self.imageView aboveSubview:self.bgImageView];
    
}

- (void)starAnimation {
    
    if (!self.allowFly) {
        
        return;
    }
    
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    
    [bezierPath moveToPoint:self.imageView.center];
    
    [bezierPath addQuadCurveToPoint:CGPointMake(150, 90) controlPoint:CGPointMake(230, 150)];
    
    [bezierPath addQuadCurveToPoint:CGPointMake(150, 150) controlPoint:CGPointMake(50, 120)];
    
    [bezierPath addQuadCurveToPoint:CGPointMake(kWidth, 0) controlPoint:CGPointMake(190, 150)];
    
    //    [bezierPath addLineToPoint:self.imageView.layer.position];
    
    //路线描绘
//    CAShapeLayer *pathLayer = [CAShapeLayer layer];
//    
//    pathLayer.path = bezierPath.CGPath;
//    
//    pathLayer.fillColor = [UIColor clearColor].CGColor;
//    
//    pathLayer.strokeColor = [UIColor grayColor].CGColor;
//    
//    pathLayer.lineWidth = 3.0f;
//    
//    [self.layer addSublayer:pathLayer];
    
//    self.imageView.layer.frame = CGRectMake(10, 180, 40, 40);
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.keyPath = @"position";
    
    animation.delegate = self;
    
    animation.duration = 3.0;
    
    animation.path = bezierPath.CGPath;
    
    [self.imageView.layer addAnimation:animation forKey:nil];
    
}

- (void)animationDidStart:(CAAnimation *)anim {

    self.allowFly = NO;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
   
    
    self.imageView.frame = CGRectMake(-50, 160, 40, 40);
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.imageView.frame = CGRectMake(10, 160, 40, 40);
    
    } completion:^(BOOL finished) {
    
        self.allowFly = YES;
        
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
