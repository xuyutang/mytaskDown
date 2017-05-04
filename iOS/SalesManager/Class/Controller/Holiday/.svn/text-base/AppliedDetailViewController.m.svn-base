//
//  AppliedDetailViewController.m
//  SalesManager
//
//  Created by iOS-Dev on 16/10/8.
//  Copyright © 2016年 liu xueyan. All rights reserved.
//

#import "AppliedDetailViewController.h"
#import "MBProgressHUD.h"
#import "Constant.h"
#import "AppDelegate.h"
#import "UIView+CNKit.h"

@interface AppliedDetailViewController ()

@end

@implementation AppliedDetailViewController {
    UIView * rightView ;
}

#pragma mark viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 60)];
    UIImageView *refreshImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 15, 25, 25)];
    [refreshImageView setImage:[UIImage imageNamed:@"ab_icon_refresh"]];
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toFresh:)];
    [tapGesture1 setNumberOfTapsRequired:1];
    refreshImageView.userInteractionEnabled = YES;
    refreshImageView.contentMode = UIViewContentModeScaleAspectFit;
    [refreshImageView addGestureRecognizer:tapGesture1];
    [rightView addSubview:refreshImageView];
    [refreshImageView release];

    UIBarButtonItem *btRight = [[UIBarButtonItem alloc] initWithCustomView:rightView];
        self.navigationItem.rightBarButtonItem = btRight;
        [btRight release];
    
    [lblFunctionName setText:@"审批流程详情"];
    [leftImageView setImage:[UIImage imageNamed:@"ab_icon_back"]];
    self.webView.y = 0;
    NSString *urlString =  [NSString stringWithFormat:@"/holidayApply/flowDetail.jhtml?applyId=%@",self.applyIdString];
    [self loadURL:urlString];

}

#pragma mark 返回
-(void)clickLeftButton:(id)sender {
    if (self.hasNavBool) {
         [self.navigationController popViewControllerAnimated:YES];
    }else {
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
   
}

#pragma mark 刷新操作
-(void)toFresh:(id)sender {
    self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.labelText = NSLocalizedString(@"loading", @"");
    [self.webView reload];

}

#pragma mark didReceiveMemoryWarning
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
