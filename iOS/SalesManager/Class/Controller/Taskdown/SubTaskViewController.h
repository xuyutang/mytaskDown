//
//  SubTaskViewController.h
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/6.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^subTask)(NSString*Str);

@interface SubTaskViewController : BaseViewController

@property (nonatomic,copy)subTask block;

-(void)getSubTaskWithBlock:(subTask)myBlock;

@end
