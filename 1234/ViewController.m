//
//  ViewController.m
//  1234
//
//  Created by 李冰 on 2019/4/20.
//  Copyright © 2019 李冰. All rights reserved.
//

#import "ViewController.h"

// 屏幕尺寸
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width

/*顶部安全区域远离高度*/
#define kTopBarSafeHeight (CGFloat)(kIs_iPhoneX?(44.0):(0))
/*底部安全区域远离高度*/
#define kBottomSafeHeight (CGFloat)(kIs_iPhoneX?(34.0):(0))
/*iPhoneX的状态栏高度差值*/
#define kTopBarDifHeight (CGFloat)(kIs_iPhoneX?(24.0):(0))

#define kIs_iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kIs_iPhoneX ScreenW >=375.0f && ScreenH >=812.0f&& kIs_iphone
/*状态栏和导航栏总高度*/
#define kNavBarAndStatusBarHeight (CGFloat)(kIs_iPhoneX?(88.0):(64.0))

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.tabView];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenH-kBottomSafeHeight-50, ScreenW, 40)];
    bottomView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bottomView];
    
    self.navigationItem.title = @"啦啦啦";
}

- (UITableView *)tabView{
    if (!_tabView) {
        //        _tabView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        //        _tabView.frame = CGRectMake(0, 40, ScreenW, ScreenH-kNavAndTabHeight-40);
        _tabView = [[UITableView alloc] initWithFrame:CGRectMake(0, kTopBarSafeHeight, ScreenW, ScreenH-kBottomSafeHeight-kTopBarSafeHeight) style:UITableViewStyleGrouped];
        _tabView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
        
        _tabView.delegate = self;
        _tabView.dataSource = self;
        _tabView.backgroundColor = [UIColor whiteColor];
        //        _tabView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        _tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tabView.showsVerticalScrollIndicator = YES;//垂直滚动条
        
        [_tabView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCellIdentifier"];
    }
    return _tabView;
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellIdentifier" forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellIdentifier"];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = @"你妹，好着呢吧";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
}

#pragma mark - Header/Footer

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}



@end
