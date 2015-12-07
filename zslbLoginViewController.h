//
//  zslbLoginViewController.h
//  zslb
//
//  Created by zhangchao on 15/11/26.
//  Copyright © 2015年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Leo/Leo.h>

@interface zslbLoginViewController : UIViewController<UITextFieldDelegate,PostDelegate>{
    NSUserDefaults *KeyChain;
}

@property (retain, nonatomic) IBOutlet UISwitch *autologinswitch;
@property (retain, nonatomic) IBOutlet UISwitch *keepkeyswitch;
@property (strong, nonatomic) IBOutlet UITextField *ID;
@property (strong, nonatomic) IBOutlet UIButton *signin;
@property (strong, nonatomic) IBOutlet UITextField *PW;
- (IBAction)keyboarddisapper:(id)sender;
- (IBAction)topassword:(id)sender;
- (IBAction)dis:(id)sender;
- (IBAction)signinbt;
- (IBAction)keepkey:(id)sender;
- (IBAction)autologin:(id)sender;


@end

