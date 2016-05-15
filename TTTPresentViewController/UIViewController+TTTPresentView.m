//
//  UINavigationController+TTTPresentViewController.m
//  TTTPresentViewController
//
//  Created by an_ttt on 16/5/14.
//  Copyright © 2016年 an_ttt. All rights reserved.
//

#import "UIViewController+TTTPresentView.h"
#import "TTTPresentContainerView.h"
#import "AppDelegate.h"

@implementation UIViewController (TTTPresentView)

//percentToShow 是toPresentView 露出多少的比例，100%是全覆盖
- (void)TTTPresentViewController:(UIViewController* _Nonnull)viewControllerToPresent percentToShow:(CGFloat)percentToShow
{
     NSAssert(self.navigationController, @"必须要找出navigation，而且所传的view必须要embed一个navigation controller");
    
    [self.navigationController addChildViewController:viewControllerToPresent];
    
    TTTPresentContainerView *containerView = [[TTTPresentContainerView alloc] initWithFrame:self.view.frame];
    [self.navigationController.view addSubview:containerView];
    
    [containerView addMainView:viewControllerToPresent.view percentToShow:percentToShow];
    [containerView presentView];
}



@end
