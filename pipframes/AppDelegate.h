//
//  AppDelegate.h
//  pipframes
//
//  Created by OUTTHINKING PVT LTD on 4/5/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

#import "ViewController.h"

#import "REFrostedViewController.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate,UINavigationControllerDelegate, REFrostedViewControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;


@end

