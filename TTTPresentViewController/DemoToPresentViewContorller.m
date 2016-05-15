//
//  DemoToPresentViewContorller.m
//  TTTPresentViewController
//
//  Created by an_ttt on 16/5/14.
//  Copyright © 2016年 an_ttt. All rights reserved.
//

#import "DemoToPresentViewContorller.h"

#import "TTTPresentContainerView.h"

@interface DemoToPresentViewContorller ()

@property (nonatomic, strong) UITableView *myTableview;

@end

@implementation DemoToPresentViewContorller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)dismissView:(UIButton *)sender
{
    
    TTTPresentContainerView *containerVC = (TTTPresentContainerView *)self.view.superview;
    
    NSAssert(containerVC && [containerVC isKindOfClass:[TTTPresentContainerView class]], @"TTTPresentContainerView *containerVC = ((UIView *)self).superview should not nil");
    
    [containerVC dismissView];
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
