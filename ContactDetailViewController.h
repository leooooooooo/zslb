//
//  ContactDetailViewController.h
//  wlkg
//
//  Created by zhangchao on 15/7/28.
//  Copyright (c) 2015年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
@interface ContactDetailViewController : UIViewController
@property (nonatomic,retain)Person *Person;

@property (nonatomic ,retain) UIColor *navigationBackArrowColor;
@property (nonatomic ,retain) UIColor *navigationBarColor;
@property (nonatomic ,retain) UIColor *navigationTitleColor;

@end
