//
//  UIViewController+TTTPresentView.h
//  TTTPresentViewController
//
//  Created by an_ttt on 16/5/14.
//  Copyright © 2016年 an_ttt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTTPresentViewDelegate <NSObject>
@required //必须
- (void)dismissView;
@end


@interface UIViewController (TTTPresentView)

- (void)TTTPresentViewController:(UIViewController* _Nonnull)viewControllerToPresent percentToShow:(CGFloat)percentToShow;
@end
