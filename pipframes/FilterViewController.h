//
//  FilterViewController.h
//  
//
//  Created by OUTTHINKING PVT LTD on 4/6/16.
//
//

#import <UIKit/UIKit.h>
#import "FourthViewController.h"
#import "Config.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "OT_TabBar.h"
#import "touch.h"
#import "SSAlphaPassView.h"
#import "SSAlphaPassButton.h"



#define downstrip_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)


@interface FilterViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,OT_TabBarDelegate,GADInterstitialDelegate,UIAlertViewDelegate>

@property(nonatomic,retain) UIImage *selimg, *activeimage,*frontimage1,*newimage1, *frontimage,*blurredImage1,*blurredimage;

@property(nonatomic,strong)OT_TabBar *customtabbar;

@property(nonatomic,strong) UIImageView *blurredimgv,*backgroundstripimagev,*clearedimgv, *maskimgv,*shapeimgv;

@property(nonatomic,strong) UIButton  *filterbutton ,*mybutton;

@property(nonatomic,strong) UIScrollView *downscroll;

@property(nonatomic,strong) NSArray *maskimages,*filterNames,*menuitems,*shapeimages;

@property(nonatomic, retain) GADInterstitial *interstitial;


@end
