//
//  ViewController.m
//  LTSDateChooseView
//
//  Created by 李棠松 on 2016/12/23.
//  Copyright © 2016年 李棠松. All rights reserved.
//

#import "ViewController.h"
#import "LTSDateChoose.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,LTSDateChooseDelegate>{
    NSArray *types;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    types = @[@"UIDatePickerModeTime",@"UIDatePickerModeDate",@"UIDatePickerModeDateAndTime",@"UIDatePickerModeCountDownTimer"];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = types[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIDatePickerMode mode;
    switch (indexPath.row) {
        case 0:
            mode = UIDatePickerModeTime;
            break;
        case 1:
            mode = UIDatePickerModeDate;
            break;
        case 2:
            mode = UIDatePickerModeDateAndTime;
            break;
            
            
        default:
            mode = UIDatePickerModeCountDownTimer;
            break;
    }
    
    LTSDateChoose *dateChoose =  [[LTSDateChoose alloc]initWithType:mode title:@"日期选择"];
    
    [dateChoose setNowTime:[NSDate date]];
    
    dateChoose.delegate = self;
    
    [dateChoose showWithAnimation:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
