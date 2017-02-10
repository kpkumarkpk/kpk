//
//  ShareMediaTypeSelectionController.m
//  Instapicframes
//
//  Created by Vijay Doddavala on 10/28/15.
//
//

#import "ShareMediaTypeSelectionController.h"
#import "AppConfig.h"
#import <FBAudienceNetwork/FBAudienceNetwork.h>


#define HIDE_NAVIGATION_BAR      1
#define SHARE_OPTIONBAR_HEIGHT   60.0
#define TAG_TYPE_SELECTION_BAR   658.0
#define TAG_SHARE_SELECTION_BAR  659.0
#define GAP_BETWEEN_ITEMS        5.0

@interface ShareMediaTypeSelectionController() <FBNativeAdDelegate,MFMailComposeViewControllerDelegate,UIImagePickerControllerDelegate,UIDocumentInteractionControllerDelegate>
{

}


@property(nonatomic,retain)FBNativeAd *nativeAdRef;
@end

@implementation ShareMediaTypeSelectionController
@synthesize delegateController;
@synthesize nativeAdRef;

static char const * const archiveCallback;

-(void)backbuttonPressed:(id)sender
{
    NSLog(@"backbuttonPressed");
    self.nativeAdRef = nil;
  
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadNativeAd
{
    FBNativeAd *nativeAd = [[FBNativeAd alloc] initWithPlacementID:facebookPlacementId];
    nativeAd.delegate = self;
    self.nativeAdRef = nil;
    //a187a7b7fe92ba646dbfc2c3c14490459ef79521
    //560914488dd56b61652de14931e5f8a4a0665c1f
    [FBAdSettings addTestDevice:@"a187a7b7fe92ba646dbfc2c3c14490459ef79521"];
    [nativeAd loadAd];
}

- (void)nativeAd:(FBNativeAd *)nativeAd didFailWithError:(NSError *)error
{
    self.nativeAdRef = nil;
    NSLog(@"Native Ad failed to load with error: %@", error);
}

-(void)showNativeAdOnView:(UIView*)v at:(CGPoint)point
{
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

    FBMediaView *adCoverMediaView = [[FBMediaView alloc] initWithFrame:CGRectMake(0.0, 0.0, coverImageSize.width-10, (full.size.height*adHieghtPercentage)-iconSize)];
    [adCoverMediaView setNativeAd:nativeAd];
    
       UIView *nativeAdView  = [[UIView alloc]initWithFrame:CGRectMake(5.0, 0, coverImageSize.width-10.0, full.size.height*adHieghtPercentage)];
    [nativeAdView addSubview:adCoverMediaView];
    nativeAdView.layer.masksToBounds = YES;
    
    ///UIView *nativeAdShadow = [[UIView alloc]initWithFrame:CGRectMake(5.0, point.y, coverImageSize.width-10.0, coverImageSize.height+iconSize-5.0)];
    UIView *nativeAdShadow = [[UIView alloc]initWithFrame:CGRectMake(5.0, 0, coverImageSize.width-10.0, full.size.height*adHieghtPercentage)];
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
    
    return;
}

- (void)nativeAdDidLoad:(FBNativeAd *)nativeAd
{
    NSLog(@"Native ad loaded __________");
    self.nativeAdRef = nativeAd;

    
    [self showNativeAdOnView:self.view at:CGPointMake(0.0,50)];
}

-(void)viewDidLoad
{
    [super viewDidLoad];

    
    [self loadNativeAd];
    
    // set background
    self.view.backgroundColor = [UIColor clearColor];
    //Add preview of the output use the tags to identify the buttons
    CGRect full = [[UIScreen mainScreen]bounds];
    
#if HIDE_NAVIGATION_BAR
    
    [self.navigationController setNavigationBarHidden:YES];
    UIImageView *preview   = [[UIImageView alloc]initWithFrame:CGRectMake(5.0, 5.0, full.size.width-10.0, full.size.width-10.0)];
    [self.view addSubview:preview];
    
    
    UIView *blackShape = [[UIView alloc]initWithFrame:CGRectMake(10.0, 10.0, 35.0, 35.0)];
    blackShape.backgroundColor = [UIColor blackColor];
    blackShape.layer.cornerRadius = 17.0;
    blackShape.alpha = 0.6;
    blackShape.layer.masksToBounds = YES;
    //[self.view addSubview:blackShape];
    
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0.0, 0.0, 30.0, 30.0);
    [back setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backbuttonPressed:) forControlEvents:UIControlEventTouchUpInside];
   // [self.view addSubview:back];
    
   // back.center = blackShape.center;

#else
    
    // change the backbutton look
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"round_back.png"]
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(backbuttonPressed:)];
    UIImageView *preview   = [[UIImageView alloc]initWithFrame:CGRectMake(12.5, 44.0, full.size.width-25.0, full.size.width-25.0)];
    [self.view addSubview:preview];
   
#endif
    
     return;
}


@end
