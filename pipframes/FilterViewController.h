//
//  FilterViewController.h
//  
//
//  Created by OUTTHINKING PVT LTD on 4/6/16.
//
//

#import <UIKit/UIKit.h>

#import "Config.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"
#define downstrip_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)

#define addeffectsmenu_strip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)

@interface FilterViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,UIActionSheetDelegate,GADInterstitialDelegate,UIPopoverControllerDelegate,UIAlertViewDelegate>

@property(nonatomic,retain) UIImage *selimg;


@property(nonatomic,strong) UIImageView *blurredimgv;
@property(nonatomic,strong) UIImage *blurredimage;


@property(nonatomic,strong) UIButton *filterbt;

@property(nonatomic,strong) UIView *mainview;

@property(nonatomic,strong) UIImageView *maskimgv;

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

@property(nonatomic,strong)  UIImage  *activeimage;

@property(nonatomic,strong) UIImage *blurredImage1;

@property(nonatomic,strong) UIImage *frontimage1;

@property(nonatomic,strong)UIImage *newimage1;

@property(nonatomic,strong) UIImage *frontimage;

-(void)pickforegroundimagefromgallery;

- (UIImage *)add_EffectOnImage:(UIImage *)image effectNumber:(int)effectNo;
@end
