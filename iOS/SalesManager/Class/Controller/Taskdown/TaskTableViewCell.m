//
//  TaskTableViewCell.m
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/11.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//

#import "TaskTableViewCell.h"

@implementation TaskTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)layoutSubviews {
    [_statasBtn addTarget:self action:@selector(changeAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)changeAction {
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeStatus)]) {
        [self.delegate changeStatus];
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
   
   
    [_taskLab release];
    [_startLab release];
   
    [_endLab release];
    [_leadLab release];
    
    [_statasBtn release];
    [_progressView release];
    [super dealloc];
}
- (IBAction)statusAction:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeStatus)]) {
        [self.delegate changeStatus];
    }

    
}
@end
