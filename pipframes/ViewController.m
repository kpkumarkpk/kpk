//
//  ViewController.m
//  secondapp
//
//  Created by OUTTHINKING PVT LTD on 1/27/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import "StartAdViewController.h"
#import "DEMONavigationController.h"
#import "AppConfig.h"
#import <CFNetwork/CFNetwork.h>
#import "ViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "FilterViewController.h"


#define adCoverMediaView_height  ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 340  : [[UIScreen mainScreen]bounds].size.width/3)
#define FBMediaView_top ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 100  : 100)



@import FBAudienceNetwork;

@import FBSDKShareKit;


#import "Config.h"


//#define button_height 120.0//iphone 120

@interface ViewController ()<UINavigationControllerDelegate>


@property(nonatomic, assign)int totalCount;
@property(nonatomic,assign)int gapValue;
@property(nonatomic,retain)NSArray *adArray;
@property(nonatomic,retain)NSMutableArray *imageArray;

@property(nonatomic,retain)FBNativeAd *nativeAdRef;

@end

@implementation ViewController
@synthesize isSelectionOptionEnable;
@synthesize gapValue;
@synthesize totalCount;
@synthesize adArray;
@synthesize imageArray;

@synthesize nativeAdRef;

-(void)viewWillAppear:(BOOL)animated
{
    [self refreshView];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)])
    {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    else
    {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(refreshView)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
    self.navigationController .navigationBarHidden = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                             0,
                                                                             fullScreen.size.width,
                                                                             fullScreen.size.height)];
    bgImageView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:227.0/255.0 blue:246.0/255.0 alpha:1.0];
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        bgImageView.image = [UIImage imageNamed:@"back-ground@2x.png"];
        ///--------for iphone
        
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        bgImageView.image = [UIImage imageNamed:@"back-ground@1x.png"];
        /////-------for ipad
        
    }
    else
    {
        
        bgImageView.image = [UIImage imageNamed:@"back-ground@3x.png"];
        
        
    }
    [self.view addSubview:bgImageView];
    
    isSelectionOptionEnable = true;
    
    [self setUpAllElemnets];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)showNativeAd
{
    NSLog(@"native add loading");
    
    
    FBNativeAd *nativeAd = [[FBNativeAd alloc] initWithPlacementID:@"1493630397607620_1493630787607581"];
    nativeAd.delegate = self;
    self.nativeAdRef = nil;
    [FBAdSettings addTestDevice:@"a187a7b7fe92ba646dbfc2c3c14490459ef79521"];
    [nativeAd loadAd];
}
- (void)nativeAdDidLoad:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad loaded __________");
    self.nativeAdRef = nativeAd;
    
    
    [self showNativeAdOnView:self.view at:CGPointMake(0.0,50)];
}

-(void)showNativeAdOnView:(UIView*)v at:(CGPoint)point
{
    
    
    NSLog(@"calling");
    FBNativeAd *nativeAd = self.nativeAdRef;
    if(nil == nativeAd)
    {
        return;
    }
    
    NSString *titleForAd = nativeAd.title;
    NSString *bodyTextForAd = nativeAd.body;
    FBAdImage *iconForAd = nativeAd.icon;
    
    CGRect full = [[UIScreen mainScreen]bounds];
    CGFloat iconSize = 50.0;
    
    
    CGFloat calcHeight = full.size.height *adHieghtPercentage;
    
    CGSize coverImageSize = CGSizeMake(full.size.width, calcHeight-iconSize);
    NSLog(@"showNativeAdOnView: %f,%f",coverImageSize.width,coverImageSize.height);
    
    
   // FBMediaView *adCoverMediaView = [[FBMediaView alloc] initWithFrame:CGRectMake(0.0, 0.0, coverImageSize.width-10, (full.size.height*adHieghtPercentage)-iconSize)];-----ipod
    
    
    FBMediaView *adCoverMediaView = [[FBMediaView alloc] init];
    
    
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        adCoverMediaView = [[FBMediaView alloc] initWithFrame:CGRectMake(0.0, -toolbarHeight/2, coverImageSize.width-10, (full.size.height*0.98*adHieghtPercentage))];
        

        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        adCoverMediaView = [[FBMediaView alloc] initWithFrame:CGRectMake(0.0, -toolbarHeight/2, coverImageSize.width-10, (full.size.height*adHieghtPercentage))];
        

        
    }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        adCoverMediaView = [[FBMediaView alloc] initWithFrame:CGRectMake(0.0, -toolbarHeight/2, coverImageSize.width-10, (full.size.height*0.98*adHieghtPercentage+10))];
        

        
    }

    
    
    [adCoverMediaView setNativeAd:nativeAd];
    
    UIView *nativeAdView  = [[UIView alloc]initWithFrame:CGRectMake(5.0, toolbarHeight+8, coverImageSize.width-10.0, full.size.height*adHieghtPercentage+toolbarHeight/2)];
    [nativeAdView addSubview:adCoverMediaView];
    nativeAdView.layer.masksToBounds = YES;
    
    ///UIView *nativeAdShadow = [[UIView alloc]initWithFrame:CGRectMake(5.0, point.y, coverImageSize.width-10.0, coverImageSize.height+iconSize-5.0)];
    
    
    UIView *nativeAdShadow = [[UIView alloc]initWithFrame:CGRectMake(5.0, toolbarHeight+8, coverImageSize.width-10.0, full.size.height*adHieghtPercentage+toolbarHeight/2)];
    
    
    
    nativeAdShadow.backgroundColor = [UIColor whiteColor];
    nativeAdShadow.layer.shadowColor = [UIColor blackColor].CGColor;
    nativeAdShadow.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    nativeAdShadow.layer.masksToBounds = NO;
    nativeAdShadow.layer.shadowOpacity = 0.7;
    nativeAdShadow.layer.shadowRadius = 1.5;
    nativeAdShadow.clipsToBounds = NO;
    [v addSubview:nativeAdShadow];
    
    UIView *colorView = [[UIView alloc]initWithFrame:CGRectMake(0.0, nativeAdView.frame.size.height-iconSize, nativeAdView.frame.size.width, iconSize)];
    colorView.backgroundColor = [UIColor whiteColor];
    colorView.alpha = 0.7;
    [nativeAdView addSubview:colorView];
    
    UIView *textView = [[UIView alloc]initWithFrame:CGRectMake(0.0, nativeAdView.frame.size.height-iconSize, nativeAdView.frame.size.width, iconSize)];
    textView.backgroundColor = [UIColor clearColor];
    [nativeAdView addSubview:textView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconSize+3, 0.0, textView.frame.size.width-iconSize-80, 15.0)];
    titleLabel.text = titleForAd;
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
    [textView addSubview:titleLabel];
    
    UILabel *bodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(iconSize+3, 15.0, nativeAdView.frame.size.width-iconSize-100, 30.0)];
    bodyLabel.text = bodyTextForAd;
    bodyLabel.textColor = [UIColor grayColor];
    bodyLabel.font = [UIFont systemFontOfSize:11.0];
    bodyLabel.numberOfLines = 2.0;
    bodyLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [textView addSubview:bodyLabel];
    
    
    UIImageView *adIcon = [[UIImageView alloc]initWithFrame:CGRectMake(0.0, 0.0, iconSize, iconSize)];
    adIcon.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:iconForAd.url]];
    //adIcon.image = [UIImage imageWithContentsOfFile:iconForAd.url.path];
    [textView addSubview:adIcon];
    
    UIButton *adToCall = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    adToCall.frame = CGRectMake(full.size.width-90, nativeAdView.frame.size.height-iconSize, 80, iconSize);
    adToCall.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.7];
    adToCall.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
    [adToCall setTitle:nativeAd.callToAction forState:UIControlStateNormal];
    [adToCall setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [nativeAdView addSubview:adToCall];
    
    
    
    // Add the ad to the view hirarchy
    [v addSubview:nativeAdView];
    
    // Register the native ad view and its view controller with the native ad instance
    [nativeAd registerViewForInteraction:nativeAdView withViewController:self];
    
}


- (void)nativeAd:(FBNativeAd *)nativeAd didFailWithError:(NSError *)error
{
    NSLog(@"Ad failed to load with error: %@", error);
}

- (void)nativeAdDidClick:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad was clicked.");
}

- (void)nativeAdDidFinishHandlingClick:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad did finish click handling.");
}

- (void)nativeAdWillLogImpression:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad impression is being captured.");
}



-(void)setUpAllElemnets

{
    NSLog(@"native ad load");
    
    [self showNativeAd];
    
    
    gapValue = (fullScreen.size.height-(toolbarHeight+(fullScreen.size.height*adHieghtPercentage)+(fullScreen.size.height*startAdHieghtPercentage)))/3;
    
    //UIView *nativeAd = [[UIView alloc] initWithFrame:CGRectMake(0, toolbarHeight+gapValue, fullScreen.size.width,fullScreen.size.height*adHieghtPercentage)];
    
    //[nativeAd setBackgroundColor:[UIColor whiteColor]];
    
    
    //[self loadNativeAd];
    
    //  [self.view addSubview:nativeAd];
    
    
    
    //  ShareMediaTypeSelectionController *fbNativeAdView = [[ShareMediaTypeSelectionController alloc] init];
    
    //  [nativeAd addSubview:fbNativeAdView.view];
    
    // [nativeAd release];
    
    [self addToolBar];
    StartAdViewController *startAds = [[StartAdViewController alloc] init];
    [startAds addStartAd];
    
    // [startAds release];
    
    adArray = [startAds getDictionaryOfImages];
    
    //[adArray retain];
    
    if (isSelectionOptionEnable)
    {
        totalCount = 3;
    }
    else
    {
        totalCount = 2;
    }
    
    if (adArray == nil)
    {
        [self addADView:false];
        return;
    }
    
    imageArray = [[NSMutableArray alloc] init];
    
    for (int index=0; index<adArray.count; index++)
    {
        NSDictionary *dict= [(NSDictionary *)adArray[index] valueForKey:@"imgurl"] ;
        NSString *imageName = [dict valueForKey:@"text"];
        [imageArray addObject:imageName];
        
    }
    totalCount = totalCount+(int)[imageArray count];
    [self addADView:true];
    
}

-(void)refreshView
{
    UIView *adView = (UIView *)[self.view viewWithTag:adBagViewTag];
    if (adView!=nil)
    {
        UIScrollView *scrollView = (UIScrollView *)[adView viewWithTag:adScrollviewTag];
        if (scrollView!=nil)
        {
            [scrollView setContentOffset:CGPointMake(scrollView.contentSize.width, 0) animated:NO];
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:1.0];
            [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
            [UIView commitAnimations];
            
            UIButton *albumButton =(UIButton *) [scrollView viewWithTag:1];
            [self addAnimation:albumButton];
            
            UIButton *cameraButton = (UIButton *)[scrollView viewWithTag:2];
            [self addAnimation:cameraButton];
            
            UIButton *rateusButton = (UIButton *)[scrollView viewWithTag:3];
            [self addAnimation:rateusButton];
            
            
        }
    }
    
}

-(UIImage *) getImageFromURL:(NSString *)fileURL
{
    UIImage * result;
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:fileURL]];
    result = [UIImage imageWithData:data];
    return result;
}

-(void)addToolBar
{
    UIView *toolbar = [[UIView alloc] init];
    toolbar.frame = CGRectMake(0, 0, fullScreen.size.width, toolbarHeight);
    toolbar.backgroundColor = [UIColor colorWithRed:255.0/255.0   green:255.0/255.0 blue:255.0/255.0 alpha:1];
    toolbar.layer.shadowColor = [[UIColor blackColor] CGColor];
    toolbar.layer.shadowOffset = CGSizeMake(0.0, 1.0);
    toolbar.layer.masksToBounds = NO;
    toolbar.layer.shadowOpacity = 0.7;
    toolbar.layer.shadowRadius = 2.0;
    [self.view addSubview:toolbar];
    
    UILabel *appTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, fullScreen.size.width, toolbarHeight)];
    appTitleLabel .text = applicationName;
    appTitleLabel.textColor = [UIColor darkGrayColor];
    appTitleLabel.font = [UIFont fontWithName:@"Museo Sans Cyrl 900" size:17.0];
    appTitleLabel.textAlignment = NSTextAlignmentCenter;
    [toolbar addSubview:appTitleLabel];
    
    UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
    menu.frame = CGRectMake(5, 5, toolbarHeight-10, toolbarHeight-10);
    [menu setImage:[UIImage imageNamed:@"Menu.png"] forState:UIControlStateNormal];
    [menu addTarget:self action:@selector(menu) forControlEvents:UIControlEventTouchUpInside];
    [toolbar addSubview:menu];
    
    UIButton *store = [UIButton buttonWithType:UIButtonTypeCustom];
    store.frame = CGRectMake(fullScreen.size.width-toolbarHeight-10, 5, toolbarHeight-10, toolbarHeight-10);
    [store setImage:[UIImage imageNamed:@"gift-box.png"] forState:UIControlStateNormal];
    [store addTarget:self action:@selector(store) forControlEvents:UIControlEventTouchUpInside];
    [toolbar addSubview:store];
}

-(void)addADView:(BOOL)isWithStartAd
{
    UIView *adBgView= [[UIView alloc] init];
    adBgView.tag = adBagViewTag;
    
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        adBgView .frame = CGRectMake(5, toolbarHeight+(2*gapValue)+fullScreen.size.height*adHieghtPercentage, fullScreen.size.width-10, fullScreen.size.height*startAdHieghtPercentage+toolbarHeight);
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        adBgView .frame = CGRectMake(5, toolbarHeight+(2*gapValue)+fullScreen.size.height*adHieghtPercentage+20, fullScreen.size.width-10, fullScreen.size.height*startAdHieghtPercentage+toolbarHeight/2);
       
    }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        adBgView .frame = CGRectMake(5, toolbarHeight+(2*gapValue)+fullScreen.size.height*adHieghtPercentage+15, fullScreen.size.width-10, fullScreen.size.height*startAdHieghtPercentage);
        
    }
    
    adBgView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];
    adBgView.layer.shadowColor  = [[UIColor blackColor] CGColor];
    adBgView.layer.shadowOffset  = CGSizeMake(0.0, 1.0);
    adBgView.layer.masksToBounds = NO;
    adBgView.layer.shadowOpacity = 0.7;
    adBgView.layer.shadowRadius  = 3.0;
    [self.view addSubview:adBgView];
    float button_heights = (fullScreen.size.width-addSize)/3;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, fullScreen.size.width-10, adBgView.frame.size.height)];
    scrollView.tag = adScrollviewTag;
    scrollView.backgroundColor = [UIColor clearColor];
    [adBgView addSubview:scrollView];
    
    float startButtonHeightPercentage= 0.25;
    float buttonWidth_Percentage = 0.2;
    int currentTag =1;
    int gaps = ad_gap;
    CGRect buttonFrame = CGRectMake(0, 0, button_heights, button_heights);
    float xCenter = gaps +(buttonFrame.size.width/2);
    float scrollViewWidth = fullScreen.size.width;
    
    if (isWithStartAd==false)
    {
        totalCount ++;
    }
    int imageIndex=0;
    int tagToDivide = 5;//ipad 6
    if (isSelectionOptionEnable) {
        tagToDivide = 6;//ipad 5
    }
    for (int index=currentTag; index<=totalCount; index++)
    {
        if (currentTag==tagToDivide)
        {
            scrollViewWidth = xCenter-(button_heights/2)+10;
            startButtonHeightPercentage = 0.75;
           // buttonWidth_Percentage = 0.2;
            xCenter = gaps +(buttonFrame.size.width/2);
        }
        
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame   = buttonFrame;
        but.tag     = currentTag;
        but.layer.cornerRadius = button_heights/2;//ip 60
        but.layer.masksToBounds = YES;
        but.layer.shadowColor = [[UIColor grayColor] CGColor];
        but.layer.shadowRadius = 2;
        but.layer.shadowOffset =  CGSizeMake(0.5, 0.5);
        but.center = CGPointMake(xCenter, adBgView.frame.size.height*startButtonHeightPercentage);
        but.backgroundColor = [UIColor clearColor];
        [but addTarget:self action:@selector(selectionOption:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:but];
        
        if ((isSelectionOptionEnable && currentTag<=3)||(currentTag<=2))
        {
            [but setBackgroundImage:[self getImageForButton:currentTag] forState:UIControlStateNormal];
            [self addAnimation:but];
        }
        else
        {
            [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageArray[imageIndex]]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                [but setImage: [UIImage imageWithData:data] forState:UIControlStateNormal];
                
            }];
            imageIndex++;
        }
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.frame = CGRectMake(0, 0, buttonFrame.size.width, 20);
        titleLabel.center = CGPointMake(but.center.x, but.center.y+(button_heights/2)+10);
        titleLabel.text = [self getTitleForButton:currentTag];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor= [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:12.0];
        titleLabel.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.0];
        [scrollView addSubview:titleLabel];
        
        currentTag++;
        
        xCenter = xCenter+buttonFrame.size.width+gaps;
        //[titleLabel release];
        
    }
    
    scrollView.contentSize = CGSizeMake(scrollViewWidth, fullScreen.size.height*0.45);
    [scrollView setShowsHorizontalScrollIndicator:false];
    [scrollView setContentOffset:CGPointMake(scrollViewWidth, 0) animated:NO];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    [UIView commitAnimations];
    
    //[scrollView release];
    //[adBgView release];
}


-(void)addAnimation:(UIButton *)button
{
    CABasicAnimation *theAnimation;
    theAnimation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    theAnimation.duration=0.7;
    theAnimation.repeatCount=HUGE_VALF;
    theAnimation.autoreverses=YES;
    theAnimation.fromValue=[NSNumber numberWithFloat:1.0];
    theAnimation.toValue=[NSNumber numberWithFloat:0.9];
    theAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [button.layer addAnimation:theAnimation forKey:@"animateOpacity"];
}

-(NSString *)getTitleForButton:(int)tag
{
    int value=tag;
    
    if (isSelectionOptionEnable)
    {
        value= value-1;
        
        if (tag==1)
        {
            return @"Album";
        }
        else if(tag ==2)
        {
            return @"Camera";
        }
        
    }
    
    switch (value)
    {
        case 1:
            return @"Start";
            break;
        case 2:
            return @"RateUs";
            break;
            
        default:
        {
            NSDictionary *dict = adArray[value-3];
            NSDictionary *title_dict = (NSDictionary *)[dict valueForKey:@"name"];
            return [title_dict valueForKey:@"text"];
        }
            break;
    }
    return nil;
    
}

-(UIImage *)getImageForButton:(int)tag
{
    
    UIImage *image;
    int value=tag;
    
    if (isSelectionOptionEnable)
    {
        value= value-1;
        if (tag==1)
        {
            image = [UIImage imageNamed:@"album.jpg"];
            return image;
        }
        else if(tag ==2)
        {
            image = [UIImage imageNamed:@"camera.jpg"];
            return image;
        }
    }
    
    switch (value)
    {
        case 1:
            image = [UIImage imageNamed:@"start.png"];
            break;
        case 2:
            image = [UIImage imageNamed:@"rate us.jpg"];
            break;
            
        default:
        {
            return imageArray[value-3];
        }
            
            break;
    }
    
    return image;
}

-(void)selectionOption:(UIButton *)button
{
    int value=(int )button.tag;
    
    if (isSelectionOptionEnable)
    {
        if (value==1)
        {
            [self album];
            return;
        }
        else if(value ==2)
        {
            [self camera];
            return;
        }
        value= value-1;
        //return;
    }
    
    switch (value)
    {
        case 1:
            [self start];
            break;
        case 2:
            [self rateUs];
            return;
            break;
        default:
        {
            NSDictionary *dict = adArray[value-3];
            NSDictionary *title_dict = (NSDictionary *)[dict valueForKey:@"openurl"];
            NSString *urlString = [title_dict valueForKey:@"text"];
            NSURL *url = [NSURL URLWithString:urlString];
            [self showWebViewWithUrl:url];
        }
            break;
    }
}
-(void)showWebViewWithUrl:(NSURL *)url
{
    if ([[UIApplication sharedApplication] canOpenURL:url])
    {
        [[UIApplication sharedApplication] openURL:url];
    }
    
}
-(void)menu
{
    [(DEMONavigationController *)self.navigationController showMenu];
}

#pragma  select image/video from album
-(void)album
{
    
    
   //[UIApplication sharedApplication].idleTimerDisabled = YES;
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    
    imagePicker.allowsEditing = NO;

    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePicker animated:YES completion:^{
        
    }];
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *chosenimage=[info valueForKey:UIImagePickerControllerOriginalImage];
    
    FilterViewController *filt=[[FilterViewController alloc]init];
    
    filt.selimg=chosenimage;
    
   // UIImageWriteToSavedPhotosAlbum(chosenimage, nil, nil, nil);
    
    [self.navigationController pushViewController:filt animated:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
     NSLog(@"move to secview contr");
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma  select image/video from camera
-(void)camera
{
    UIImagePickerController *imagpicker=[[UIImagePickerController alloc]init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        imagpicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        imagpicker.delegate=self;
        
        imagpicker.allowsEditing=YES;
        
        imagpicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        
        [self presentViewController:imagpicker animated:YES completion:nil];
        
    }
    
    
    NSLog(@"camerapicker");
    
        
}
#pragma  go to next view controller
-(void)start
{
    //ThirdViewController *thirdv = [[ThirdViewController alloc] init];
    
    // [self.navigationController pushViewController:thirdv animated:YES];
    
}
#pragma rate  application
-(void)rateUs
{
    [self showWebViewWithUrl:[NSURL URLWithString:[NSString stringWithFormat:appReviewUrl,applicationId]]];
}
#pragma open our app store
-(void)store
{
    [self showWebViewWithUrl:[NSURL URLWithString:moreAppsUrl]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}



// Now that you have added the code to load the ad, add the following
// functions to handle loading failures and to construct the ad once
// it has loaded:

@end

