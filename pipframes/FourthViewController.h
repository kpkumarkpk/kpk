//
//  FourthViewController.h
//  secondapp
//
//  Created by OUTTHINKING PVT LTD on 1/29/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OT_TabBar.h"
#import "Config.h"

#import "FilterViewController.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

#import "ShareViewController.h"

#define Top_Strip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)


#define but_width    ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 30 : 25)
#define but_height   ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 30 : 25)
#define Sticker_width   ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 200 : 100)
#define def_fontsize 20


@interface FourthViewController : UIViewController<UINavigationControllerDelegate,OT_TabBarDelegate,UIGestureRecognizerDelegate, UITextFieldDelegate,UIScrollViewDelegate>



@property(nonatomic,strong)UIButton *sizes,*style,*color,*opacity,*colorbutton,*sizebutton,*stylebutton,*applystylebt,*applycolbt,*applysizebt,*stickerapplybt,*applyfontbt;

@property (nonatomic, readonly) NSInteger myintegers;

@property(nonatomic,strong) UIImageView *backgroundstripimgv,*blurimgv,*stickerimgv;

@property(nonatomic,strong) UIImage *thirdimage;

@property(nonatomic,strong) UIView *stickerview,*downvw;

@property(nonatomic,strong) OT_TabBar *bottommenubar;

@property(nonatomic,strong) UIScrollView *downscro;

@property(nonatomic,strong)NSArray *fontarray,*colorarray,*stickerlargarr,*sizearray,*stickers;

@property(nonatomic,strong) NSString *familyname,*fontname;

@property(nonatomic,strong) UIPanGestureRecognizer *panGestureforsticker,*textpanGesture;

@property(nonatomic,strong) UIPinchGestureRecognizer *pinchforsticker;

@property(nonatomic,strong) UIRotationGestureRecognizer *rotationforsticker,*textrotation;


@end
