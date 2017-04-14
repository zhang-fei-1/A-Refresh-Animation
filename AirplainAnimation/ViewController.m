//
//  ViewController.m
//  AirplainAnimation
//
//  Created by QingFengiOS_1 on 17/4/13.
//  Copyright © 2017年 QingFengiOS_1. All rights reserved.
//

#import "ViewController.h"
#import "HeadBgView.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) HeadBgView *headView;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self viewInit];
}

- (void)viewInit {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
   
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView.showsHorizontalScrollIndicator = NO;
    
    self.tableView.estimatedRowHeight = 20;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 15)];
    
    self.tableView.tableFooterView = footerView;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellid"];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    self.headView = [[HeadBgView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 200)];
    
    return self.headView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 200;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat width = self.view.frame.size.width; // 图片宽度
    
    CGFloat yOffset = scrollView.contentOffset.y;  // 偏移的y值
    
    if (yOffset < 0) {
        
        CGFloat totalOffset = 200 + ABS(yOffset);
        
        CGFloat f = totalOffset / 200;
        
        self.headView.bgImageView.frame =  CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalOffset); //拉伸后的图片的frame应该是同比例缩放。
        
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {

    [self.headView starAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
