//
//  ApproveViewController.m
//  SalesManager
//
//  Created by iOS-Dev on 16/10/6.
//  Copyright © 2016年 liu xueyan. All rights reserved.
//

#import "LeaveApplyViewController.h"
#import "DatePicker.h"
#import "MBProgressHUD.h"
#import "Constant.h"
#import "AppDelegate.h"
#import "UIDevice+Util.h"
#import "UIView+CNKit.h"

@interface LeaveApplyViewController ()<UITextViewDelegate,DatePickerDelegate> {
    UIView *rightView;
    UITextView *reasonTextView;
    DatePicker *dataPicker;
    UILabel *contentLabel;
    UILabel *contentLabel2;
    int distance;
}

@end

@implementation LeaveApplyViewController

#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = WT_WHITE;
    rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 60)];
   
    UIImageView *saveImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 15, 50, 30)];
    [saveImageView setImage:[UIImage imageNamed:@"ab_icon_save"]];
    saveImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toSave:)];
    [tapGesture2 setNumberOfTapsRequired:1];
    saveImageView.contentMode = UIViewContentModeScaleAspectFit;
    [saveImageView addGestureRecognizer:tapGesture2];
    [rightView addSubview:saveImageView];
    [saveImageView release];
    
    UIBarButtonItem *btRight = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = btRight;
    [btRight release];
    
    [lblFunctionName setText:[NSString stringWithFormat:@"假休管理-%@",self.titleString]];
    lblFunctionName.width = 230;
    [leftImageView setImage:[UIImage imageNamed:@"ab_icon_back"]];
    [self createUI];
}

#pragma mark  申请单UI的创建
-(void)createUI {
    //开始时间
    UILabel *startTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 60, 30)];
    startTimeLabel.text = @"开始日期";
    startTimeLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:startTimeLabel];
   
    contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 35, MAINWIDTH - 80, 30)];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.tag = 200;
    contentLabel.userInteractionEnabled = YES;
    [contentLabel addActionWithTarget:self action:@selector(choseStartTime)];
    [self.view addSubview:contentLabel];
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(75, contentLabel.bottom, contentLabel.width, 0.5)];
    lineView.backgroundColor = WT_GRAY;
    [self.view addSubview:lineView];

    //结束时间
    UILabel *endTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, startTimeLabel.bottom + 10, 60, 30)];
    endTimeLabel.text = @"结束日期";
    endTimeLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:endTimeLabel];
    
    contentLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(75, endTimeLabel.y - 10, MAINWIDTH - 80, 30)];
    contentLabel2.userInteractionEnabled = YES;
    contentLabel2.font = [UIFont systemFontOfSize:12];
    contentLabel2.tag = 201;
    [contentLabel2 addActionWithTarget:self action:@selector(choseEndTime)];
    [self.view addSubview:contentLabel2];
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(75, contentLabel2.bottom, contentLabel.width, 0.5)];
    lineView2.backgroundColor = WT_GRAY;
    [self.view addSubview:lineView2];
    
    //理由
    UILabel *reasonLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, lineView2.bottom + 30, 30, 30)];
    reasonLabel.font = [UIFont systemFontOfSize:12];
    reasonLabel.text = @"理由";
    [self.view addSubview:reasonLabel];
    
    reasonTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, reasonLabel.bottom + 15, MAINWIDTH - 20,  100)];
    reasonTextView.delegate = self;
    reasonTextView.text = @"必填(1000字以内)";
    reasonTextView.textColor = WT_GRAY;
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleBlack];
    
    UIBarButtonItem * helloButton = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStyleBordered target:self action:@selector(clearInput:)];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard:)];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
    
    [doneButton release];
    [btnSpace release];
    [helloButton release];

    [topView setItems:buttonsArray];
    [reasonTextView setInputAccessoryView:topView];
    reasonTextView.layer.borderWidth = 0.5;
    reasonTextView.layer.borderColor = WT_GRAY.CGColor;

    [self.view addSubview:reasonTextView];
    [topView release];
}

#pragma mark dismissKeyBoard
-(IBAction)dismissKeyBoard:(UIBarButtonItem *)sender {
    if (reasonTextView != nil) {
        [reasonTextView resignFirstResponder];
    }
}

#pragma mark datePickerDidCancel
-(void)datePickerDidCancel{
    
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[DatePicker class]]){
            
            [view removeFromSuperview];
        }
    }
    
    CGRect tableFrame = self.view.frame;
    tableFrame.origin.y += distance;
    distance = 0;
    [self.view setFrame:tableFrame];
    [dataPicker removeFromSuperview];
}

#pragma mark  选择时间
-(void)choseStartTime {
    [self datePickerDidCancel];
    dataPicker = [[DatePicker alloc] init];
    dataPicker.tag = 1000;
    [self.view addSubview:dataPicker];
    [dataPicker setDelegate:self];
    [dataPicker setCenter:CGPointMake(self.view.frame.size.width*.5, self.view.frame.size.height-dataPicker.frame.size.height*.5)];
  
}

#pragma mark  选择时间
-(void)choseEndTime {
    [self datePickerDidCancel];
    dataPicker = [[DatePicker alloc] init];
    dataPicker.tag = 1001;
    [self.view addSubview:dataPicker];
    [dataPicker setDelegate:self];
    [dataPicker setCenter:CGPointMake(self.view.frame.size.width*.5, self.view.frame.size.height-dataPicker.frame.size.height*.5)];
}

#pragma mark datePickerDidDone
-(void)datePickerDidDone:(DatePicker*)picker{
    if (picker.tag == 1000) {
         contentLabel.text = [[NSString stringWithFormat:@"%d-%@-%@ %@:%@",dataPicker.yearValue,[self intToDoubleString:dataPicker.monthValue],[self intToDoubleString:dataPicker.dayValue],[self intToDoubleString:dataPicker.hourValue],[self intToDoubleString:dataPicker.minuteValue]] retain];
    }else {
     contentLabel2.text = [[NSString stringWithFormat:@"%d-%@-%@ %@:%@",dataPicker.yearValue,[self intToDoubleString:dataPicker.monthValue],[self intToDoubleString:dataPicker.dayValue],[self intToDoubleString:dataPicker.hourValue],[self intToDoubleString:dataPicker.minuteValue]] retain];
    
    }
   
    
    [self datePickerDidCancel];
   
}

#pragma mark intToDoubleString
-(NSString *)intToDoubleString:(int)d {
    if (d<10) {
        return [NSString stringWithFormat:@"0%d",d];
    }
    return [NSString stringWithFormat:@"%d",d];
    
}


#pragma mark 申请列表的保存方法
-(void)toSave:(id)sender {
    //提交前的校验
    //开始时间不为空
    if (!contentLabel.text.length) {
        
        [MESSAGE showMessageWithTitle:NSLocalizedString(@"leave_mangerment", @"")
                          description:NSLocalizedString(@"leave_start_time", @"")
                                 type:MessageBarMessageTypeInfo
                          forDuration:INFO_MSG_DURATION];
     
        return;

    }
    
    //结束时间不为空
    if (!contentLabel2.text.length) {
        
        [MESSAGE showMessageWithTitle:NSLocalizedString(@"leave_mangerment", @"")
                          description:NSLocalizedString(@"leave_end_time", @"")
                                 type:MessageBarMessageTypeInfo
                          forDuration:INFO_MSG_DURATION];
        
        return;
        
    }

    //调休理由不为空
    if (reasonTextView.textColor == WT_GRAY ) {
        
        [MESSAGE showMessageWithTitle:NSLocalizedString(@"leave_mangerment", @"")
                          description:NSLocalizedString(@"leave_reson_text", @"")
                                 type:MessageBarMessageTypeInfo
                          forDuration:INFO_MSG_DURATION];
        
        return;
        
    }
    
    //结束时间大于开始时间
    int timeInterval = [self compareDate:contentLabel.text withDate:contentLabel2.text];
   
    if (timeInterval != 1) {
        [MESSAGE showMessageWithTitle:NSLocalizedString(@"leave_mangerment", @"")
                          description:NSLocalizedString(@"leave_time_interval", @"")
                                 type:MessageBarMessageTypeInfo
                          forDuration:INFO_MSG_DURATION];
        
        return;
    }
    //发起调休数据保存的网络请求
    AGENT.delegate = self;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:MAINVIEW animated:YES];
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = NSLocalizedString(@"loading", @"");
    
    HolidayApply_Builder *pb = [HolidayApply builder];
    [pb setId:-1];
    [pb setUser:USER];
    [pb setDeviceId:[UIDevice deviceId]];
    [pb setHolidayCateory:self.holidayCaregory];
    [pb setStartTime:contentLabel.text];
    [pb setEndTime:contentLabel2.text];
    [pb setReason:reasonTextView.text];
    
    if (DONE != [AGENT sendRequestWithType:ActionTypeHolidayApplySave param:[pb build]]){
        HUDHIDE2;
        [MESSAGE showMessageWithTitle:NSLocalizedString(@"leave_mangerment", @"")
                          description:NSLocalizedString(@"error_connect_server", @"")
                                 type:MessageBarMessageTypeError
                          forDuration:ERR_MSG_DURATION];
    }
  
    
    
}

#pragma mark 时间比较的方法
-(int)compareDate:(NSString*)date01 withDate:(NSString*)date02{
    int ci;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:date01];
    dt2 = [df dateFromString:date02];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}

-(void)didReceiveMessage:(id)message {
    SessionResponse* cr = [SessionResponse parseFromData:message];
    if ([super validateResponse:cr]) {
        return;
    }
    switch (INT_ACTIONTYPE(cr.type)) {
        case ActionTypeHolidayApplySave:{
            if (([cr.code isEqual: NS_ACTIONCODE(ActionCodeDone)])){
                contentLabel.text = @"";
                contentLabel2.text = @"";
                reasonTextView.text = @"必填(1000字以内)";
                reasonTextView.textColor = WT_GRAY;
                
            }
            [super showMessage2:cr Title:TITLENAME(FUNC_HOLIDAY_DES)
                    Description:NSLocalizedString(@"leave_done", @"")];
         
        }
            
    }


}

#pragma mark - textViewdelegate
#pragma mark textViewDidBeginEditing
-(void)textViewDidBeginEditing:(UITextView *)textView {
    [self.view setY:-100];
    if ([textView.text  isEqual: @"必填(1000字以内)"]) {
        textView.text = @"";
        
    }

}

#pragma mark textViewDidEndEditing
-(void)textViewDidEndEditing:(UITextView *)textView {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
          [self.view setY:0];
    }else {
          [self.view setY:64.0];
    }
  
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"必填(1000字以内)";
        textView.textColor = WT_GRAY;
    }else {
       textView.textColor = WT_BLACK;
    }

}

#pragma mark clickLeftButton
-(void)clickLeftButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
