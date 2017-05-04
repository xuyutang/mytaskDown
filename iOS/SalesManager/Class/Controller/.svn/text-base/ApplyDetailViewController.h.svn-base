//
//  ApplyDetailViewController.h
//  SalesManager
//
//  Created by liuxueyan on 14-9-15.
//  Copyright (c) 2014年 liu xueyan. All rights reserved.
//

#import "BaseViewController.h"
#import "TextViewCell.h"
#import "LiveImageCell.h"
#import "AppDelegate.h"
#import "PullTableView.h"

@interface ApplyDetailViewController : BaseViewController<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,RequestAgentDelegate>{
    
    UIView *rightView;
    PullTableView *tableView;
    TextViewCell *tvOldReplyCell;
    TextViewCell *tvReplyCell;
    LiveImageCell *liveImageCell;
    BOOL bHasKeyboard;
    ApplyItem *applyItem;
    AppDelegate* appDelegate;
    int applyItemId;
    NSMutableArray *imageFiles;
    ApplyItemReply* applyItemReply;
    NSString* sApplyItemReply;
    id<RefreshDelegate> delegate;
}

@property(nonatomic,assign)int msgType;
@property(nonatomic,assign)int applyItemId;
@property(nonatomic,retain)ApplyItem *applyItem;
@property(nonatomic,retain)id<RefreshDelegate> delegate;

@end
