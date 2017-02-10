//
//  PreviewViewController.m
//  pipframes
//
//  Created by Outthinking Mac on 7/11/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import "PreviewViewController.h"
#import "ShareViewController.h"
#import "AppConfig.h"
@interface PreviewViewController ()

@end



#define screenWidth    ([[UIScreen mainScreen]bounds].size.width)
#define screenHeight   ([[UIScreen mainScreen]bounds].size.height)




@interface PreviewViewController ()<UINavigationControllerDelegate>
{
    
    
    UIImage *squaredscreenshotimg,*sampleimg,*activeimage1,*blurredimage1,*frontimage2,*maskimg,*filetrimg,*frontimage3;
    
       
    UIView *mainview1;
    
    UIImageView *maskimgv1,*shapeimgv1;
    Boolean buttonFlashing;
    UIButton* button;
    UIView* _topView ;
    UIButton*backButton1,*capture;
    UIImage *btnImage;
    GADInterstitial *interstitial;
}

@end

@implementation PreviewViewController

@synthesize blurredimgv1,clearedimgv1,sampleimg2,interstitial;



-(void)viewWillAppear:(BOOL)animated

{
    NSLog(@"viewWillAppear");
    buttonFlashing=NO;
    button.alpha = 1.0f;
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut |
     UIViewAnimationOptionRepeat |
     UIViewAnimationOptionAutoreverse |
     UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         button.alpha = 0.0f;
                         
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timerForSplash) name:UIApplicationWillEnterForegroundNotification object:nil];
   
    
    
}
- (GADInterstitial *)createAndLoadInterstitial
{
    interstitial =
    [[GADInterstitial alloc] initWithAdUnitID:fullscreen_Admob_id];
    interstitial.delegate = self;
    [interstitial loadRequest:[GADRequest request]];
    return interstitial;
}


- (void)interstitialWillPresentScreen:(GADInterstitial *)ad
{
    interstitial = [self createAndLoadInterstitial];
    NSLog(@"Google add gets loadedfr");
}

-(void)addPreLoad
{
    NSLog(@"llllllllll");
    if ([interstitial isReady])
    {
        
        [interstitial presentFromRootViewController:self];
    }
    
}


-(void)timerForSplash
{
    buttonFlashing=NO;
    button.alpha = 1.0f;
    [UIView animateWithDuration:0.4
     
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut |
     UIViewAnimationOptionRepeat |
     UIViewAnimationOptionAutoreverse |
     UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         button.alpha = 0.0f;
                         
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];

    NSTimer *timerSet;
    timerSet = [NSTimer scheduledTimerWithTimeInterval:0.0 target:self selector:@selector(aMethod) userInfo:nil repeats:YES];

    
}
- (void)viewDidLoad
{
    NSLog(@"viewWillAppea8888");
    
    blurredimgv1=[[UIImageView alloc]init];
    
    clearedimgv1=[[UIImageView alloc]init];
    
    maskimgv1=[[UIImageView alloc]init];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        blurredimgv1 . frame = CGRectMake(0,0, ImageView_Hieight+120, ImageView_Hieight+320);
        clearedimgv1 . frame = CGRectMake(50, 70, ImageView_Hieight+120,ImageView_Hieight+370);
        maskimgv1 . frame = CGRectMake(33,42, ImageView_Hieight+45,ImageView_Hieight+65);
        button.frame = CGRectMake(-25, 215.0, 370.0, 370.0);
        
        
    }
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        blurredimgv1 . frame = CGRectMake(0,0, ImageView_Hieight+120, ImageView_Hieight+330);
        clearedimgv1 . frame = CGRectMake(50, 70, ImageView_Hieight+120,ImageView_Hieight+370);
        maskimgv1 . frame = CGRectMake(33,42, ImageView_Hieight+45,ImageView_Hieight+65);
        button.frame = CGRectMake(25, 200.0, 270.0, 370.0);
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        blurredimgv1 . frame = CGRectMake(0,50, ImageView_Hieight+120, ImageView_Hieight+10);
        clearedimgv1 . frame = CGRectMake(140, 70, ImageView_Hieight+120,ImageView_Hieight+370);
        maskimgv1 . frame = CGRectMake(97,0, ImageView_Hieight-130,ImageView_Hieight-80);
        button.frame = CGRectMake(105, 523.0, 550.0, 550.0);
        
    }

   
    sampleimg=blurredimgv1.image;
    NSData* imageData = [[NSUserDefaults standardUserDefaults]objectForKey:@"SomeValue"];
    UIImage* image1 = [UIImage imageWithData:imageData];
    
    NSLog(@"image dfdgfdgfg is %@",image1);
    
    CGFloat width =sampleimg.size.width;
    CGFloat height =sampleimg.size.height;
    
    NSLog(@ "image orientation is %f %f",width,height);
    
 
    blurredimgv1.image=image1;
    blurredimgv1.contentMode=UIViewContentModeScaleAspectFill;

    NSLog(@"image is %@",blurredimgv1.image);
    
    [self.view addSubview:blurredimgv1];
    
    clearedimgv1.clipsToBounds = YES;
   
    frontimage2=[self squareImageFromImage:sampleimg2 scaledToSize:500];
   
    clearedimgv1.image=sampleimg2;

    [clearedimgv1 setUserInteractionEnabled:YES];
    [self.view addSubview:clearedimgv1];
    

    //--------mask imageview---------//
   
   
    maskimgv1.image=[UIImage imageNamed:@"glow-image.png"];
    
    [maskimgv1 setBackgroundColor:[UIColor clearColor]];
    
    
    [self.view addSubview:maskimgv1];
    [self.view bringSubviewToFront:maskimgv1];
    
     btnImage = [UIImage imageNamed:@"Focus_image.png"];
    [button setImage:btnImage forState:UIControlStateNormal];
    [self.view addSubview:button];

    
    interstitial = [[GADInterstitial alloc] initWithAdUnitID:fullscreen_admob_id];
    GADRequest *request = [GADRequest request];
    
    [interstitial loadRequest:request];
    
    
    interstitial = [self createAndLoadInterstitial];
    
    [self addPreLoad];

    
    [self aMethod];
    [self allocatemenubarforaddframespage];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(aMethod) name:UIApplicationWillEnterForegroundNotification object:nil];

    [super viewDidLoad];
    
    
}
- (UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize {
    CGAffineTransform scaleTransform;
    CGPoint origin;
    
    if (image.size.width > image.size.height)
    {
        CGFloat scaleRatio = newSize / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    }
    else
    {
        CGFloat scaleRatio = newSize / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(0, -(image.size.height - image.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
    {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else
    {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context, scaleTransform);
    
    [image drawAtPoint:origin];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}


-(void)aMethod
{
    NSLog(@"aMethodfdffdfddffd");
    
    
    if (buttonFlashing) return;
    buttonFlashing = YES;
    button.alpha = 1.0f;
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut |
     UIViewAnimationOptionRepeat |
     UIViewAnimationOptionAutoreverse |
     UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         button.alpha = 0.0f;
                    
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];
    
    
}

-(void)allocatemenubarforaddframespage
{
     _topView = [[UIView alloc]initWithFrame:CGRectMake(0,0,fullScreen.size.width ,downstrip_height)];
    [_topView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"downstrip_img.jpg"]]];
    [self.view addSubview:_topView];

    backButton1 =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
   
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        backButton1.center=CGPointMake(self.view.frame.size.width*0.070, downstrip_height*0.5);
        capture =[[UIButton alloc]initWithFrame:CGRectMake(118, 480, 85, 85)];
        
    }
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        backButton1.center=CGPointMake(self.view.frame.size.width*0.070, downstrip_height*0.5);
        
        capture =[[UIButton alloc]initWithFrame:CGRectMake(118, 480, 85, 85)];
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        backButton1.center=CGPointMake(self.view.frame.size.width*0.070, downstrip_height*0.5);
        
        capture =[[UIButton alloc]initWithFrame:CGRectMake(320, 880, 120, 120)];
    }
    
    // --------- Back Button ----------------//
    
    [backButton1 setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton1 setBackgroundImage:[UIImage imageNamed:@"back_active"] forState:UIControlStateHighlighted];
    backButton1 .contentMode = UIViewContentModeScaleAspectFit;
    [backButton1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backButton1 addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton1];

  
    [capture setBackgroundImage:[UIImage imageNamed:@"capture.png"] forState:UIControlStateNormal];
    [capture addTarget:self action:@selector(moveheretoanother) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:capture];
    
}
-(void)moveheretoanother
{
    
    [self addPreLoad];
    [_topView removeFromSuperview];
    [backButton1 removeFromSuperview];
    [capture removeFromSuperview];
    
    buttonFlashing = YES;
    button.alpha = 1.0f;
    [UIView animateWithDuration:0.4
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut |
     UIViewAnimationOptionRepeat |
     UIViewAnimationOptionAutoreverse |
     UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         button.alpha = 1.0f;
                         
                     }
                     completion:^(BOOL finished){
                         
                         
                     }];


    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    UIImageView *screenimgv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    
    
    [screenimgv setBackgroundColor:[UIColor clearColor]];
    
    
    [clearedimgv1.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    CGSize size = CGSizeMake(screenWidth, screenHeight);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    CGRect rec = CGRectMake(0, 0, 320,600);
    
    
    [self.view drawViewHierarchyInRect:rec afterScreenUpdates:YES];
    
    
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    
   // UIImageWriteToSavedPhotosAlbum(screenShot, nil, nil, nil);
    
    UIGraphicsEndImageContext();
    
    ShareViewController *textvwcon=[[ShareViewController alloc]init];
    textvwcon.finalscreenshot=screenShot;
    [self.navigationController pushViewController:textvwcon animated:YES];
    

    
    [self.view addSubview:screenimgv];
   
    
    
    [self allocatemenubarforaddframespage];
    [screenimgv removeFromSuperview ];
    
    
}


-(void)goBack
{
    
    [self.navigationController popViewControllerAnimated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
