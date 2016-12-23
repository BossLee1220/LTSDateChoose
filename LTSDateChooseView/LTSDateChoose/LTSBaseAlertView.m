//
//  UCBaseAlertView.m
//  Ucheer
//
//  Created by leetangsong_macbk on 16/7/27.
//  Copyright © 2016年 HuikeSpace. All rights reserved.
//

#import "LTSBaseAlertView.h"


@interface LTSBaseAlertView()


@property (nonatomic,strong)UITapGestureRecognizer *tap;

@end
@implementation LTSBaseAlertView




- (instancetype)init
{
    
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    _alertWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _alertWindow.windowLevel = UIWindowLevelAlert;
    self.frame = _alertWindow.bounds;
   
    //添加 底部遮罩
    _backgroundView = [[UIView alloc]initWithFrame:_alertWindow.bounds];
   
    _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.25];
    [self addSubview:_backgroundView];
    [self setUserInteractionEnabled:YES];
    [self setMultipleTouchEnabled:NO];
    [self.backgroundView setUserInteractionEnabled:YES];
    [self.backgroundView setMultipleTouchEnabled:NO];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    self.tap = tap;
    [_backgroundView addGestureRecognizer:tap];
    
   


}


- (void)showWithAnimation:(BOOL)animation{

    [_alertWindow addSubview:self];
    [_alertWindow makeKeyAndVisible];
    
    if (animation) {
        CAKeyframeAnimation *animat = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
        
        animat .values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1)],
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05, 1.05, 1)],
                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1)]];
        animat.keyTimes = @[ @0, @0.5, @1 ];
        animat.fillMode = kCAFillModeForwards;
        animat.removedOnCompletion = NO;
        animat.duration = .3;
        
        [self.alertView.layer addAnimation:animat forKey:@"showAlert"];
    }
    [UIView animateWithDuration:0.15 animations:^{
       _backgroundView.alpha = 1;
    }];
}

- (void)dismissWithAnimation:(BOOL)animation{
    
   
    
        [self  removeFromSuperview];
    
    
        [UIView animateWithDuration:0.15 animations:^{
            _backgroundView.alpha = 0;
        } completion:^(BOOL finished) {
            self.alertView = nil;
            self.alertWindow = nil;
            self.backgroundView = nil;
        }];
   
    
    
    

}

- (void)setHideTapHidden:(BOOL)hideTapHidden{
    _hideTapHidden = hideTapHidden;
    if (hideTapHidden) {
        [_backgroundView removeGestureRecognizer:self.tap];
    }
}

- (void)setAlertView:(UIView *)alertView{
    _alertView = alertView;
    [self addSubview:alertView];
    _alertView.center = CGPointMake(_alertWindow.center.x, _alertWindow.center.y);
}

- (void)tap:(UITapGestureRecognizer *)tap{
    
    [self  dismissWithAnimation:NO];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

