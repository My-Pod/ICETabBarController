//
//  GMXTabbarController.m
//  GMXTabbarController
//
//  Created by WLY on 16/2/7.
//  Copyright © 2016年 WLY. All rights reserved.
//

#import "ICETabbarController.h"
@interface ICETabbarController ()<UITabBarControllerDelegate>
@end

@implementation ICETabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self setValue:self.myTabbar forKey:@"tabBar"];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (ICETabbar *)myTabbar{

    if (!_myTabbar) {
        _myTabbar = [[ICETabbar alloc] init];
        _myTabbar.frame = self.tabBar.bounds;
        _myTabbar.backgroundColor = [UIColor whiteColor];
        [_myTabbar didSelectedItem:^(NSInteger index) {
            self.selectedIndex = index;
        }];
    }
    return _myTabbar;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}





- (id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
            animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                              toViewController:(UIViewController *)toVC
{
    return [[TabSwitchAnimationController alloc] init];
}

@end


@implementation TabSwitchAnimationController

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController* fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController* toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView* toView = toVC.view;
    UIView* fromView = fromVC.view;
    
    UIView* containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    toView.frame = [transitionContext finalFrameForViewController:toVC];
    
    // Animate by fading
    toView.alpha = 0.0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut | UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         toView.alpha = 1.0;
                     }
                     completion:^(BOOL finished) {
                         toView.alpha = 1.0;
                         [fromView removeFromSuperview];
                         [transitionContext completeTransition:YES];
                     }];
}

@end
