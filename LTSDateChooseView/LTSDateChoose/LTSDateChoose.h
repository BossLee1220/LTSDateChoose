//
//  LTSDateChoose.h
//  SAIFAMC
//
//  Created by 李棠松 on 16/9/10.
//  Copyright © 2016年 leetangsong. All rights reserved.
//

#import "LTSBaseAlertView.h"

@class LTSDateChoose;
@protocol LTSDateChooseDelegate <NSObject>



/**
 当时间改变时触发

 @param choose LTSDateChoose
 @param date 选择的日期
 */
- (void)changeTime:(LTSDateChoose *)choose date:(NSDate *)date;

/**
 点击确定按钮

 @param choose LTSDateChoose
 @param date 选择的日期
 */
- (void)determine:(LTSDateChoose *)choose date:(NSDate *)date;

@end

@interface LTSDateChoose : LTSBaseAlertView
//初始化方法
- (instancetype)initWithType:(UIDatePickerMode)type title:(NSString *)title;
//设置初始时间
- (void)setNowTime:(NSDate *)date;

@property (nonatomic,strong)UIDatePicker *dateP;

// NSDate --> NSString
- (NSString*)stringFromDate:(NSDate*)date;
//NSDate <-- NSString
- (NSDate*)dateFromString:(NSString*)dateString;

@property (nonatomic,assign)BOOL dateError;

@property (nonatomic,strong)NSString *title;

@property (assign,nonatomic)id<LTSDateChooseDelegate>delegate;
@end
