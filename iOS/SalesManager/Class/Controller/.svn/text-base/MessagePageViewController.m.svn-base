//
//  MessagePageViewController.m
//  SalesManager
//
//  Created by liuxueyan on 14-10-10.
//  Copyright (c) 2014年 liu xueyan. All rights reserved.
//

#import "MessagePageViewController.h"
#import "DAPagesContainer.h"
#import "MBProgressHUD.h"
#import "MessageBarManager.h"
#import "LocalManager.h"
#import "AppDelegate.h"
#import "Constant.h"
#import "MessageViewController.h"
#import "AnnounceViewController.h"

@interface MessagePageViewController ()<DAPagesContainerDelegate>
@property (strong, nonatomic) DAPagesContainer *pagesContainer;
@end

@implementation MessagePageViewController
@synthesize userId,selectItem,parentController;
- (void)viewDidLoad {
    //init navigationbar
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    lblFunctionName.text = TITLENAME(FUNC_MESSAGE_DES);

    self.pagesContainer = [[DAPagesContainer alloc] init];
    [self.pagesContainer willMoveToParentViewController:self];
    self.pagesContainer.view.frame = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y, self.view.bounds.size.width, MAINHEIGHT + 40);
    self.pagesContainer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.pagesContainer.view];
    [self.pagesContainer didMoveToParentViewController:self];
    self.pagesContainer.delegate = self;
    
    ctrlArray =[[NSMutableArray alloc] initWithCapacity:2];
    AnnounceViewController *spaceViewController1 = [[AnnounceViewController alloc] init];
    spaceViewController1.title = NSLocalizedString(@"云通知", nil);
    if (parentController != nil) {
        spaceViewController1.parentCtrl = self.parentController;
    }else{
        spaceViewController1.parentCtrl = self;
    }
    
    [ctrlArray addObject:spaceViewController1];
    
    MessageViewController *spaceViewController2 = [[MessageViewController alloc] init];
    spaceViewController2.title = NSLocalizedString(@"favorate_segment_message", nil);
    if (parentController != nil) {
        spaceViewController2.parentCtrl = self.parentController;
    }else{
        spaceViewController2.parentCtrl = self;
    }
    spaceViewController2.userId = userId;
    [ctrlArray addObject:spaceViewController2];
    
    self.pagesContainer.viewControllers = ctrlArray;
    [self addChildViewController:self.pagesContainer];
    [self.pagesContainer setSelectedIndex:selectItem animated:YES];
    appDelegate = APPDELEGATE;
}

-(void)syncTitle {
 lblFunctionName.text = TITLENAME(FUNC_MESSAGE_DES);
}
- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

-(void)EScrollerViewEnableScroll:(BOOL)bEnable{
    
    self.pagesContainer.scrollView.userInteractionEnabled = bEnable;
    
}

-(IBAction)leftButtonAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) didSelected:(int)index{
    if ([ctrlArray count] > 0) {
        [([ctrlArray objectAtIndex:index]) reload];
    }
}


@end
