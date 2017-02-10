//
//  ThirdViewController.h
//  secondapp
//
//  Created by OUTTHINKING PVT LTD on 1/28/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FourthViewController.h"

#import <Photos/Photos.h>
#import "Config.h"

#import <GoogleMobileAds/GoogleMobileAds.h>

#import "OT_TabBar.h"

#define downstrip_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)

#define addeffectsmenu_strip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)

#define IS_IPHONE_6 (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone && fullScreen.size.height > 667.0)


@interface ThirdViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,UIActionSheetDelegate,OT_TabBarDelegate,GADInterstitialDelegate,UIPopoverControllerDelegate,UIAlertViewDelegate>

@property(nonatomic,retain) UIImage *selimg;

@property(nonatomic,strong)OT_TabBar *customtabbar;

@property(nonatomic,strong) UIImageView *blurredimgv;

@property(nonatomic,strong) UIImage *blurredimage;



@property(nonatomic,strong) UIButton *pipbt;

@property(nonatomic,strong) UIButton *gallerybt;

@property(nonatomic,strong) UIButton *filterbt;

@property(nonatomic,strong) UIButton *nextbt;


@property(nonatomic,strong) UIView *mainview;

@property(nonatomic,strong) UIImageView *maskimgv;

@property(nonatomic,strong) UIScrollView *scroll;

@property(nonatomic,strong) UIImageView *clearedimgv;


@property(nonatomic,strong) UIScrollView *downscroll;

@property(nonatomic,strong) NSArray *menuitems;

@property(nonatomic,strong) UIButton *mybutton;

@property(nonatomic,strong) NSArray *maskimages;

@property(nonatomic,strong) NSArray *shapeimages;

@property(nonatomic,strong)  UIImageView *shapeimgv;



@property(nonatomic,strong) UIButton *filterbutton;

@property(nonatomic, retain) GADInterstitial *interstitial;


@property(nonatomic,strong)  NSArray *filterNames;

@property(nonatomic,strong) UIImageView *backgroundstripimagev;


@property(nonatomic,strong) UIImage *frontimage;

@property(nonatomic,strong) UIImage *backimage;






-(void)pickforegroundimagefromgallery;



















@end
