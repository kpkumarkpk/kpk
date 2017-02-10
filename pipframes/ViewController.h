//
//  ViewController.h
//  pipframes
//
//  Created by OUTTHINKING PVT LTD on 4/5/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterViewController.h"
#import "FourthViewController.h"
#import "ShareMediaTypeSelectionController.h"
#import "StartAdViewController.h"

#import <FBSDKShareKit/FBSDKShareKit.h>

#import <Accounts/Accounts.h>
#import <Social/Social.h>

#import "ImageCropView.h"


#define startButton_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?200.0:120.0)

#define title_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?120.0:80.0)

#define title_font ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:35.0)

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UIWebViewDelegate,FBNativeAdDelegate>

@property(nonatomic,assign) BOOL isSelectionOptionEnable;

- (void)loadAd;



@end

