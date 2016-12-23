//
//  LTSDateChoose.m
//  SAIFAMC
//
//  Created by 李棠松 on 16/9/10.
//  Copyright © 2016年 leetangsong. All rights reserved.
//

#import "LTSDateChoose.h"

#define kDatePicHeight 180

#define kDateBtnHeight 45

#define lineColor  [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1]

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LTSDateChoose()


@property (nonatomic,strong)UIButton *leftBtn;
@property (nonatomic,strong)UIButton *rightBtn;

@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,assign)UIDatePickerMode type;


@end

@implementation LTSDateChoose
- (instancetype)initWithType:(UIDatePickerMode)type title:(NSString *)title{
    self = [super init];
    if (self) {
        self.type = type;
        self.title = title;
        [self addUI];
        
       
    }
    return self;
}

- (void)addUI{
    
    self.alertView = [UIView new];
    self.alertView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, kDateBtnHeight*2 + kDatePicHeight);
    [self.topView addSubview:self.titleLabel];
    
    [self.alertView addSubview:self.dateP];
    
    [self.alertView addSubview:self.leftBtn];
    [self.alertView addSubview:self.rightBtn];
    [self.alertView addSubview:self.topView];
    
    
    if (self.title.length) {
        UIView *view = [UIView new];
        view.backgroundColor  = lineColor;
        [self.alertView addSubview:view];
        view.frame = CGRectMake(0, kDateBtnHeight, SCREEN_WIDTH, 0.5);
        
    }
    
    {
        UIView *view = [UIView new];
        view.backgroundColor  = lineColor;
        [self.alertView addSubview:view];
        view.frame = CGRectMake(0, CGRectGetMaxY(self.dateP.frame), SCREEN_WIDTH, 0.5);
    }
    
    {
        
        
        UIView *view = [UIView new];
        view.backgroundColor  = lineColor;
        [self.alertView addSubview:view];
        view.frame = CGRectMake(CGRectGetMaxX(self.leftBtn.frame), CGRectGetMaxY(self.dateP.frame), 0.5, kDateBtnHeight);
        
    }
    
    
    
}

- (UIDatePicker *)dateP{
    if (!_dateP) {
        _dateP = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, kDateBtnHeight, SCREEN_WIDTH, kDatePicHeight)];
        _dateP.backgroundColor = [UIColor whiteColor];
        
        _dateP.datePickerMode = self.type;
       _dateP.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CHS_CN"];
        //        NSDate *maxDate = [NSDate date];
        //        self.dateP.maximumDate = maxDate;
        [self.dateP addTarget:self action:@selector(handleDateP:) forControlEvents:UIControlEventValueChanged];
    }
    return _dateP;
}



- (UIButton *)leftBtn{
    if (!_leftBtn) {
        self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.leftBtn.frame = CGRectMake(0,CGRectGetHeight(self.alertView.frame)-kDateBtnHeight , SCREEN_WIDTH/2, kDateBtnHeight);
        [self.leftBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.leftBtn addTarget:self action:@selector(handleDateTopViewLeft) forControlEvents:UIControlEventTouchUpInside];
        self.leftBtn.backgroundColor = [UIColor whiteColor];
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.rightBtn.frame = CGRectMake(SCREEN_WIDTH/2,CGRectGetHeight(self.alertView.frame)-kDateBtnHeight , SCREEN_WIDTH/2, kDateBtnHeight);
        [self.rightBtn setTitleColor:[UIColor colorWithRed:0 green:122/255.0 blue:1 alpha:1] forState:UIControlStateNormal];
        [self.rightBtn setTitle:@"确定" forState:UIControlStateNormal];
        
        [self.rightBtn addTarget:self action:@selector(handleDateTopViewRight) forControlEvents:UIControlEventTouchUpInside];
        self.rightBtn.backgroundColor = [UIColor whiteColor];
    }
    return _rightBtn;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.frame = CGRectMake(10, 0, SCREEN_WIDTH, kDateBtnHeight);
        _titleLabel.text = self.title;
        
    }
    return _titleLabel;
    
}


- (UIView *)topView{
    if (!_topView) {
        _topView =[UIView new];
        _topView.backgroundColor = [UIColor whiteColor];
        _topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kDateBtnHeight);
        if (!self.title.length) {
            _topView.hidden = YES;
        }
        
    }
    return _topView;
}

- (void)setNowTime:(NSDate *)date{
    
    
    [self.dateP setDate:date animated:YES];
}

- (void)end{
    [self removeFromSuperview];
}

- (void)showWithAnimation:(BOOL)animation{
    [self.alertWindow addSubview:self];
    [self.alertWindow makeKeyAndVisible];
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundView.alpha = 1;
        CGRect frame = self.alertView.frame;
        frame.origin.y = SCREEN_HEIGHT - kDatePicHeight -2*kDateBtnHeight;
        self.alertView.frame = frame;
        
    }];
    
}
- (void)dismissWithAnimation:(BOOL)animation{
    
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundView.alpha = 0;
        CGRect frame = self.alertView.frame;
        frame.origin.y = SCREEN_HEIGHT;
        self.alertView.frame = frame;
        
    }  completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)handleDateP :(NSDate *)date {
    if ([self.delegate respondsToSelector:@selector(changeTime:date:)]) {
        [self.delegate changeTime:self date:self.dateP.date];
    }
    
    
}

- (void)handleDateTopViewLeft {
    [self dismissWithAnimation:YES];
}

- (void)handleDateTopViewRight {
    if ([self.delegate respondsToSelector:@selector(determine:date:)]) {
        [self.delegate determine:self date:self.dateP.date];
        
    }
    if (!self.dateError) {
        [self dismissWithAnimation:YES];
    }
    
}



// NSDate --> NSString
- (NSString*)stringFromDate:(NSDate*)date{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (self.type) {
        case UIDatePickerModeTime:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case UIDatePickerModeDate:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case UIDatePickerModeDateAndTime:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        case UIDatePickerModeCountDownTimer:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        default:
            break;
    }
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    return destDateString;
    
}

//NSDate <-- NSString
- (NSDate*)dateFromString:(NSString*)dateString{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    switch (self.type) {
        case UIDatePickerModeTime:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        case UIDatePickerModeDate:
            [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            break;
        case UIDatePickerModeDateAndTime:
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            break;
        case UIDatePickerModeCountDownTimer:
            [dateFormatter setDateFormat:@"HH:mm"];
            break;
        default:
            break;
    }
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    
    return destDate;
}


@end
