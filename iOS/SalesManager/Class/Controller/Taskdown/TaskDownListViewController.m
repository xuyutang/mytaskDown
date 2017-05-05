//
//  TaskDownListViewController.m
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/6.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//

#import "TaskDownListViewController.h"
#import "HMSegmentedControl.h"
#import "PullTableView.h"
#import "TaskTableViewCell.h"
#import "taskDownModel.h"

@interface TaskDownListViewController ()<UITableViewDelegate,UITableViewDataSource,PullTableViewDelegate,TaskListDelegate,UIAlertViewDelegate> {
    HMSegmentedControl *statusSegCtrl;
    PullTableView *taskTableView;
    TaskTableViewCell *taskCell;
    

}

@end

@implementation TaskDownListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    TASKMUArray = [[LOCALMANAGER getTasks] retain];
    [lblFunctionName setText:@"任务下发-列表"];
    statusSegCtrl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"全部",@"我负责的",@"我派发的",@"我参与的"]];
    
    [statusSegCtrl setFrame:CGRectMake(0, 0, 320, 35)];
    statusSegCtrl.selectionIndicatorMode = HMSelectionIndicatorFillsSegment;
    statusSegCtrl.textColor = [UIColor blackColor];
    statusSegCtrl.selectionIndicatorColor = WT_RED;
    [statusSegCtrl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 35, MAINWIDTH, 0.5f)];
    lab2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lab2];
    [self.view addSubview:statusSegCtrl];
    
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, MAINWIDTH, 0.5f)];
    lab.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lab];
    UILabel *lab3= [[UILabel alloc] initWithFrame:CGRectMake(MAINWIDTH/4, 5, 0.5f, 25)];
    lab3.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lab3];
    UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(MAINWIDTH/4*2, 5, 0.5f, 25)];
    lab4.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lab4];
    
    UILabel *lab5 = [[UILabel alloc] initWithFrame:CGRectMake(MAINWIDTH/4*3, 5, 0.5f, 25)];
    lab5.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:lab5];

    [lab release];
    [lab2 release];
    [lab3 release];
    [lab4 release];
    [lab5 release];
    
    [self loadTableView];
}

-(void)loadTableView {
    taskTableView = [[PullTableView alloc]initWithFrame:CGRectMake(0, 35, MAINWIDTH, MAINHEIGHT - 35) style:UITableViewStylePlain];
    taskTableView.delegate = self;
    taskTableView.dataSource = self;
    taskTableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:taskTableView];

}


-(void)segmentAction:(id)sender {
    switch (statusSegCtrl.selectedIndex) {
        case 2:{
            currentStatus = TASK_STATUS_NOT_FINISH;
        }
            break;
        case 1:{
            currentStatus = TASK_STATUS_FINISH;
        }
            break;
        case 0:{
            currentStatus = TASK_STATUS_ALL;
        }
            break;
            
    }
    [self initData];

}

-(void)initData {



}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return TASKMUArray.count;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   static NSString *identStr = @"cell";
    taskCell = [tableView dequeueReusableCellWithIdentifier:identStr];
    if (taskCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TaskTableViewCell" owner:self options:nil];
        for (id obj in nib) {
            if ([obj isKindOfClass:[TaskTableViewCell class]]) {
                taskCell = (TaskTableViewCell*)obj;
            }
        }
    }
    taskDownModel *model = [[taskDownModel alloc] init];
    model = TASKMUArray[indexPath.row];
    taskCell.taskLab.text = [NSString stringWithFormat:@"任务描述:%@",model.descripStr];
    taskCell.startLab.text = [NSString stringWithFormat:@"开始时间:%@",model.startTime];
    taskCell.endLab.text = [NSString stringWithFormat:@"截止时间:%@",model.endTime];
    taskCell.leadLab.text = [NSString stringWithFormat:@"负责人:%@",model.dutyer];
    taskCell.selectionStyle=UITableViewCellSelectionStyleNone;
    taskCell.delegate = self;
    return taskCell;
    

}

-(void)changeStatus {
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"是否设置为完成状态" delegate:self cancelButtonTitle: @"取消"otherButtonTitles:@"确定", nil];
    [alert show];
   
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self removeFromParentViewController];
    } else {
     [taskCell.statasBtn setTitle:@"已完成" forState:UIControlStateNormal];
    
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;

}

-(void)clickLeftButton:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

-(void)didReceiveMemoryWarning {
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
