//
//  PreviewViewController.h
//  pipframes
//
//  Created by Outthinking Mac on 7/11/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//


#import <UIKit/UIKit.h>

#import "Config.h"

#import <GoogleMobileAds/GoogleMobileAds.h>
#import "PreviewViewController.h"







#define downstrip_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)

#define addeffectsmenu_strip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)




@interface PreviewViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,UIActionSheetDelegate,GADInterstitialDelegate,UIPopoverControllerDelegate,UIAlertViewDelegate>



@property(nonatomic,strong) UIImageView *blurredimgv1;
@property(nonatomic,strong)UIImageView *clearedimgv1;
@property(nonatomic,strong)UIImage*sampleimg2;
@property(nonatomic, retain) GADInterstitial *interstitial;
@end
