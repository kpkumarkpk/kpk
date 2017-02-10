//
//  ViewController.h
//  pipframes
//
//  Created by OUTTHINKING PVT LTD on 4/5/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilterViewController.h"
#import "ShareMediaTypeSelectionController.h"
#import "StartAdViewController.h"

#import <AVFoundation/AVFoundation.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "FilterViewController.h"
#import <FBAudienceNetwork/FBAudienceNetwork.h>


#define startButton_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?200.0:120.0)

#define title_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?120.0:80.0)

#define title_font ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:35.0)

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UIWebViewDelegate,GADNativeAdDelegate,GADInterstitialDelegate,FBNativeAdDelegate>

@property(nonatomic,assign) BOOL isSelectionOptionEnable;
@property(nonatomic,strong)NSURL *url;
@property(nonatomic,strong)UIImage* thumbImg;
@property(nonatomic,strong)AVAsset *sourceAsset;
@property(nonatomic,strong)NSURL *outputURL;
@property(nonatomic,strong)NSString *moviePath;
@property(nonatomic,strong)AVAsset *asset;

@property(nonatomic,strong) UIAlertView *toast ;
@property(nonatomic,strong)NSString *message;
@property (nonatomic,strong) NSTimer * timerSet;

- (void)loadAd;
- (void)exportDidFinish:(AVAssetExportSession*)session;
- (void)applyVideoEffectsToComposition:(AVMutableVideoComposition *)composition size:(CGSize)size;
@property(nonatomic, retain) NSString *videoPath;
- (void)mergeVideoUrl:(NSURL *) videoURL andOverlayImage:(UIImage *)overlayImage;
- (void) CropVideoSquare;


@end

