//
//  zslbMainTabBarViewController.h
//  zslb
//
//  Created by zhangchao on 15/11/26.
//  Copyright © 2015年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationDelegate <NSObject>
@optional
- (void)showLeftViewController:(BOOL)animated;
- (void)hideSideViewController:(BOOL)animated;
- (void)setneedSwipeShowMenu:(BOOL)animated;
@end

@interface zslbMainTabBarViewController : UITabBarController<UITabBarDelegate>
@property(assign,nonatomic)id<NavigationDelegate>NavigationDelegate;

@end
