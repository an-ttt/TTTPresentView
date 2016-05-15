//
//  ViewController.m
//  TTTPresentViewController
//
//  Created by an_ttt on 16/5/14.
//  Copyright © 2016年 an_ttt. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+TTTPresentView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //开启btn
    UIButton * openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    openBtn.frame = CGRectMake((self.view.frame.size.width - 100)/2.0, 300, 100, 40);
    [openBtn setTitle:@"Present" forState:UIControlStateNormal];
    [openBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [openBtn addTarget:self action:@selector(presentViewcontroller) forControlEvents:UIControlEventTouchUpInside];
    
    //组件也要加在rootVC上面
    [self.view addSubview:openBtn];
    
    
}

- (void)presentViewcontroller
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *toPresentVC = [sb instantiateViewControllerWithIdentifier:@"DemoToPresentViewContorller"];
    
    [self TTTPresentViewController:toPresentVC percentToShow:0.5];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
