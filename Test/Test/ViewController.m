//
//  ViewController.m
//  Test
//
//  Created by Jason on 2019/11/21.
//  Copyright © 2019 Jason. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import "BaseViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *itemsArray;
@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Runtime Demo";
    self.view.backgroundColor = UIColor.whiteColor;
    self.itemsArray = @[@"更改属性值", @"动态添加属性", @"动态添加方法",@"交换方法的实现",@"在方法上增加额外功能"];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView setTableFooterView:[UIView new]];
}

#pragma mark UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"textCell"];
    cell.textLabel.text = self.itemsArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *classString = [NSString stringWithFormat:@"Page0%ldController",indexPath.row+1];
    const char *className = [classString UTF8String];
    BaseViewController *vc = objc_msgSend(objc_getClass(className),sel_registerName("new"));;
    vc.title = self.itemsArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
