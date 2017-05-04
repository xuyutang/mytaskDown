//
//  SubTaskTableViewCell.m
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/6.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//

#import "SubTaskTableViewCell.h"

@implementation SubTaskTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)initSubviews {
    [super initSubviews];
    _subTaskLable = [[UILabel alloc]initWithFrame:CGRectMake(15, 15, 100, 20)];
    [self addSubview:_subTaskLable];
    
     _Btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    _Btn.frame = CGRectMake(MAINWIDTH - 130, 15, 100, 20);
   
  
    [_Btn setTitleColor:WT_BLUE forState:UIControlStateNormal];
     [_Btn setTitle:@"选择执行人" forState:UIControlStateNormal];
    
    [_Btn addTarget:self action:@selector(choseAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_Btn];
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_subTaskLable release];
    [super dealloc];
}

-(void)choseAction {
     !_callback?:_callback(self.tag);
    if (self.mydelegate != nil && [self.mydelegate respondsToSelector:@selector(chosePerson)]) {
        [self.mydelegate chosePerson];
    }


}

- (void)addCallback:(void(^)(NSInteger tag))callback
{
    _callback = [callback copy];
}

- (IBAction)choseBtn:(id)sender {
    
}
@end
