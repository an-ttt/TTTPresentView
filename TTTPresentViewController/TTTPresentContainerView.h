//
//  TTTPresentContainerView.h
//  TTTPresentContainerView
//
//  Created by an_ttt on 16/5/14.
//  Copyright © 2016年 an_ttt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTPresentContainerView : UIView

- (void)presentView;
- (void)dismissView;

- (void)addMainViewController:(UIViewController *)viewController percentToShow:(CGFloat)percentToShow;
@end
