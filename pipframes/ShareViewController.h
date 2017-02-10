//
//  ShareViewController.h
//  secondapp
//
//  Created by OUTTHINKING PVT LTD on 2/3/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//
//
#import <UIKit/UIKit.h>

#import "Config.h"
#import <FBAudienceNetwork/FBAudienceNetwork.h>

#import <MessageUI/MessageUI.h>

@import FBSDKShareKit;


#import <FBSDKShareKit/FBSDKShareKit.h>

#define Share_Strip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)
#define websiteUrl @"http://www.outthinkingindia.com"
#define facebookId @"564692443591238"
//#define instagramUrl @"http://www.instagram.com/outthinking"
#define facebookUrl @"fb://profile/%@"
#define moreAppsUrl @"http://appstore.com/outthinkinglimited"

@interface ShareViewController : UIViewController<UIImagePickerControllerDelegate,UIWebViewDelegate,MFMailComposeViewControllerDelegate >

@property(nonatomic,strong)UIView *shareview;
@property(nonatomic,strong)UIImage *finalscreenshot;
@property(nonatomic,strong)UIImageView *finalscreen;

@end

