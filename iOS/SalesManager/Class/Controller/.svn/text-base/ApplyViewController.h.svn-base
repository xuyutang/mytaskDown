//
//  GiftViewController.h
//  SalesManager
//
//  Created by liuxueyan on 14-9-15.
//  Copyright (c) 2014年 liu xueyan. All rights reserved.
//

#import "BaseViewController.h"
#import "TextViewCell.h"
#import "InputCell.h"
#import "LiveImageCell.h"
#import "ApplyTypeViewController.h"

@class AppDelegate;
@interface ApplyViewController : BaseViewController<ApplyTypeDelegate,LiveImageCellDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,RequestAgentDelegate>{
    
    UIView *rightView;
    
    UITableView *tableView;
    TextViewCell *textViewCell;
    InputCell *titleCell;
    LiveImageCell *liveImageCell;
    NSMutableArray *imageFiles;
    BOOL bHasKeyboard;
    NSString *applyTitle;
    NSString *applyContent;
    NSMutableArray *applyCategories;
    ApplyCategory *currentApplyCategory;
    AppDelegate* appDelegate;
    BOOL bHasSync;
}

@property (nonatomic,assign) BOOL showListImageBool ;

@end
