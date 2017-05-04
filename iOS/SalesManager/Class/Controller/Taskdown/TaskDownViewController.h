//
//  TaskDownViewController.h
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/5.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//

#import "BaseViewController.h"

@interface TaskDownViewController : BaseViewController {
  NSMutableArray *contacts;
    
    NSMutableArray *contactName;
    NSMutableArray *taskSMuarray;
}

//存放子任务的数组
@property (nonatomic,strong) NSMutableArray *subTaskMulArray;

@end
