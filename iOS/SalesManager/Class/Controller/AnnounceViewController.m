//
//  MessageViewController.m
//  SalesManager
//
//  Created by liu xueyan on 8/1/13.
//  Copyright (c) 2013 liu xueyan. All rights reserved.
//

#import "AnnounceViewController.h"
#import "AnnounceDetailViewController.h"
#import "MBProgressHUD.h"
#import "MessageBarManager.h"
#import "LocalManager.h"
#import "AppDelegate.h"
#import "Constant.h"
#import "NSDate+Util.h"
#import "MessageCell.h"
#import "DBMessageCell.h"
#import "SDImageView+SDWebCache.h"
#import "SWTableViewCell.h"
#import "UIColor+hex.h"

@interface AnnounceViewController ()<SWTableViewCellDelegate>

@end

@implementation AnnounceViewController
@synthesize parentCtrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.pullTableView = [[PullTableView alloc] initWithFrame:CGRectMake(0, 0, MAINWIDTH, MAINHEIGHT - 44) style:UITableViewStylePlain];

    self.pullTableView.pullArrowImage = [UIImage imageNamed:@"ic_pull_refresh_blackArrow"];
    self.pullTableView.pullBackgroundColor = [UIColor yellowColor];
    self.pullTableView.pullTextColor = [UIColor blackColor];
    self.pullTableView.delegate = self;
    self.pullTableView.dataSource = self;
    self.pullTableView.pullDelegate = self;
    [self.view addSubview:self.pullTableView];
//    [lblFunctionName setText:NSLocalizedString(@"menu_function_announce", @"")];
    [lblFunctionName setText:TITLENAME(FUNC_MESSAGE_DES)];
    lblFunctionName.textAlignment = NSTextAlignmentLeft;
    currentPage = 1;
    totleSize = 0;
    
    currentAnnounce = nil;
    currentRow = 0;
    currentPage = 1;
    announceArray = [[NSMutableArray alloc] init];
    /*
    if (USER != nil) {
        AnnounceParams_Builder* pb = [AnnounceParams builder];
        AnnounceParams_Builder* pb = [AnnounceParams builder];
        [pb setUser:USER];
        [pb setPage:1];
        [pb set:[pb build]];
        [pb setVersion:pb.version];
        
        announceParams = [[pb build] retain];
    }*/
    
}

-(void)syncTitle {
   [lblFunctionName setText:TITLENAME(FUNC_MESSAGE_DES)];
}

- (void)reload
{
    if(!self.pullTableView.pullTableIsRefreshing) {
        if (announceArray.count > 0) {
            NSIndexPath *ip = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.pullTableView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
        self.pullTableView.pullTableIsRefreshing = YES;
        [self performSelector:@selector(refreshTable) withObject:nil afterDelay:RELOAD_DELAY];
    }
}

- (void)viewDidUnload
{
    [self setPullTableView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [pullTableView release];
    [super dealloc];
}

-(void)clearTable{
    if (announceArray.count > 0){
        [announceArray removeAllObjects];
    }
}

#pragma mark - Refresh and load more methods

- (void) refreshTable
{
    //本地读取
    currentPage = 1;
    [self clearTable];
    
    announceArray = [[LOCALMANAGER getAnnounces:currentPage] retain];
    self.pullTableView.pullLastRefreshDate = [NSDate date];
    self.pullTableView.pullTableIsRefreshing = YES;
    [self.pullTableView reloadData];
    self.pullTableView.pullTableIsRefreshing = NO;
    /*if (announceParams != nil){
        AnnounceParams_Builder* pb = [announceParams toBuilder];
        AnnounceParams_Builder* pb = [pb toBuilder];

        [pb setPage:1];
        [pb set:[pb build]];
        announceParams = [[pb build] retain];
        
        AGENT.delegate = self;
        if (DONE != [AGENT sendRequestWithType:RequestTypeAnnounceList param:announceParams]){
            [MESSAGE showMessageWithTitle:NSLocalizedString(@"bar_announce_list", @"")
                              description:NSLocalizedString(@"error_connect_server", @"")
                                     type:MessageBarMessageTypeError
                              forDuration:ERR_MSG_DURATION];
            
            self.pullTableView.pullTableIsRefreshing = NO;
            self.pullTableView.pullTableIsLoadingMore = NO;
        }

    }*/
}

- (void) loadMoreDataToTable
{
    self.pullTableView.pullTableIsLoadingMore = YES;
    if(currentPage*PAGESIZE < totleSize){
        currentPage++;
        [announceArray addObjectsFromArray:[[LOCALMANAGER getAnnounces:currentPage] retain]] ;
    }else{
        self.pullTableView.pullTableIsLoadingMore = NO;
    }
    [self.pullTableView reloadData];
    self.pullTableView.pullTableIsLoadingMore = NO;
    /*
    self.pullTableView.pullTableIsLoadingMore = YES;
    if(currentPage*pageSize < totleSize){
        currentPage++;
        AnnounceParams_Builder* pb = [announceParams toBuilder];
        AnnounceParams_Builder* pb = [pb toBuilder];
        
        [pb setPage:currentPage];
        [pb set:[pb build]];
        announceParams = [[pb build] retain];

        AGENT.delegate = self;
        if (DONE != [AGENT sendRequestWithType:RequestTypeAnnounceList param:announceParams]){
            [MESSAGE showMessageWithTitle:NSLocalizedString(@"bar_announce_list", @"")
                              description:NSLocalizedString(@"error_connect_server", @"")
                                     type:MessageBarMessageTypeError
                              forDuration:ERR_MSG_DURATION];
            
            self.pullTableView.pullTableIsRefreshing = NO;
            self.pullTableView.pullTableIsLoadingMore = NO;
        }

    }else{
        self.pullTableView.pullTableIsLoadingMore = NO;
    }*/
}

-(UIView*)setFootView {
    UIView *contentView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, MAINWIDTH, MAINHEIGHT - 150)];
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, MAINWIDTH, 50)];
    textLabel.text =@"暂无消息通知";
    textLabel.font = [UIFont systemFontOfSize:15.0f];
    textLabel.textAlignment = 1;
    textLabel.textColor = [UIColor grayColor];
    [contentView addSubview:textLabel];
    return contentView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (announceArray.count == 0) {
        [tableView setTableFooterView:[self setFootView]];
        return 0;
    }else {
        tableView.tableFooterView = [[UIView alloc]init];
        
    }
    //return messageArray.count;
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*NSString *text = ((Announce *)[announceArray objectAtIndex:indexPath.section]).subject;

    CGSize size = [super rebuildSizeWithString:text ContentWidth:(CELL_CONTENT_WIDTH - CELL_CONTENT_MARGIN*2 - 30.0f) FontSize:FONT_SIZE];
    
    CGFloat height = MAX(size.height + 40.0f, 62.0f);

    return height;*/
    return 85.0f;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return 1;
    //[(NSMutableArray* )[(NSDictionary* )[announceArray objectAtIndex:section] objectForKey:@"announce"] count];
    return announceArray.count;
}
/*
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger) section{
    UILabel *lbl = [[[UILabel alloc] initWithFrame:CGRectMake(0, 5, self.view.frame.size.width, 60)] autorelease];
    lbl.textAlignment = UITextAlignmentCenter;
    lbl.font = [UIFont systemFontOfSize:FONT_SIZE];
    
    lbl.text = [NSDate stringMonthAndDayFromDate:[NSDate dateFromString:[(NSDictionary* )[announceArray objectAtIndex:section] objectForKey:@"createdate"]]];
    lbl.backgroundColor = [UIColor clearColor];
    
    return lbl;
}
*/
/*
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}
*/

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*static NSString *CellIdentifier = @"AnnounceCell";
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil){
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"MessageCell" owner:self options:nil];
        for(id oneObject in nib)
        {
            if([oneObject isKindOfClass:[MessageCell class]])
                cell=(MessageCell *)oneObject;
        }
    }
    Announce *a = [announceArray objectAtIndex:indexPath.section];
    
    NSString *text = a.subject;

    CGSize size = [super rebuildSizeWithString:text ContentWidth:(CELL_CONTENT_WIDTH - CELL_CONTENT_MARGIN*2 - 30.0f) FontSize:FONT_SIZE];
    
    //cell.lMark.frame = CGRectMake(CELL_CONTENT_WIDTH - 30, 5.0f,10.0f, 10.0f);
    if ([a.readStatus isEqual:UNREADED]) {
        cell.lMark.layer.cornerRadius = 5.0f;
        [cell.lMark setBackgroundColor:WT_RED];
        cell.lMark.clipsToBounds = YES;
    }else{
        [cell.lMark setBackgroundColor:[UIColor clearColor]];
    }
   
    cell.textLabel.text = a.subject;
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.font = [UIFont systemFontOfSize:FONT_SIZE];
    cell.detailTextLabel.text = a.createDate;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    [cell.textLabel setFrame:CGRectMake(CELL_CONTENT_MARGIN, CELL_CONTENT_MARGIN, CELL_CONTENT_WIDTH - (CELL_CONTENT_MARGIN * 2) - 30.0f, MAX(size.height, 21.0f))];
    [cell.detailTextLabel setFrame:CGRectMake(CELL_CONTENT_MARGIN, MAX(size.height, 31.0f), CELL_CONTENT_WIDTH, 21.0f)];
    return cell;*/
    DBMessageCell *msgCell = (DBMessageCell *)[tableView dequeueReusableCellWithIdentifier:@"DBMessageCell"];
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    
    [rightUtilityButtons addUtilityButtonWithColor:WT_RED icon:[UIImage imageNamed:@"ic_delete_grey"]];
    msgCell = [[DBMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DBMessageCell" containingTableView:tableView rowHeight:85 leftUtilityButtons:nil rightUtilityButtons:nil];
    
    NSString* avtar = @"";
    User* u = nil;
    NSString* title = @"";
    NSString* subTitle = @"";
    NSString* createDate = @"";
    u = USER;
    if (USER.company.filePath.count > 0){
        avtar = [USER.company.filePath objectAtIndex:0];
    }
    Announce *a = [announceArray objectAtIndex:indexPath.row];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSString *realName = [ user objectForKey:@"announceRealName"];
    
    title = realName;
    subTitle = a.subject;
    createDate = a.createDate;
    [msgCell.icon setImageWithURL:nil refreshCache:NO placeholderImage:[UIImage imageNamed:@"ic_unknow_avatar"]];
    if ([a.readStatus isEqual:UNREADED]) {
        msgCell.count.hidden = NO;
    }else{
        msgCell.count.hidden = YES;
        [msgCell.count setBackgroundColor:WT_RED];
    }
    
    [msgCell.count setTextColor:[UIColor whiteColor]];
    msgCell.count.layer.cornerRadius = 10;
    msgCell.count.layer.masksToBounds = YES;
    msgCell.title.text = title;
    msgCell.subTitle.text = subTitle;
    
    msgCell.flag.frame = CGRectMake(94,58,21,21);
    msgCell.flag.font = [UIFont fontWithName:kFontAwesomeFamilyName size:14];
    msgCell.flag.textAlignment = UITextAlignmentLeft;
     msgCell.flag.textColor = [UIColor colorWithHexString:@"#783207"];
//    saveImageView.text = [NSString fontAwesomeIconStringForEnum:ICON_SAVE];
    msgCell.flag.text = [NSString fontAwesomeIconStringForEnum:FABullhorn];
   // msgCell.flag.hidden = YES;  ICON_SAVE  FAenvelopeSquare
    
    msgCell.time.text = createDate;
    msgCell.selectionStyle = UITableViewCellSelectionStyleNone;
    msgCell.delegate = self;
    
    
    [LOCALMANAGER setReadedAnnounceStatus:announceArray[indexPath.row]];
    [[NSNotificationCenter defaultCenter] postNotificationName:SYNC_NOTIFICATION_MENU object:nil];
    return msgCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ((self.pullTableView.pullTableIsRefreshing == YES) || (self.pullTableView.pullTableIsLoadingMore ==YES)) {
        return;
    }
    if ([announceArray count] > 0) {
        [VIEWCONTROLLER create:self.parentCtrl.navigationController ViewId:FUNC_ANNOUNCE Object:[announceArray objectAtIndex:indexPath.row] Delegate:nil NeedBack:YES];
        
        [self setReadedAnnounce:[announceArray objectAtIndex:indexPath.row] Index:indexPath.row];
    }
}

- (void) setReadedAnnounce:(Announce*) m Index:(int) i{
    Announce_Builder* sb = [m toBuilder];
    [sb setReadStatus:READED];
    Announce* nm = [sb build];
    [announceArray removeObjectAtIndex:i];
    [announceArray insertObject:nm atIndex:i];
    
    [self.pullTableView reloadData];
}

#pragma mark - PullTableViewDelegate

- (void)pullTableViewDidTriggerRefresh:(PullTableView *)pullTableView
{
    [self performSelector:@selector(refreshTable) withObject:nil afterDelay:RELOAD_DELAY];
}

- (void)pullTableViewDidTriggerLoadMore:(PullTableView *)pullTableView
{
    [self performSelector:@selector(loadMoreDataToTable) withObject:nil afterDelay:RELOAD_DELAY];
}

/*-(void)announceToMessage:(NSDictionary *)dict{
    
    SRWebSocket *webSocket = [dict objectForKey:@"websocket"];
    NSData *message = [dict objectForKey:@"message"];
    [self webSocket:webSocket didReceiveMessage:message];
    
}
*/
- (void) didReceiveMessage:(id)message{
    SessionResponse* cr = [SessionResponse parseFromData:(NSData*)message];
    if ([super validateResponse:cr]) {
        HUDHIDE2;
        self.pullTableView.pullTableIsRefreshing = NO;
        self.pullTableView.pullTableIsLoadingMore = NO;
        return;
    }
    if (INT_ACTIONTYPE(cr.type) == ActionTypeMessageList){
        /*NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:webSocket,@"websocket",message,@"message", nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:MESSAGE_NOTIFICATION object:dict];*/
        [[NSNotificationCenter defaultCenter] postNotificationName:MESSAGE_NOTIFICATION object:nil];
        return;
    }
    
    if ((INT_ACTIONTYPE(cr.type)  == ActionTypeAnnounceList) && ([cr.code isEqual: NS_ACTIONCODE(ActionCodeDone)])){
        NSLog(@"get announce finished");
        PageAnnounce* pageAnnounce = [PageAnnounce parseFromData:cr.data];
        int announceCount = pageAnnounce.announces.count;
        if (currentPage == 1)
            [self clearTable];
        
        for (int i = 0 ;i < announceCount;i++){
            Announce* announce = (Announce*)[[pageAnnounce announces] objectAtIndex:i];
            [announceArray addObject:announce];
            
        }
        pageSize = pageAnnounce.page.pageSize;
        totleSize = pageAnnounce.page.totalSize;
        
        if (announceArray.count == 0) {
            [MESSAGE showMessageWithTitle:TITLENAME(FUNC_MESSAGE_DES)                              description:NSLocalizedString(@"noresult", @"")
                                     type:MessageBarMessageTypeInfo
                              forDuration:INFO_MSG_DURATION];
        }
    }
    
    [super showMessage2:cr Title:TITLENAME(FUNC_MESSAGE_DES) Description:@""];
    
    if (INT_ACTIONTYPE(cr.type)  == ActionTypeAnnounceList){
        [self.pullTableView reloadData];
        
        self.pullTableView.pullTableIsRefreshing = NO;
        self.pullTableView.pullTableIsLoadingMore = NO;
    }
    HUDHIDE2;
}

-(void)viewWillAppear:(BOOL)animated{
    CGRect frame = self.pullTableView.frame;
    [self.pullTableView setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, MAINHEIGHT-20)];
}

- (void) didFailWithError:(NSError *)error{
    self.pullTableView.pullTableIsRefreshing = NO;
    self.pullTableView.pullTableIsLoadingMore = NO;
    
    [super didFailWithError:error];
}

- (void) didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
    self.pullTableView.pullTableIsRefreshing = NO;
    self.pullTableView.pullTableIsLoadingMore = NO;
    [super didCloseWithCode:code reason:reason wasClean:wasClean];
}


@end
