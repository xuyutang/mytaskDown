//
//  TaskDownViewController.m
//  SalesManager
//
//  Created by iOS-Dev on 2017/4/5.
//  Copyright © 2017年 liu xueyan. All rights reserved.
//

#import "TaskDownViewController.h"
#import "TextViewCell.h"
#import "UIView+CNKit.h"
#import "LiveImageCell.h"
#import "DatePicker.h"
#import "SubTaskViewController.h"
#import "SubTaskTableViewCell.h"
#import "TaskDownListViewController.h"
#import "MBProgressHUD.h"
#import "BoxViewController1.h"
#import "PlaceTextView.h"
#import "taskDownModel.h"



@interface TaskDownViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,LiveImageCellDelegate,UIActionSheetDelegate,subTaskDelegate,SWTableViewCellDelegate,DatePickerDelegate,UIImagePickerControllerDelegate> {
    UIView * rightView;
    UITableView *tableView;
    TextViewCell *tvTodayCell;
    LiveImageCell *liveImageCell;
    SubTaskTableViewCell *subTaskCell;
    DatePicker *datePicker;
    int distance;
    NSString *descriptionStr;
    NSString *remarkStr;
    NSString *startTime;
    NSString *endTime;
    int index;
    NSString *leaderStr;
    NSMutableArray *choseMulArray;
    NSMutableArray *subChoseMulArray;
    int tagIndex;
    UILabel *plaLabel;
    
   
}

@end

@implementation TaskDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    taskSMuarray = [[NSMutableArray alloc] init];
    rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 60)];
    UIImageView *listImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 17, 25, 25)];
    [listImageView setImage:[UIImage imageNamed:@"ab_icon_search"]];
    
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toList:)];
    [tapGesture1 setNumberOfTapsRequired:1];
    listImageView.userInteractionEnabled = YES;
    listImageView.contentMode = UIViewContentModeScaleAspectFit;
    [listImageView addGestureRecognizer:tapGesture1];
    [rightView addSubview:listImageView];
    [listImageView release];
    [tapGesture1 release];
    
    UIImageView *saveImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 17, 25, 25)];
    [saveImageView setImage:[UIImage imageNamed:@"ab_icon_save"]];
    
    saveImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toSave:)];
    [tapGesture2 setNumberOfTapsRequired:1];
    saveImageView.contentMode = UIViewContentModeScaleAspectFit;
    [saveImageView addGestureRecognizer:tapGesture2];
       
    [rightView addSubview:saveImageView];
    [saveImageView release];
    [tapGesture2 release];
    
    UIBarButtonItem *btRight = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.rightButton = btRight;
    [btRight release];

    [lblFunctionName setText:@"任务下发"];
    [self createTable];
    
    choseMulArray = [[NSMutableArray alloc]init];
    subChoseMulArray = [[NSMutableArray alloc]init];
    plaLabel = [[UILabel alloc]initWithFrame:CGRectMake(3, 3, 200, 20)];
    plaLabel.enabled = NO;
    plaLabel.font =  [UIFont systemFontOfSize:15];
    plaLabel.textColor = [UIColor lightGrayColor];
    plaLabel.font = [UIFont systemFontOfSize:12];
    contactName = [[NSMutableArray alloc] init];
    contacts = [[NSMutableArray alloc] initWithArray:[LOCALMANAGER getAllUsers]];
    [contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [contactName addObject:((User*)obj).realName];
    }];
    
    // Do any additional setup after loading the view.
}

-(NSMutableArray*)subTaskMulArray {
    if (_subTaskMulArray  == nil ) {
        _subTaskMulArray = [[NSMutableArray alloc] init];
    }
    return _subTaskMulArray;
}

-(void)createTable {
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 , 320, MAINHEIGHT) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.bounces = NO;
    tableView.separatorColor = WT_WHITE;
    [tableView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:tableView];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 7;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 2) {
        return self.subTaskMulArray.count;
    }
    return 1;

}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleBlack];
    UIBarButtonItem * helloButton = [[UIBarButtonItem alloc]initWithTitle:@"清空" style:UIBarButtonItemStyleBordered target:self action:@selector(clearInput:)];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard:)];
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
    [doneButton release];
    [btnSpace release];
    [helloButton release];

    switch (indexPath.section) {
        case 0:
            tvTodayCell = (TextViewCell *)[tableView dequeueReusableCellWithIdentifier:@"OrderProductCell0"];
            if(tvTodayCell==nil){
                tvTodayCell= [[TextViewCell alloc] init];
            }
            
            tvTodayCell.textView.tag = 9999;
            if (descriptionStr.length) {
                  tvTodayCell.textView.text = descriptionStr;
            }else {
                plaLabel.hidden = NO;
            
            }
          
            tvTodayCell.textView.height = 83;
            tvTodayCell.textView.delegate=self;
            tvTodayCell.textView.layer.borderColor = WT_GRAY.CGColor;
            tvTodayCell.textView.layer.borderWidth = 0.5;
            tvTodayCell.textView.layer.masksToBounds = YES;
            tvTodayCell.textView.layer.cornerRadius = 10;
          
            plaLabel.text = @"输入任务的相关描述";
          
            [tvTodayCell.textView addSubview:plaLabel];
            [topView setItems:buttonsArray];
            
            tvTodayCell.selectionStyle=UITableViewCellSelectionStyleNone;
            [topView release];
            return tvTodayCell;

            break;
            
        case 1:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if(cell==nil){
                cell= [[UITableViewCell alloc] init];
            }
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            cell.textLabel.font = [UIFont systemFontOfSize:12];
            if (!choseMulArray.count) {
                cell.textLabel.text = @"选择任务负责人";
                cell.textLabel.textColor = WT_GRAY;
            }else {
                
            cell.textLabel.text = [choseMulArray componentsJoinedByString:@" "];
                leaderStr = [[choseMulArray componentsJoinedByString:@" "] copy];
                
            }
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            return cell;
            break;
            
            

        
        }
            
            case 2:{
            
            subTaskCell = (SubTaskTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"subTaskCell"];
            NSMutableArray *rightUtilityButtons = [NSMutableArray new];
            
             [rightUtilityButtons addUtilityButtonWithColor:WT_RED title:NSLocalizedString(@"cell_delete", nil)];
            if (subTaskCell == nil) {
                
                subTaskCell = [[SubTaskTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"subTaskCell" containingTableView:tableView rowHeight:50 leftUtilityButtons:nil rightUtilityButtons:rightUtilityButtons];
            }
            
            subTaskCell.tag = indexPath.row + 1000;
            
            [subTaskCell addCallback:^(NSInteger tag) {
                tagIndex = tag;
            }];
            
            subTaskCell.selectionStyle=UITableViewCellSelectionStyleNone;
            if (indexPath.row == tagIndex - 1000) {
                if (subChoseMulArray.count) {
                    [subTaskCell.Btn setTitle:[subChoseMulArray componentsJoinedByString:@" "] forState:UIControlStateNormal];
                }else {
                [subTaskCell.Btn setTitle:@"选择执行人" forState:UIControlStateNormal];
                
                }
                
            }
           
            subTaskCell.mydelegate = self;
            subTaskCell.delegate = self;
            subTaskCell.subTaskLable.font = [UIFont systemFontOfSize:12];
            subTaskCell.subTaskLable.text = self.subTaskMulArray[indexPath.row];
            
            return subTaskCell;
            
            break;

        }
            
            case 3:
            
            if(liveImageCell==nil){
                liveImageCell = [[LiveImageCell alloc] init];
                liveImageCell.delegate = self;
                liveImageCell.liveBool = NO;

            }
            liveImageCell.selectionStyle=UITableViewCellSelectionStyleNone;

            return liveImageCell;
            break;
        case 4:{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if(cell==nil){
                cell= [[UITableViewCell alloc] init];
            }
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            if (!startTime.length) {
                cell.textLabel.text = @"选择开始时间";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = WT_GRAY;
            }else {
            
             cell.textLabel.text = startTime;
            
            }
         cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            return cell;
            break;

        
        
        }
        case 5:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if(cell==nil){
                cell= [[UITableViewCell alloc] init];
            }
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            if (!endTime.length) {
                cell.textLabel.text = @"选择截止时间";
                cell.textLabel.font = [UIFont systemFontOfSize:13];
                cell.textLabel.textColor = WT_GRAY;
            }else {
                
                cell.textLabel.text = endTime;
                
            }
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            return cell;
            break;
            
            
            
        }
        case 6:
             tvTodayCell = (TextViewCell *)[tableView dequeueReusableCellWithIdentifier:@"OrderProductCell0"];
            if(tvTodayCell==nil){
                tvTodayCell= [[TextViewCell alloc] init];
            }
            tvTodayCell.textView.tag = 8888;
            tvTodayCell.textView.delegate=self;
            tvTodayCell.textView.height = 83;
            if (remarkStr.length) {
                tvTodayCell.textView.text = remarkStr;
            }else {
                plaLabel.hidden = NO;
                
            }
            
            tvTodayCell.textView.layer.borderColor = WT_GRAY.CGColor;
            tvTodayCell.textView.layer.borderWidth = 0.5;
            tvTodayCell.textView.layer.masksToBounds = YES;
            tvTodayCell.textView.layer.cornerRadius = 10;
            plaLabel.text = @"输入备注信息";
            
            [tvTodayCell.textView addSubview:plaLabel];
            [topView setItems:buttonsArray];
            
            tvTodayCell.selectionStyle=UITableViewCellSelectionStyleNone;
            [topView release];
            return tvTodayCell;
            break;
        default:
            break;
    }
   
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 90;
            break;
        
        case 1:
            return 30;
            break;
        case 2:
            return 50;
            break;
        case 3:
            return 120;
            break;
        case 4:
            return 20;
            break;
        case 5:
            return 20;
            break;
        case 6:
            return 80;
            break;
       
        default:
            break;
    }
    return 80;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 30;
}


-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView;
    switch (section) {
        case 0:{
            headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 20)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 90, 20)];
            label.text = @"任务描述：";
            label.font = [UIFont systemFontOfSize:14];
            [headView addSubview:label];
            
            return headView;
            break;

        }
        case 1:{
            headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 20)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 60, 20)];
            label.text = @"负责人：";
            label.font = [UIFont systemFontOfSize:14];
            [headView addSubview:label];
            
            return headView;
            break;
            
        }
    
        case 2:
             headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 20)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(45, 5, 60, 20)];
            label.text = @"子任务";
            label.font = [UIFont systemFontOfSize:14];
            [headView addSubview:label];
            
            UIImageView *imagView = [[UIImageView alloc]initWithFrame:CGRectMake(15 , 5, 25, 25)];
            imagView.image = [UIImage imageNamed:@"ab_icon_add"];
            
            [imagView addActionWithTarget:self action:@selector(addSubTask)];
            imagView.userInteractionEnabled = YES;
            [headView addSubview:imagView];
            
            return headView;
            break;
        case 3:{
            headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 20)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 160, 20)];
            label.text = @"媒体图片(含拍照，相册)";
            label.font = [UIFont systemFontOfSize:14];
            [headView addSubview:label];
            
            return headView;
            break;
            
        }
  
        case 4:{
            headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 20)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 60, 20)];
            label.text = @"开始时间";
            label.font = [UIFont systemFontOfSize:14];
            [headView addSubview:label];
            
            return headView;
            break;
            
        }

        case 5:{
                headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 20)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 60, 20)];
            label.text = @"截止时间";
            label.font = [UIFont systemFontOfSize:14];
            [headView addSubview:label];
            
            return headView;
            break;
            
        }

        case 6:{
            headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 20)];
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 60, 20)];
            label.text = @"备注：";
            label.font = [UIFont systemFontOfSize:14];
            [headView addSubview:label];
            
            return headView;
            break;
            
        }

        default:
            break;
    }
    return nil;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    index = indexPath.section;
    if (indexPath.section == 4 || indexPath.section == 5 ) {
        [self datePickerDidCancel];
        datePicker = [[DatePicker alloc] init];
        [self.view addSubview:datePicker];
        [datePicker setDelegate:self];
        [datePicker setCenter:CGPointMake(self.view.frame.size.width*.5, self.view.frame.size.height-datePicker.frame.size.height*.5)];
        CGRect tableFrame = tableView.frame;
        distance = IS_IPHONE5?0:80;
        tableFrame.origin.y -= distance;
        [tableView setFrame:tableFrame];
        [datePicker release];
    }
    
    if (indexPath.section == 1) {
        BoxViewController1 *boxVC = [[BoxViewController1 alloc]init];
        boxVC.boxMulArray = [NSMutableArray arrayWithArray:contactName];
        [boxVC getUserTrtByBlock:^(NSMutableArray *mulArray) {
            choseMulArray = mulArray;
            [tableView reloadData];
        }];
       [self.navigationController pushViewController:boxVC animated:YES];
        
    }
}

-(void)datePickerDidCancel{
    for(UIView *view in self.view.subviews){
        if([view isKindOfClass:[DatePicker class]]){
            [view removeFromSuperview];
        }
    }
    
    CGRect tableFrame = tableView.frame;
    tableFrame.origin.y += distance;
    distance = 0;
    [tableView setFrame:tableFrame];
}

#pragma mark datePickerDidDone
-(void)datePickerDidDone:(DatePicker*)picker{
   ;
    if (index == 4) {
      startTime = [[NSString stringWithFormat:@"%d-%@-%@ %@:%@",datePicker.yearValue,[self intToDoubleString:datePicker.monthValue],[self intToDoubleString:datePicker.dayValue],[self intToDoubleString:datePicker.hourValue],[self intToDoubleString:datePicker.minuteValue]] retain];
    }else {
    endTime = [[NSString stringWithFormat:@"%d-%@-%@ %@:%@",datePicker.yearValue,[self intToDoubleString:datePicker.monthValue],[self intToDoubleString:datePicker.dayValue],[self intToDoubleString:datePicker.hourValue],[self intToDoubleString:datePicker.minuteValue]] retain];
    }
    [self datePickerDidCancel];
    [tableView reloadData];
}

#pragma mark intToDoubleString
-(NSString *)intToDoubleString:(int)d {
    if (d<10) {
        return [NSString stringWithFormat:@"0%d",d];
    }
    return [NSString stringWithFormat:@"%d",d];
    
}

#pragma mark - SW Table View Cell Delegate

- (void)swippableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index{
    
}
- (void)swippableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index{
    NSIndexPath *indexPath = [tableView indexPathForCell:cell];
    [self.subTaskMulArray removeObjectAtIndex:indexPath.row];
   
    [tableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}

-(void)chosePerson {
    NSLog(@"选择子任务执行人");
    BoxViewController1 *boxVC = [[BoxViewController1 alloc]init];
    boxVC.boxMulArray =  [NSMutableArray arrayWithArray:contactName];
    [boxVC getUserTrtByBlock:^(NSMutableArray *mulArray) {
        subChoseMulArray = mulArray;
        [tableView reloadData];
    }];
    [self.navigationController pushViewController:boxVC animated:YES];


}

-(void)anyPhoto {
    UIActionSheet *actionSheet =[[UIActionSheet alloc]
                                 initWithTitle:@"请选择图片"
                                 delegate:self
                                 cancelButtonTitle:@"取消"                                 destructiveButtonTitle:@"拍照"
                                 otherButtonTitles:@"从相册选择",nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    actionSheet.tag = 0;
    [actionSheet showInView:self.view];

}

#pragma mark actionSheet delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                UIImagePickerController *cameraVC = [[UIImagePickerController alloc] init];
                [cameraVC setSourceType:UIImagePickerControllerSourceTypeCamera];
                [cameraVC.navigationBar setBarStyle:UIBarStyleBlack];
                [cameraVC setDelegate:self];
                [cameraVC setAllowsEditing:NO];
                [self presentModalViewController:cameraVC animated:YES];
                [cameraVC release];
                
            }else {
                NSLog(@"Camera is not.");
            }
            
        }
            break;
        case 1:{
            [self takeAPhotoWithAlbum];
        }
            break;
        default:
            break;
    }
}

#pragma mark  访问相册
-(void)takeAPhotoWithAlbum{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
        UIImagePickerController *imgPickerVC = [[UIImagePickerController alloc] init];
        [imgPickerVC setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [imgPickerVC.navigationBar setBarStyle:UIBarStyleBlack];
        [imgPickerVC setDelegate:self];
        [imgPickerVC setAllowsEditing:NO];
        //显示Image Picker
        [self presentModalViewController:imgPickerVC animated:YES];
        
        
    }else {
        NSLog(@"Album is not available.");
    }
    
    
}

#pragma mark imagePickerController:
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
   NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *imageFile = [[NSString alloc] initWithString:[NSString UUID]];
    
    NSString *imagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.jpg",imageFile]];
    
    // Extract image from the picker and save it
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:@"public.image"]){
        UIImage *image = [self fitSmallImage:[info objectForKey:UIImagePickerControllerOriginalImage]] ;
        
        NSData *data = UIImageJPEGRepresentation(image, 0.5);//UIImagePNGRepresentation(image);
        [data writeToFile:imagePath atomically:YES];
    }
   // [imageFiles addObject:imagePath];
    [liveImageCell insertPhoto:imagePath];
    
    //[imageView setImage:[UIImage imageWithContentsOfFile:imagePath]];
    [picker dismissModalViewControllerAnimated:YES];
    [imageFile release];
    
}

#pragma mark fitSmallImage
-(UIImage *)fitSmallImage:(UIImage *)image {
    if (nil == image)
    {
        return nil;
    }
    if (image.size.width<720 && image.size.height<960)
    {
        return image;
    }
    CGSize size = [self fitsize:image.size];
    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    [image drawInRect:rect];
    UIImage *newing = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newing;
}

#pragma mark fitsize
- (CGSize)fitsize:(CGSize)thisSize {
    if(thisSize.width == 0 && thisSize.height ==0)
        return CGSizeMake(0, 0);
    CGFloat wscale = thisSize.width/720;
    CGFloat hscale = thisSize.height/960;
    CGFloat scale = (wscale>hscale)?wscale:hscale;
    CGSize newSize = CGSizeMake(thisSize.width/scale, thisSize.height/scale);
    return newSize;
}

#pragma mark imageWithImageSimple
-(UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize {
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    if (image.size.width > image.size.height) {
        newSize.width = (newSize.height/image.size.height) *image.size.width;
    }else{
        newSize.height = (newSize.width/image.size.width) *image.size.height;
    }
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


-(void)addSubTask {
    SubTaskViewController *subTaskVC = [[SubTaskViewController alloc]init];
    [subTaskVC getSubTaskWithBlock:^(NSString *Str) {
        [self.subTaskMulArray addObject:Str];
        [tableView reloadData];
        }];
    [self.navigationController pushViewController:subTaskVC animated:YES];

}

-(void)toList:(id)sender {
    NSLog(@"去往任务列表");
    TaskDownListViewController *taskListVC = [[TaskDownListViewController alloc]init];
    [self.navigationController pushViewController:taskListVC animated:YES];
    
}

-(void)toSave:(id)sender {
    NSLog(@"任务下发保存");
    
    taskDownModel *taskModel = [[taskDownModel alloc]init];
    taskModel.descripStr = descriptionStr;
    taskModel.startTime = startTime;
    taskModel.endTime = startTime;
    taskModel.remarkStr = remarkStr;
    taskModel.dutyer = leaderStr;
    [taskSMuarray addObject:taskModel];
    [LOCALMANAGER saveTaskDown:taskSMuarray];
    descriptionStr = nil;
    startTime = nil;
    startTime = nil;
    remarkStr = nil;
    leaderStr = nil;
    leaderStr = nil;
    [tableView reloadData];
    [MESSAGE showMessageWithTitle:@"任务下发"                                  description:@"保存成功"                             type:MessageBarMessageTypeSuccess
                      forDuration:SUCCESS_MSG_DURATION];
    
    
}

- (void) textViewDidChange:(UITextView *)textView{
    if ([textView.text length] == 0) {
        [plaLabel setHidden:NO];
    }else{
        [plaLabel setHidden:YES];
    }
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
}

-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.tag == 9999) {
        descriptionStr = [textView.text copy];
        
    }else {
        remarkStr = [textView.text copy];

    }
}

- (void)didReceiveMemoryWarning {
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
