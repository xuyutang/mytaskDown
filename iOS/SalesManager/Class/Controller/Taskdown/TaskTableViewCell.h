//
//  TaskTableViewCell.h
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/11.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//
@protocol TaskListDelegate <NSObject>

-(void)changeStatus;

@end

#import <UIKit/UIKit.h>
#import "PICircularProgressView.h"

@interface TaskTableViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *taskLab;
@property (retain, nonatomic) IBOutlet UILabel *startLab;
@property (retain, nonatomic) IBOutlet UIButton *statasBtn;
@property (retain, nonatomic) IBOutlet PICircularProgressView *progressView;

@property (retain, nonatomic) IBOutlet UILabel *leadLab;

@property (retain, nonatomic) IBOutlet UILabel *endLab;

@property (nonatomic,assign) id<TaskListDelegate> delegate;

@end
