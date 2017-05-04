//
//  BoxViewController.m
//  SalesManager
//
//  Created by iOS-Dev on 16/8/24.
//  Copyright © 2016年 liu xueyan. All rights reserved.
//

#import "BoxViewController1.h"
#import "HeaderSearchBar.h"
#import "TestCell.h"
#import "UIView+CNKit.h"
#import "UIView+Util.h"
#import "DepartmentViewController.h"
#import "NameFilterViewController.h"

@interface BoxViewController1 ()<UITableViewDelegate,UITableViewDataSource,TestCellDelegate,HeaderSearchBarDelegate,DepartmentViewControllerDelegate,NameFilterViewControllerDelegate> {
    UIButton *button;
    UITableView *tableView;
    UIView *rightView;
    HeaderSearchBar *_searchBar;
    
    NSMutableArray*         _searchViews;
    NSMutableArray*         _departments;
    NSMutableArray*  _checkDepartments;
    NSMutableArray *contacts;
    NSMutableArray *departNameMularray;
}

@end


@implementation BoxViewController1


- (void)viewDidLoad {
    [super viewDidLoad];
    [lblFunctionName setText:@"请选择"];
    self.selectorPatnArray = [[NSMutableArray alloc]init];
    rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 60)];
    UIImageView *listImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 17, 25, 25)];
    [listImageView setImage:[UIImage imageNamed:@"ab_icon_save"]];
    UITapGestureRecognizer *tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toSave)];
    [tapGesture1 setNumberOfTapsRequired:1];
    listImageView.userInteractionEnabled = YES;
    listImageView.contentMode = UIViewContentModeScaleAspectFit;
    [listImageView addGestureRecognizer:tapGesture1];
    [rightView addSubview:listImageView];
    [listImageView release];
    [tapGesture1 release];
    
    UIBarButtonItem *btRight = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.rightButton = btRight;
    [btRight release];
    
    
    _searchBar = [[HeaderSearchBar alloc] initWithFrame:CGRectMake(0,0, MAINWIDTH, 45)];
    NSArray* titles = [NSArray arrayWithObjects:@"部门",@"筛选", nil];
    NSArray*  icons = [NSArray arrayWithObjects:@"",@"",nil];
    _searchBar.titles = [titles copy];
    _searchBar.icontitles = [icons copy];
    _searchBar.delegate = self;
    _searchBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_searchBar];
    
    
    _searchViews = [[NSMutableArray alloc] initWithCapacity:1];
    _departments = [[LOCALMANAGER getDepartments] retain];
    _checkDepartments = [[NSMutableArray alloc] initWithCapacity:0];
    //部门视图
    DepartmentViewController* departmentVC = [[DepartmentViewController alloc] init];
    departmentVC.departmentArray = _departments;
    departmentVC.delegate = self;
    departmentVC.view.frame = CGRectMake(0, _searchBar.bottom, MAINWIDTH, MAINHEIGHT - 44);
    [self addChildViewController:departmentVC];
    [_searchViews addObject:self.childViewControllers.firstObject.view];
    [departmentVC release];
    
    //筛选视图
    NameFilterViewController* nameFilterVC = [[NSBundle mainBundle] loadNibNamed:@"NameFilterViewController" owner:self options:nil][0];
    nameFilterVC.y = _searchBar.bottom;
    nameFilterVC.delegate = self;
    [_searchViews addObject:nameFilterVC];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, _searchBar.bottom, MAINWIDTH, MAINHEIGHT) style:UITableViewStylePlain];
    tableView.delegate =self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview: tableView];
    
    //移除之前选中的内容
    if (self.selectorPatnArray.count > 0) {
        [self.selectorPatnArray removeAllObjects];
    }
    
}

-(void)toSave {
    if (self.myBlock != nil) {
        self.myBlock(self.selectorPatnArray);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"选中个数是 : %lu   内容为 : %@",(unsigned long)self.selectorPatnArray.count,self.selectorPatnArray);
}

-(void)getUserTrtByBlock:(BoxBlock)block {
    self.myBlock = block;
}


#pragma -mark HeaderSearchBar delegate
-(void)HeaderSearchBarClickBtn:(int)index current:(int)current{
    NSLog(@"日志搜索条选择了:%d",index);
    if (current == index) {
        [UIView removeViewFormSubViews:-1 views:_searchViews ];
    }else{
        [UIView addSubViewToSuperView:self.view subView:_searchViews[index]];
        [UIView removeViewFormSubViews:index views:_searchViews];
    }
    
}

#pragma -mark DepartmentViewControllerDelegate
-(void)didFnishedCheck:(NSMutableArray *)departments{
    NSLog(@"选择了 %d 个部门",departments.count);
    _checkDepartments = [departments retain];
    
    //设置状态
    [_searchBar setColor:0];
    [UIView removeViewFormSubViews:-1 views:_searchViews];
    NSMutableString* sb = [[NSMutableString alloc] init];
    int i = 0;
    for (Department* item in departments) {
        if (i > 5) {
            break;
        }
        [sb appendFormat:@"%@,",item.name];
        i++;
    }
    UIButton* btn = _searchBar.buttons[0];
    [btn setTitle:departments.count > 0 ?[sb substringToIndex:sb.length - 1] : _searchBar.titles[0] forState:UIControlStateNormal];
    
    [self refreshParamsAndTable];
}

-(void)refreshParamsAndTable {
    departNameMularray = [[NSMutableArray alloc] init];
    [_checkDepartments enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [departNameMularray addObject:((Department*)obj).name];
    }];
  contacts = [[NSMutableArray alloc] initWithArray:[LOCALMANAGER getAllUsers]];
  NSMutableArray *mulArray = [[NSMutableArray alloc] init];
    
   [contacts enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
   
      if ([departNameMularray containsObject:((User*)obj).department.name]) {
          [mulArray addObject:obj];
      }
       }];
    
    NSMutableArray *nameMuArray = [[NSMutableArray alloc] init];
    
   [mulArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       [nameMuArray addObject:((User*)obj).realName];
   }];
    
    self.boxMulArray = nameMuArray ;
  [tableView reloadData];

}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.boxMulArray.count;
    
}

#pragma mark cellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    if (!cell) {
        cell = [[TestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TestCell"];
    }
    
//    NSMutableArray *array = [[NSMutableArray alloc]init];
//    [self.boxMulArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [array addObject:[obj objectForKey:@"content"]];
//    }];
    
    cell.testLb.text = self.boxMulArray[indexPath.row];
    cell.testBtn.tag = indexPath.row;
    cell.delegate = self;
    
    return cell;
    
}


#pragma mark -TestCell Delegate
-(void)SelectedCell:(UIButton *)sender{
    if (sender.selected) {
        [self.selectorPatnArray  addObject:self.boxMulArray[sender.tag]];//选中添加
    }else{
        [self.selectorPatnArray removeObject:self.boxMulArray[sender.tag]];//再选取消
    }
    for (int i=0; i<self.selectorPatnArray.count; i++) {
        NSLog(@"%@",self.selectorPatnArray[i]);//便于观察选中后的数据
    }
    NSLog(@"==============");
}


-(void)clickLeftButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
