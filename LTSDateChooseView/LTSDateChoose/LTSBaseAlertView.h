//
//  LTSBaseAlertView.h
//  SAIFAMC
//
//  Created by leetangsong_macbk on 16/7/27.
//  Copyright © 2016年 HuikeSpace. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTSAlertAction;

@interface LTSBaseAlertView : UIView

@property (nonatomic,strong)UIWindow *alertWindow;

@property (nonatomic,strong)UIView *alertView;

@property (nonatomic,strong)UIView *backgroundView;


@property (nonatomic,assign)BOOL hideTapHidden;







- (void)showWithAnimation:(BOOL)animation;

- (void)dismissWithAnimation:(BOOL)animation;


- (void)initUI;
@end



