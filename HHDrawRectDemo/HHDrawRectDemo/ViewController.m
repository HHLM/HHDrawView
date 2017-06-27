//
//  ViewController.m
//  HHDrawRectDemo
//
//  Created by LXH on 2017/6/23.
//  Copyright © 2017年 HHLM. All rights reserved.
//

#import "ViewController.h"
#import "HHDrawRectVC.h"
#import "HHPaintVC.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *titles1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titles = @[@"绘制文本",@"绘制线条",@"绘制矩形",@"绘制圆形",@"绘制虚线",@"绘制图片",@"全部"];
    _titles1 = @[@"涂鸦一下吧"];
    [self.view addSubview:self.myTableView];
}
- (UITableView *)myTableView
{
    if (!_myTableView)
    {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return section?@"贝塞尔曲线UIBezierPath":@"UIGraphics画线";
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _titles.count;
    }
    return _titles1.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = indexPath.section?_titles1[indexPath.row]: _titles[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        HHPaintVC *vc = [[HHPaintVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    else
    {
        HHDrawRectVC *vc = [[HHDrawRectVC alloc] init];
        vc.type = indexPath.row;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}

@end
