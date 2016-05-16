//
//  TTTPresentContainerView.m
//  TTTPresentContainerView
//
//  Created by an_ttt on 16/5/14.
//  Copyright © 2016年 an_ttt. All rights reserved.
//
#include <objc/runtime.h>

#import "TTTPresentContainerView.h"

#define KScaleFactor 0.8
#define KYOffsetFactor 0.06


@interface TTTPresentContainerView ()

@property (nonatomic, strong)UIViewController *mainViewController;
@property (nonatomic, strong)UIView *mainView;
@property (nonatomic, strong)UIView *shadowView;

@property (nonatomic, weak)UINavigationController *naviController;

@end

@implementation TTTPresentContainerView


- (UIView *)shadowView
{
    if (!_shadowView) {
        
        _shadowView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
        _shadowView.backgroundColor = [UIColor blackColor];
        _shadowView.alpha = 0.0;
        
        UITapGestureRecognizer *tapShadowView = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTabShadowView)];
        [_shadowView addGestureRecognizer:tapShadowView];
    }
    
    return _shadowView;
}

- (UINavigationController *)findNaviViewController:(UIView *)sourceView
{
    id target=sourceView;
    while (target) {
        target = ((UIResponder *)target).nextResponder;
        if ([target isKindOfClass:[UINavigationController class]]) {
            break;
        }
    }
    return target;
}


- (void)addMainViewController:(UIViewController *)viewController percentToShow:(CGFloat)percentToShow
{
    //add shadow view
    [self addSubview:self.shadowView];
    
    _mainViewController = viewController;
    _mainView = viewController.view;
    _mainView.frame = CGRectMake(0.0f, self.frame.size.height, self.frame.size.width, self.frame.size.height * percentToShow);
    [self addSubview:_mainView];
    
    _mainView.alpha = 0.5;
 
    _naviController = viewController.navigationController;
    NSAssert(_naviController, @"必须要找出navigation，而且所传的view必须要embed一个navigation controller");
}

- (void)didTabShadowView
{
    [self dismissView];
}

- (void)presentView
{
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [self.naviController.view.layer setTransform:[self firstTransform]];

        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [self.naviController.view.layer setTransform:[self secondTransform]];
            //显示shadowView
            [self.shadowView setAlpha:0.5f];
            //上升
            //算出缩小时候每份的width 和 height：/ (KScaleFactor * 10)
            CGFloat factorWidth = self.mainView.frame.size.width / (KScaleFactor * 10);
            CGFloat offsetX = factorWidth * (1 - KScaleFactor) / 2 * 10;
            
            CGFloat factorHeight = self.frame.size.height / (KScaleFactor * 10);
            CGFloat offsetY = factorHeight * (1 - KScaleFactor) / 2 * 10;
            //KYOffsetFactor 偏移量经过transform之后的偏移量
            CGFloat offsetYAfterTransform = self.frame.size.height * KYOffsetFactor / KScaleFactor;

            self.mainView.frame = CGRectMake(self.mainView.frame.origin.x - offsetX, self.frame.size.height - self.mainView.frame.size.height, self.mainView.frame.size.width + 2 * offsetX, self.mainView.frame.size.height + offsetY +offsetYAfterTransform);
            
        } completion:^(BOOL finished) {
            
        }];
        
    }];

}

- (void)dismissView
{

    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [self.naviController.view.layer setTransform:[self firstTransform]];
        //下沉
        self.mainView.frame = CGRectMake(self.mainView.frame.origin.x, self.frame.size.height, self.mainView.frame.size.width, self.mainView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [self.naviController.view.layer setTransform:CATransform3DIdentity];
            
            //消失shadowView
            [self.shadowView setAlpha:0.0f];
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
            [_mainViewController removeFromParentViewController];
        }];
        
    }];

}

#pragma mark transform
- (CATransform3D)firstTransform{
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    //带点缩小的效果
    t1 = CATransform3DScale(t1, 0.95, 0.95, 1);
    //绕x轴旋转
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1, 0, 0);
    return t1;
    
}

- (CATransform3D)secondTransform{
    
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = [self firstTransform].m34;
    //向上移
    t2 = CATransform3DTranslate(t2, 0, self.frame.size.height * (-KYOffsetFactor), 0);
    //第二次缩小
    t2 = CATransform3DScale(t2, KScaleFactor, KScaleFactor, 1);
    return t2;
}

@end
