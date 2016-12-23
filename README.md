# LTSDateChooseView
一个简单使用的日期选择控件!
![image](https://github.com/BossLee1220/LTSDateChoose/blob/master/date.gif)
##使用方法
    
    //样式
    
    UIDatePickerMode mode = UIDatePickerModeTime;
    
    LTSDateChoose *dateChoose =  [[LTSDateChoose alloc]initWithType:mode title:@"日期选择"];
    
    [dateChoose setNowTime:[NSDate date]];
    
    dateChoose.delegate = self;
    
    [dateChoose showWithAnimation:YES];
###实现代理方法
    
    /**
     当时间改变时触发

     @param choose LTSDateChoose
     @param date 选择的日期
     */
     - (void)changeTime:(LTSDateChoose *)choose date:(NSDate *)date;
     /**
     点击确定按钮
     @param choose LTSDateChoos
     @param date 选择的日期
     */
     - (void)determine:(LTSDateChoose *)choose date:(NSDate *)date;
