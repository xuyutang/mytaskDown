//
//  SubTaskViewController.m
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/6.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//

#import "SubTaskViewController.h"

@interface SubTaskViewController ()<UITextViewDelegate> {

    UIView *rightView;
    NSString *subTaskStr;
    UILabel *label;
    UITextView *subTextView;
}

@end

@implementation SubTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 60)];
    
    UIImageView *saveImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 17, 25, 25)];
    [saveImageView setImage:[UIImage imageNamed:@"ab_icon_save"]];
    
    saveImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toSave:)];
    [tapGesture2 setNumberOfTapsRequired:1];
    saveImageView.contentMode = UIViewContentModeScaleAspectFit;
    [saveImageView addGestureRecognizer:tapGesture2];
    
    [rightView addSubview:saveImageView];
    [saveImageView release];
    [tapGesture2 release];
    
    UIBarButtonItem *btRight = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.rightButton = btRight;
    [btRight release];

    [lblFunctionName setText:@"子任务添加"];
    
    self.view.backgroundColor = WT_WHITE;
    subTextView = [[UITextView alloc]initWithFrame:CGRectMake(15, 15, 290, 110)];
    subTextView.delegate = self;
    subTextView.layer.borderWidth = 0.5;
    subTextView.layer.borderColor = WT_GRAY.CGColor;
    subTextView.layer.masksToBounds = YES;
    subTextView.layer.cornerRadius = 10;
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(3, 3, 200, 20)];
    label.enabled = NO;
    label.text = @"在此添加子任务";
    label.font = [UIFont systemFontOfSize:12];
    label.font =  [UIFont systemFontOfSize:15];
    label.textColor = [UIColor lightGrayColor];
    [subTextView addSubview:label];
    [self.view addSubview:subTextView];
    // Do any additional setup after loading the view.
}

-(void)textViewDidBeginEditing:(UITextView *)textView {
    

}


-(void)textViewDidEndEditing:(UITextView *)textView {
    subTaskStr = [textView.text copy];
    
}

- (void) textViewDidChange:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [label setHidden:NO];
    }else{
        [label setHidden:YES];
    }
}
-(void)getSubTaskWithBlock:(subTask)myBlock {
    self.block = myBlock ;
}

-(void)toSave:(id)sender{
    [subTextView endEditing:YES];
    NSLog(@"添加子任务");
    if (self.block != nil) {
        self.block(subTaskStr);
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)clickLeftButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
