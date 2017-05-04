//
//  SubTaskTableViewCell.h
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/6.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWTableViewCell.h"
#import "Constant.h"
@protocol subTaskDelegate <NSObject>

-(void)chosePerson;

@end

@interface SubTaskTableViewCell : SWTableViewCell {
  
 void(^_callback)(NSInteger tag);
    
}
@property (retain, nonatomic) IBOutlet UILabel *subTaskLable;
@property (nonatomic,retain) UIButton *Btn;
@property (nonatomic,assign) id<subTaskDelegate>mydelegate;
- (IBAction)choseBtn:(id)sender;

- (void)addCallback:(void(^)(NSInteger tag))callback;
@end
