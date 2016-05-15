# TTTPresentView
PresentView like jianshu JD
![image](https://github.com/an-ttt/TTTPresentView/blob/master/TTTPresentView.gif)


two steps：
```object-c
1. 
#import "UIViewController+TTTPresentView.h"

  [self TTTPresentViewController:toPresentVC percentToShow:0.5];

2.
#import "TTTPresentContainerView.h"
- (IBAction)dismissView:(UIButton *)sender
{
    
    TTTPresentContainerView *containerVC = (TTTPresentContainerView *)self.view.superview;
    
    NSAssert(containerVC && [containerVC isKindOfClass:[TTTPresentContainerView class]], @"TTTPresentContainerView *containerVC = ((UIView *)self).superview should not nil");
    
    [containerVC dismissView];
}
```
