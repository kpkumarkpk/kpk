//
//  ViewController.m
//  FaceBookNativeAdTest
//
//  Created by Deepti's Mac on 11/23/15.
//  Copyright © 2015 D.Yoganjulu  Reddy. All rights reserved.
//

#import "StartViewController.h"

#import "ShareMediaTypeSelectionController.h"
#import "StartAdViewController.h"
#import "DEMONavigationController.h"
#import "AppConfig.h"
#import "ViewController.h"
#import <CFNetwork/CFNetwork.h>


//#define button_height 120.0//iphone 120

@interface StartViewController ()
@property(nonatomic, assign)int totalCount;
@property(nonatomic,assign)int gapValue;
@property(nonatomic,retain)NSArray *adArray;
@property(nonatomic,retain)NSMutableArray *imageArray;
@end

@implementation StartViewController
@synthesize isSelectionOptionEnable;
@synthesize gapValue;
@synthesize totalCount;
@synthesize adArray;
@synthesize imageArray;

- (void)viewDidLoad {

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

    self.view.backgroundColor =  PHOTO_DEFAULT_COLOR;
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                             0,
                                                                             fullScreen.size.width,
                                                                             fullScreen.size.height)];
    //bgImageView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:227.0/255.0 blue:246.0/255.0 alpha:1.0];
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        bgImageView.image = [UIImage imageNamed:@"background@2x.png"];
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        bgImageView.image = [UIImage imageNamed:@"background_ipad.png"];
        
    }else
    {
        bgImageView.image = [UIImage imageNamed:@"background...36@2x.png"];
    }

    //bgImageView.image = [UIImage imageNamed:@"BG_1.jpg"];
    [self.view addSubview:bgImageView];

    isSelectionOptionEnable = false;

    [self setUpAllElemnets];

    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setUpAllElemnets
{
    gapValue = (fullScreen.size.height-(toolbarHeight+(fullScreen.size.height*adHieghtPercentage)+(fullScreen.size.height*startAdHieghtPercentage)))/3;

    UIView *nativeAd = [[UIView alloc] initWithFrame:CGRectMake(0,
                                                                toolbarHeight+gapValue,
                                                                fullScreen.size.width,
                                                                fullScreen.size.height*adHieghtPercentage)];
    [self.view addSubview:nativeAd];

    ShareMediaTypeSelectionController *fbNativeAdView = [[ShareMediaTypeSelectionController alloc] init];
    [nativeAd addSubview:fbNativeAdView.view];

    [self addToolBar];

    StartAdViewController *startAds = [[StartAdViewController alloc] init];
    [startAds addStartAd];

    adArray = [startAds getDictionaryOfImages];
    [adArray retain];

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
            
            UIButton *startButton =(UIButton *) [scrollView viewWithTag:1];
            [self addAnimation:startButton];
            
            UIButton *rateusButton = (UIButton *)[scrollView viewWithTag:2];
            [self addAnimation:rateusButton];
        }
    }

}
-(void)viewWillAppear:(BOOL)animated
{
    [self refreshView];
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
    appTitleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    appTitleLabel.textAlignment = NSTextAlignmentCenter;
    [toolbar addSubview:appTitleLabel];
    [appTitleLabel release];

    UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
    menu.frame = CGRectMake(5, 5, toolbarHeight-10, toolbarHeight-10);
    [menu setImage:[UIImage imageNamed:@"Menu1.png"] forState:UIControlStateNormal];
    [menu addTarget:self action:@selector(menu) forControlEvents:UIControlEventTouchUpInside];
    [toolbar addSubview:menu];

    UIButton *store = [UIButton buttonWithType:UIButtonTypeCustom];
    store.frame = CGRectMake(fullScreen.size.width-toolbarHeight-10, 5, toolbarHeight-10, toolbarHeight-10);
    [store setImage:[UIImage imageNamed:@"gift-box.png"] forState:UIControlStateNormal];
    [store addTarget:self action:@selector(store) forControlEvents:UIControlEventTouchUpInside];
    [toolbar addSubview:store];
    [toolbar release];
}

-(void)addADView:(BOOL)isWithStartAd
{
    UIView *adBgView= [[UIView alloc] init];
    adBgView.tag = adBagViewTag;
    adBgView .frame = CGRectMake(5, toolbarHeight+(2*gapValue)+fullScreen.size.height*adHieghtPercentage, fullScreen.size.width-10, fullScreen.size.height*startAdHieghtPercentage);
    adBgView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1];

    adBgView.layer.shadowColor  = [[UIColor blackColor] CGColor];
    adBgView.layer.shadowOffset  = CGSizeMake(0.0, 1.0);
    adBgView.layer.masksToBounds = NO;
    adBgView.layer.shadowOpacity = 0.7;
    adBgView.layer.shadowRadius  = 3.0;
    [self.view addSubview:adBgView];

    float button_height = (fullScreen.size.width-addSize)/3;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, fullScreen.size.width-10, adBgView.frame.size.height)];
    scrollView.tag = adScrollviewTag;
    scrollView.backgroundColor = [UIColor clearColor];
    [adBgView addSubview:scrollView];

    float startButtonHeightPercentage= 0.25;
    float buttonWidth_Percentage = 0.2;
    int currentTag =1;
    int gap = ad_gap;
    CGRect buttonFrame = CGRectMake(0, 0, button_height, button_height);
    float xCenter = gap +(buttonFrame.size.width/2);
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
            scrollViewWidth = xCenter-(button_height/2)+10;
            startButtonHeightPercentage = 0.75;
            buttonWidth_Percentage = 0.2;
            xCenter = gap +(buttonFrame.size.width/2);
        }

        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame   = buttonFrame;
        but.tag     = currentTag;
        but.layer.cornerRadius = button_height/2;//ip 60
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
        titleLabel.center = CGPointMake(but.center.x, but.center.y+(button_height/2)+10);
            titleLabel.text = [self getTitleForButton:currentTag];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor= [UIColor grayColor];
        titleLabel.font = [UIFont systemFontOfSize:12.0];
        titleLabel.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.0];
        [scrollView addSubview:titleLabel];

        currentTag++;

        xCenter = xCenter+buttonFrame.size.width+gap;
        [titleLabel release];
            
    }

    scrollView.contentSize = CGSizeMake(scrollViewWidth, fullScreen.size.height*0.45);
    [scrollView setContentOffset:CGPointMake(scrollViewWidth, 0) animated:NO];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    [UIView commitAnimations];

    [scrollView release];
    [adBgView release];
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
            image = [UIImage imageNamed:@"start.jpg"];
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
        }
        else if(value ==2)
        {
            [self camera];
        }
        value= value-1;
    }
    
    switch (value)
    {
        case 1:
            [self start];
            break;
        case 2:
            [self rateUs];
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

}
#pragma  select image/video from camera
-(void)camera
{

}
#pragma  go to next view controller
-(void)start
{
    if (viewController == nil)
    {
        viewController = [[ViewController alloc] init];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notificationdidLoadView" object:nil];
    [self.navigationController pushViewController:viewController animated:YES];

}
#pragma rate  application
-(void)rateUs
{
    static NSString *const iOSAppStoreURLFormat = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d";
    
    [self showWebViewWithUrl:[NSURL URLWithString:[NSString stringWithFormat:iOSAppStoreURLFormat,applicationId]]];
}
#pragma open our app store
-(void)store
{
    [self showWebViewWithUrl:[NSURL URLWithString:moreAppsUrl]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [imageArray release];
    [adArray release];
    [super dealloc];

}


// Now that you have added the code to load the ad, add the following
// functions to handle loading failures and to construct the ad once
// it has loaded:

@end
