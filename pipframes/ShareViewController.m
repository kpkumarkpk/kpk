//
//  ShareViewController.m
//  secondapp
//
//  Created by OUTTHINKING PVT LTD on 2/3/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import "ShareViewController.h"
#import "OT_TabBar.h"
#import "Config.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "FourthViewController.h"



#define adCoverMediaView_height  ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 340  : [[UIScreen mainScreen]bounds].size.width/3)
#define FBMediaView_top ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 100  : 100)


@interface ShareViewController ()
@property(strong, nonatomic) NSString *feedbackMsg;
@property (strong,  nonatomic) UIDocumentInteractionController *doccontroller;


@end

@implementation ShareViewController

@synthesize shareview,customTab,finalscreenshot,doccontroller;


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=@"Share";
    
    [self.view setContentMode:UIViewContentModeScaleAspectFit];
    
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    
    [self allocateMenuBarSharePage];
    [self showNativeAd];
   [self addShareAdsView];
    
    
}
- (UIImage *)squareImageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    double ratio;
    double delta;
    CGPoint offset;
    
    //make a new square size, that is the resized imaged width
    CGSize sz = CGSizeMake(newSize.width, newSize.width);
    
    //figure out if the picture is landscape or portrait, then
    //calculate scale factor and offset
    if (image.size.width > image.size.height) {
        ratio = newSize.width / image.size.width;
        delta = (ratio*image.size.width - ratio*image.size.height);
        offset = CGPointMake(delta/2, 0);
    } else {
        ratio = newSize.width / image.size.height;
        delta = (ratio*image.size.height - ratio*image.size.width);
        offset = CGPointMake(0, delta/2);
    }
    
    //make the final clipping rect based on the calculated values
    CGRect clipRect = CGRectMake(-offset.x, -offset.y,
                                 (ratio * image.size.width) + delta,
                                 (ratio * image.size.height) + delta);
    
    
    //start a new context, with scale factor 0.0 so retina displays get
    //high quality image
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(sz, YES, 0.0);
    } else {
        UIGraphicsBeginImageContext(sz);
    }
    UIRectClip(clipRect);
    [image drawInRect:clipRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}



-(void)allocateMenuBarSharePage
{
    
    
    if (customTab==nil)
    {
        [customTab removeFromSuperview];
        customTab=nil;
    }
    
    
    ///////////////////////
    
    customTab = [[OT_TabBar alloc]initWithFrame:CGRectMake(0,0,fullScreen.size.width ,Share_Strip)];
    //    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    //    {
    //        custemTab . frame = CGRectMake(0, _fullscreen.size.height-44, _fullscreen.size.width, 44);
    //    }
    customTab.delegate = self;
    customTab.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    customTab.showOverlayOnSelection = NO;
    
    
    
    OT_TabBarItem *back = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"BACK"]
                                                selectedImage:[UIImage imageNamed:@"BACK-1"]
                                                          tag:0];
    
    OT_TabBarItem *gallery = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"GALLERY"]
                                                   selectedImage:[UIImage imageNamed:@"GALLERY-1"]
                                                             tag:1];
    
    
    
    
    OT_TabBarItem *facebook = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"FACEBOOK"]
                                                    selectedImage:[UIImage imageNamed:@"FACE-BOOK-1"]
                                                              tag:2];
    
    
    OT_TabBarItem *instagram = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"INSTAGRAM"]
                                                     selectedImage:[UIImage imageNamed:@"INSTAGRAM-1"]
                                                               tag:3];
    
    OT_TabBarItem *gmail = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"MAIL"]
                                                 selectedImage:[UIImage imageNamed:@"MAIL-1"]
                                                           tag:4];
    
    
    customTab.itemTitleArray = [NSArray arrayWithObjects:@"back",@"gallery",@"facebook",@"instagram",@"gmail", nil];
    customTab.items = [NSArray arrayWithObjects:back,gallery,facebook,instagram,gmail, nil];
    
    [self.view addSubview:customTab];
    
    
}
-(void)otTabBar:(OT_TabBar*)tbar didSelectItem:(OT_TabBarItem*)tItem
{
    switch (tItem.tag)
    {
        case 0:
        {
            
            [self backhere];
            
            break;
        }
        case 1:
        {
            
            
            [self galleryhere];
            
            break;
        }
        case 2:
        {
            
            [self facebookhere];
            
            break;
        }
        case 3:
        {
            

            [self instagramhere];
            
            break;
        }
        case 4:
        {
            
            [self mailhere];
            
            
            break;
        }
            
            
        default:
        {
            break;
        }
    }
}


-(void)backhere
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}
-(void)facebookhere
{
    
    NSLog(@"facebookshare");
    
    if([SLComposeViewController instanceMethodForSelector:@selector(isAvailableForServiceType)] != nil)
    {
        if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
            UIImage *finalImage =finalscreenshot;
            SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            
            SLComposeViewControllerCompletionHandler myBlock = ^(SLComposeViewControllerResult result)
            {
                switch (result) {
                        
                    case SLComposeViewControllerResultCancelled:
                        NSLog(@"Post Canceled");
                        self.feedbackMsg = @"Post Canceled.";
                        [self showFeedbackAlert: self.feedbackMsg];
                        break;
                    case SLComposeViewControllerResultDone:
                        NSLog(@"Posted Sucessfully");
                        self.feedbackMsg = @"Posted Sucessfully.";
                        [self showFeedbackAlert: self.feedbackMsg];
                        break;
                        
                    default:
                        break;
                }
                
                [controller dismissViewControllerAnimated:YES completion:Nil];
            };
            controller.completionHandler =myBlock;
            
            [controller setInitialText:@"Wow! I love this Photo Blending App called  “PhotoBlendly”.  Awesome app to blend 2 Photos into 1 Photo. You can download this free app at"];
            [controller addImage: finalImage];
            
            
            
            [self presentViewController:controller animated:YES completion:Nil];
            
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc]
                                      initWithTitle:@"Sorry"
                                      message:@"You can't post a image right now, make sure your device has an internet connection and you have at least one Facebook account setup"
                                      delegate:nil
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
            [alertView show];
        }
    }
    
    
    
    
}

-(void)instagramhere
{
    
    NSLog(@"instagramshare");
    
    UIImage *finalImage = finalscreenshot;
    
    NSString *pathToSave = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/captions1.ig"];
    
    [UIImageJPEGRepresentation(finalImage, 1.0) writeToFile:pathToSave atomically:YES];
    
    NSURL *instagramUrl = [NSURL URLWithString:@"instagram://InstaCollageFx"];
    
    if([[UIApplication sharedApplication]canOpenURL:instagramUrl])
    {
        doccontroller
        = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:pathToSave]];
        
        doccontroller.UTI = @"com.instagram.photo";
        
        doccontroller.delegate = self;
        
        
        [doccontroller setAnnotation:@{@"InstagramCaption" : @"Wow!! This Free “Pip Frames” App  helped me to show picture inside a picture. To download this app check their Instagram profile @Pip Frames."}];
 
      CGRect rect=CGRectMake(100, 30, 100, 100);


 
        [doccontroller presentOpenInMenuFromRect:rect inView:self.view animated:YES];
        
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"Instagram not installed in this device!\nTo share image please install instagram."
                                  delegate:nil
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
        
    }
    
    return;
    
    
}

-(void)mailhere
{
    
    
    NSLog(@"mailshare");
    
    
    if ([MFMailComposeViewController canSendMail])
        // The device can send email.
    {
        [self displayMailComposerSheet];
    }
    else
        // The device can not send email.
    {
        self.feedbackMsg = @"Device not configured to send mail.";
        [self showFeedbackAlert: self.feedbackMsg];
    }
}

-(void)galleryhere
{
    
    UIImageWriteToSavedPhotosAlbum(finalscreenshot, nil, nil, nil);
    
    UIAlertView *saved = [[UIAlertView alloc]
                          initWithTitle:@"Saved"
                          message:@"Photo Saved To Album."
                          delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil];
    [saved show];
    
    
    
}

- (void)displayMailComposerSheet
{
    MFMailComposeViewController *picker = [[MFMailComposeViewController alloc] init];
    picker.mailComposeDelegate = self;
    
    [picker setSubject:@"Try this Awesome Pip Frames App"];
    
    UIImage *finalImage = finalscreenshot;
    
    NSData *myData = UIImagePNGRepresentation(finalImage);
    [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"coolImage.png"];
    
    // Fill out the email body text
    NSString *emailBody = @"Hi, \n\r \n\r I just came across this awesome Free Pip Frames  App called “Pip Frames ” from Out Thinking Pvt Ltd. A very nice and FREE app to picture inside a picture easily. I recommend you to try this app once on your device as well. \n\r \n\r Free Pip Frames App Download Link: https://itunes.apple.com/app/id903353202 \n\r \n\r \n\r Regards, \n\r App lover";
    
    [picker setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - Delegate Methods
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    // Notifies users about errors associated with the interface
    switch (result)
    {
        case MFMailComposeResultCancelled:
            self.feedbackMsg = @"Mail sending canceled";
            [self showFeedbackAlert: self.feedbackMsg];
            break;
        case MFMailComposeResultSaved:
            self.feedbackMsg = @"Mail saved";
            [self showFeedbackAlert: self.feedbackMsg];
            break;
        case MFMailComposeResultSent:
            self.feedbackMsg = @"Mail sent";
            [self showFeedbackAlert: self.feedbackMsg];
            break;
        case MFMailComposeResultFailed:
            self.feedbackMsg = @"Mail sending failed";
            [self showFeedbackAlert: self.feedbackMsg];
            break;
        default:
            self.feedbackMsg = @"Mail not sent";
            [self showFeedbackAlert: self.feedbackMsg];
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (void)showFeedbackAlert:(NSString *)feedback
{
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Message!"
                                                       message:feedback
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    [theAlert show];
}
- (void)showNativeAd
{
    FBNativeAd *nativeAd = [[FBNativeAd alloc] initWithPlacementID:@"1309171202443004_1309174115776046"];
    nativeAd.delegate = self;
    [nativeAd loadAd];
}

- (void)nativeAdDidLoad:(FBNativeAd *)nativeAd
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *nativeAdView  = [[UIView alloc]init];
    
    FBMediaView *adCoverMediaView = [[FBMediaView alloc]init];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    
    UILabel *desc = [[UILabel alloc]init];
    
    UIButton *actionBut = [UIButton buttonWithType:UIButtonTypeCustom];

    
    
    
    
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        nativeAdView.frame=CGRectMake(0.0, Share_Strip+2, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height/2);
        
        adCoverMediaView.frame=CGRectMake(10.0, Share_Strip/2, [[UIScreen mainScreen]bounds].size.width-20, 2*adCoverMediaView_height);
        
        titleLabel.frame=CGRectMake(65.0, 1.5*adCoverMediaView_height+FBMediaView_top+5, [[UIScreen mainScreen]bounds].size.width-155, 15);
        
        desc.frame=CGRectMake(65.0, (1.5*adCoverMediaView_height+FBMediaView_top)+20, [[UIScreen mainScreen]bounds].size.width-155, 20);
        
        actionBut.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width-80, (1.5*adCoverMediaView_height+FBMediaView_top)+10, 75, 25);
        
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        nativeAdView.frame=CGRectMake(0.0, Share_Strip+2, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height/2-10);
        
        adCoverMediaView.frame=CGRectMake(10.0, (Share_Strip+8), [[UIScreen mainScreen]bounds].size.width-20, adCoverMediaView_height+10);
        
        titleLabel.frame=CGRectMake(65.0, adCoverMediaView_height+FBMediaView_top+5, [[UIScreen mainScreen]bounds].size.width-155, 15);
        
        desc.frame=CGRectMake(65.0, (adCoverMediaView_height+FBMediaView_top)+20, [[UIScreen mainScreen]bounds].size.width-155, 20);
        
        actionBut.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width-80, (adCoverMediaView_height+FBMediaView_top)+10, 75, 25);
        
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        
        nativeAdView.frame=CGRectMake(0.0, Share_Strip+2, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height/2);
        
        adCoverMediaView.frame=CGRectMake(10.0, (Share_Strip/2), [[UIScreen mainScreen]bounds].size.width-20, 1.7*adCoverMediaView_height);
        
        titleLabel.frame=CGRectMake(65.0, adCoverMediaView_height+FBMediaView_top+5, [[UIScreen mainScreen]bounds].size.width-155, 15);
        
        desc.frame=CGRectMake(65.0, (adCoverMediaView_height+FBMediaView_top)+25, [[UIScreen mainScreen]bounds].size.width-155, 20);
        
        actionBut.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width-80, (adCoverMediaView_height+FBMediaView_top)+15, 75, 25);
        
    }

    
       
    nativeAdView.backgroundColor = [UIColor clearColor];
    
    
    UILabel *Sponsored = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5, [[UIScreen mainScreen]bounds].size.width, 10)];
    
    Sponsored.text = @"Sponsored";
    Sponsored.textColor = [UIColor grayColor];
    [Sponsored setFont:[UIFont fontWithName:@"HelveticaNeue" size:10]];
    [nativeAdView addSubview:Sponsored];
    
    // Allocate a FBMediaView to contain the cover image or native video asset
    
    [adCoverMediaView setBackgroundColor:[UIColor clearColor]];
    
    [adCoverMediaView setNativeAd:nativeAd];
    [nativeAdView addSubview:adCoverMediaView];
    
    //Icon
    [nativeAd.icon loadImageAsyncWithBlock:^(UIImage *image)
     {
         UIImageView *IconImageView = [[UIImageView alloc] initWithImage: image];
         
         if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
         {
            IconImageView . frame = CGRectMake(8.0, 1.5*adCoverMediaView_height+FBMediaView_top, 50, 50);
             
         }
         else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
         {
             
             IconImageView . frame = CGRectMake(8.0, adCoverMediaView_height+FBMediaView_top, 50, 50);

         }
        else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
         {
             
             IconImageView . frame = CGRectMake(8.0, adCoverMediaView_height+FBMediaView_top+5, 50, 50);
             

           
             
         }
         
         
         
         
         
         
         
         [nativeAdView addSubview:IconImageView];
     }];
    
    //title
   
    titleLabel.text = nativeAd.title;
    [titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]];
    [nativeAdView addSubview:titleLabel];
    
    //Descrption
    
    
    desc.text = nativeAd.body;
    [desc setFont:[UIFont systemFontOfSize:12]];
    desc.numberOfLines = 0;
    [nativeAdView addSubview:desc];
    
    //CallToAction
    
    
    
    actionBut.backgroundColor = [UIColor colorWithRed:0.043 green:0.71 blue:1 alpha:1];
    [actionBut setTitle:nativeAd.callToAction forState:UIControlStateNormal];
    actionBut.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:11];
    [nativeAdView addSubview:actionBut];
    
    [self.view addSubview:nativeAdView];
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

-(void)addShareAdsView
{
    float adHeightPercentage = 0.50;
  //  float height_Val = 100;
    
    CGRect webFrame;
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        adHeightPercentage = 0.60;
        
        webFrame = CGRectMake(0,
                              (fullScreen.size.height- (fullScreen.size.width * adHeightPercentage-70)),
                              fullScreen.size.width,
                              fullScreen.size.height- (fullScreen.size.width * adHeightPercentage));
        
    }
    
    else
    {
        if (fullScreen.size.height > 600)
        {
            adHeightPercentage = 0.70;
            
          //  height_Val = 65;
            
            NSLog(@"Running in 600");
        }
        
        
        webFrame = CGRectMake(0,
                              (fullScreen.size.height- (fullScreen.size.width * adHeightPercentage)-70),
                              fullScreen.size.width,
                              fullScreen.size.height- (fullScreen.size.width * adHeightPercentage));
        
    }
    
    UIWebView   *webViewForAd = [[UIWebView alloc] init];
    webViewForAd . tag = webViewTag;
    
    
    
    
   /* if (UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())
    {
        
        
        
        webViewForAd . frame = CGRectMake(0, adHeightPercentage + Share_Strip +410 , fullScreen.size.width, fullScreen.size.height - (adHeightPercentage + 2 * Share_Strip+330));
        
        
        
        NSLog(@"Running ipad");
        
    }
    
    else
    {
        
        if (fullScreen.size.height > 600)
        {
            NSLog(@"Running > 600");
            
            
            
            webViewForAd . frame = CGRectMake(0, adCoverMediaView_height + Share_Strip +300, fullScreen.size.width, fullScreen.size.height - (adCoverMediaView_height + 2 * Share_Strip+250));
            
        }
        
        
        else if (fullScreen.size.height > 480.0)
        {
            
            webViewForAd . frame = CGRectMake(0, adCoverMediaView_height + Share_Strip +170, fullScreen.size.width, fullScreen.size.height - (adCoverMediaView_height + 2 * Share_Strip+110));
            
            
            NSLog(@"Running > 480");
        }
        
        
        else
        {
            
            webViewForAd . frame = CGRectMake(0, adCoverMediaView_height + Share_Strip +380, fullScreen.size.width, fullScreen.size.height - (adCoverMediaView_height + 2 * Share_Strip+250));
            
        }
        
    }*/
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
         webViewForAd . frame = CGRectMake(0, adCoverMediaView_height + Share_Strip+230 , fullScreen.size.width, fullScreen.size.height - (adCoverMediaView_height + Share_Strip+230));
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
       webViewForAd . frame = CGRectMake(0, adCoverMediaView_height + Share_Strip +160, fullScreen.size.width, fullScreen.size.height - (adCoverMediaView_height+Share_Strip+150 ));
       
        
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
         webViewForAd . frame = CGRectMake(0, adCoverMediaView_height + Share_Strip +160, fullScreen.size.width, fullScreen.size.height - (adCoverMediaView_height + 2 * Share_Strip+110));
        
    }

    
    
    
    NSLog(@"%f\t%f\t%f",(fullScreen.size.height- (fullScreen.size.width * adHeightPercentage)),
          fullScreen.size.width,
          fullScreen.size.width * adHeightPercentage);
    
    webViewForAd . backgroundColor = [UIColor clearColor];
    webViewForAd . delegate = self;
    [self.view addSubview:webViewForAd];
    
    webViewForAd . hidden = YES;
    webViewForAd . scalesPageToFit = YES;
    [webViewForAd loadRequest:[self getTheUrlRequestForAd]];
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    webView.hidden = NO;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Failed to load ad : %@",[error description]);
    webView.hidden = YES;
}

-(NSURLRequest *)getTheUrlRequestForAd
{
    
    
    NSString *urlString = [NSString stringWithFormat:@"http://applyads.com/share_ads.php?id=940386298&cat=photo"];
    NSURL *adUrl = [NSURL URLWithString:urlString];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:adUrl];
    return requestObj;
    
    
}
- (void)sharer:(id<FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results
{
    NSLog(@"completed share:%@", results);
}

- (void)sharer:(id<FBSDKSharing>)sharer didFailWithError:(NSError *)error
{
    NSLog(@"sharing error:%@", error);
    
}

- (void)sharerDidCancel:(id<FBSDKSharing>)sharer
{
    NSLog(@"share cancelled");
}







#pragma mark - Orientation

/*- (FBInterfaceOrientationMask)supportedInterfaceOrientations
 {
 return UIInterfaceOrientationMaskPortrait;
 }*/

















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
