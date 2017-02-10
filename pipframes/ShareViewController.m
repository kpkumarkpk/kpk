//
//  ShareViewController.m
//  secondapp
//
//  Created by OUTTHINKING PVT LTD on 2/3/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//



#import "ShareViewController.h"

#import "Config.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

#import "PreviewViewController.h"

#define topStrip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:60.0)
#define nativeAdstrip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?300.0:250.0)
#define moreAppStrip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?300.0:250.0)
#define topStrip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:60.0)
#define nativeAdstrip ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?300.0:250.0)
#define adCoverMediaView_height  ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 340  : [[UIScreen mainScreen]bounds].size.width/3)
#define FBMediaView_top ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 100  : 100)

#define screenWidth    ([[UIScreen mainScreen]bounds].size.width)
#define screenHeight   ([[UIScreen mainScreen]bounds].size.height)
@interface ShareViewController ()
@property(strong, nonatomic) NSString *feedbackMsg;
@property (strong,  nonatomic) UIDocumentInteractionController *doccontroller;


@end

@implementation ShareViewController

@synthesize shareview,finalscreenshot,doccontroller,finalscreen;

- (void)viewDidLoad
{
    NSLog(@"working");
    
    
    [super viewDidLoad];
    

    self.navigationItem.title=@"Share";
    
    [self.view setContentMode:UIViewContentModeScaleAspectFit];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.227 green:0.227 blue:0.227 alpha:1]];
    
    
    
    CGSize itemSize;
    
    CGRect imageRect;
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        itemSize = CGSizeMake(320,600);
        imageRect = CGRectMake(0, 0, 320,600);
        UIGraphicsBeginImageContext(itemSize);
        [finalscreenshot drawInRect:imageRect];
    }
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        itemSize = CGSizeMake(320,550);
        imageRect = CGRectMake(0, 0, 320,550);
        UIGraphicsBeginImageContext(itemSize);
        [finalscreenshot drawInRect:imageRect];
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        itemSize = CGSizeMake(screenWidth,screenHeight);
        imageRect = CGRectMake(0, 0, screenWidth+1070,screenHeight+730);
        UIGraphicsBeginImageContext(itemSize);
        [finalscreenshot drawInRect:imageRect];
    }
    
    finalscreenshot = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    [self allocateMenuBarSharePage];
    
    
    [super viewDidLoad];
    
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
    
    UIView *_topView1 = [[UIView alloc]initWithFrame:CGRectMake(0,0,fullScreen.size.width ,downstrip_height)];
    [_topView1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"downstrip_img.jpg"]]];
    [self.view addSubview:_topView1];
    
    
    UIButton*backButton,*gallerybutton,*facebook,*instagram,*gmail;
    
    backButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    gallerybutton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    facebook =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    instagram =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    gmail =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        backButton.center=CGPointMake(self.view.frame.size.width*0.13, downstrip_height*0.5);
        
        gallerybutton.center=CGPointMake(self.view.frame.size.width*0.32, downstrip_height*0.5);
        
        facebook.center=CGPointMake(self.view.frame.size.width*0.50, downstrip_height*0.5);
        
        instagram.center=CGPointMake(self.view.frame.size.width*0.69, downstrip_height*0.5);
        
        gmail.center=CGPointMake(self.view.frame.size.width*0.88, downstrip_height*0.5);
        
    }
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        backButton.center=CGPointMake(self.view.frame.size.width*0.13, downstrip_height*0.5);
        
        gallerybutton.center=CGPointMake(self.view.frame.size.width*0.32, downstrip_height*0.5);
        
        facebook.center=CGPointMake(self.view.frame.size.width*0.50, downstrip_height*0.5);
        
        instagram.center=CGPointMake(self.view.frame.size.width*0.69, downstrip_height*0.5);
        
        gmail.center=CGPointMake(self.view.frame.size.width*0.88, downstrip_height*0.5);
    }
    
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        backButton.center=CGPointMake(self.view.frame.size.width*0.13, downstrip_height*0.5);
        
        gallerybutton.center=CGPointMake(self.view.frame.size.width*0.32, downstrip_height*0.5);
        
        facebook.center=CGPointMake(self.view.frame.size.width*0.50, downstrip_height*0.5);
        
        instagram.center=CGPointMake(self.view.frame.size.width*0.69, downstrip_height*0.5);
        
        gmail.center=CGPointMake(self.view.frame.size.width*0.88, downstrip_height*0.5);
        
    }
    
    // --------- Back Button ----------------//
    
    
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_active"] forState:UIControlStateHighlighted];
    backButton .contentMode = UIViewContentModeScaleAspectFit;
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backhere) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
    [gallerybutton setBackgroundImage:[UIImage imageNamed:@"save"] forState:UIControlStateNormal];
    [gallerybutton setBackgroundImage:[UIImage imageNamed:@"save_act"] forState:UIControlStateHighlighted];
    gallerybutton .contentMode = UIViewContentModeScaleAspectFit;
    [gallerybutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [gallerybutton addTarget:self action:@selector(galleryhere) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gallerybutton];
    

    
    
    [facebook setBackgroundImage:[UIImage imageNamed:@"fb"] forState:UIControlStateNormal];
    [facebook setBackgroundImage:[UIImage imageNamed:@"fb_act"] forState:UIControlStateHighlighted];
    facebook .contentMode = UIViewContentModeScaleAspectFit;
    [facebook setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [facebook addTarget:self action:@selector(facebookhere) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:facebook];
    
    
    
    [instagram setBackgroundImage:[UIImage imageNamed:@"instagram"] forState:UIControlStateNormal];
    [instagram setBackgroundImage:[UIImage imageNamed:@"instagram_act"] forState:UIControlStateHighlighted];
    instagram .contentMode = UIViewContentModeScaleAspectFit;
    [instagram setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [instagram addTarget:self action:@selector(sharingInstagram) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:instagram];
    

    
    
    [gmail setBackgroundImage:[UIImage imageNamed:@"mail"] forState:UIControlStateNormal];
    [gmail setBackgroundImage:[UIImage imageNamed:@"mail_act"] forState:UIControlStateHighlighted];
    gmail .contentMode = UIViewContentModeScaleAspectFit;
    [gmail setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [gmail addTarget:self action:@selector(mailhere) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gmail];
    

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
            
            [controller setInitialText:@"Wow! I love this Pic Projector App called  “PicProjector”.  Awesome app to show projector animation on photo. You can download this free app at"];
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

//-(void)sharingToInstagram
//
//{
//    
//    
//    NSLog(@"instagramshare");
//    
//    UIImage *finalImage = finalscreenshot;
//    
//    NSString *pathToSave = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/captions1.ig"];
//    
//    [UIImageJPEGRepresentation(finalImage, 1.0) writeToFile:pathToSave atomically:YES];
//    
//    NSURL *url = [NSURL URLWithString:@"instagram://InstaZCollageFx"];
//    if([[UIApplication sharedApplication]canOpenURL:url])
//    {
//        doccontroller
//        = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:pathToSave]];
//        doccontroller.UTI = @"com.instagram.photo";
//        doccontroller.delegate = self;
//        
//        [doccontroller setAnnotation:@{@"InstagramCaption" : @"Wow!! This Free “Selfie camera” App (on IG @Selfie Camera) helped me to Filtering Camera. ."}];
//        CGRect rect =CGRectMake(0, 0, screenWidth+1070,screenHeight+730);
//        //CGRectMake(0, 150,300, 300);
//        
//        [doccontroller presentOpenInMenuFromRect:rect inView:self.view animated:YES];
//    }
//    else {
//        UIAlertView *alertView = [[UIAlertView alloc]
//                                  initWithTitle:@"Sorry"
//                                  message:@"Instagram not installed in this device!\nTo share image please install instagram."
//                                  delegate:nil
//                                  cancelButtonTitle:@"OK"
//                                  otherButtonTitles:nil];
//        [alertView show];
//        
//    }
//    
//    return;
//    
//    
//}
//
//

-(void)sharingInstagram
{
    
        NSLog(@"instagramshare");
    
        UIImage *finalImage = finalscreenshot;
    
        NSString *pathToSave = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/captions1.ig"];
    
        [UIImageJPEGRepresentation(finalImage, 1.0) writeToFile:pathToSave atomically:YES];
    
        NSURL *url = [NSURL URLWithString:@"instagram://InstaZCollageFx"];
        if([[UIApplication sharedApplication]canOpenURL:url])
        {
            doccontroller
            = [UIDocumentInteractionController interactionControllerWithURL:[NSURL fileURLWithPath:pathToSave]];
            doccontroller.UTI = @"com.instagram.photo";
            doccontroller.delegate = self;
    
            [doccontroller setAnnotation:@{@"InstagramCaption" : @"Wow!! This Free “Pic Projector” App (on IG @Pic Project) helped me to show projector effect on image. ."}];
            CGRect rect =CGRectMake(0, 150,300, 300);
          
    
            [doccontroller presentOpenInMenuFromRect:rect inView:self.view animated:YES];
        }
        else {
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
    
    [picker setSubject:@"Try this Awesome Pic Projector App"];
    
    UIImage *finalImage = finalscreenshot;
    
    NSData *myData = UIImagePNGRepresentation(finalImage);
    [picker addAttachmentData:myData mimeType:@"image/png" fileName:@"coolImage.png"];
    
    // Fill out the email body text
    NSString *emailBody = @"Hi, \n\r \n\r I just came across this awesome Free Pic projector App called “Pic Projector ” from Out Thinking Pvt Ltd. A very nice and FREE app to show projector animation on image easily. I recommend you to try this app once on your device as well. \n\r \n\r Free pic Projector App Download Link: https://itunes.apple.com/app/id1136130593 \n\r \n\r \n\r Regards, \n\r App lover";
    
    [picker setMessageBody:emailBody isHTML:NO];
    
    [self presentViewController:picker animated:YES completion:NULL];
}

#pragma mark - Delegate Methods
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{

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
    FBNativeAd *nativeAd = [[FBNativeAd alloc] initWithPlacementID:@"1718429068407302_1718429608407248"];
    nativeAd.delegate = self;
    [nativeAd loadAd];
}

- (void)nativeAdDidLoad:(FBNativeAd *)nativeAd
{
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *nativeAdView  = [[UIView alloc]initWithFrame:CGRectMake(0.0, Share_Strip+2, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height/2-10)];
    nativeAdView.backgroundColor = [UIColor whiteColor];
    
    UILabel *Sponsored = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5, [[UIScreen mainScreen]bounds].size.width, 10)];
    Sponsored.text = @"Sponsored";
    Sponsored.textColor = [UIColor grayColor];
    [Sponsored setFont:[UIFont fontWithName:@"HelveticaNeue" size:10]];
    [nativeAdView addSubview:Sponsored];
    
    
    FBMediaView *adCoverMediaView = [[FBMediaView alloc] initWithFrame:CGRectMake(10.0, (Share_Strip+8), [[UIScreen mainScreen]bounds].size.width-20, adCoverMediaView_height)];
    [adCoverMediaView setBackgroundColor:[UIColor blueColor]];
    
    [adCoverMediaView setNativeAd:nativeAd];
    [nativeAdView addSubview:adCoverMediaView];
    
    //Icon
    [nativeAd.icon loadImageAsyncWithBlock:^(UIImage *image)
     {
         UIImageView *IconImageView = [[UIImageView alloc] initWithImage: image];
         IconImageView . frame = CGRectMake(8.0, adCoverMediaView_height+FBMediaView_top, 50, 50);
         [nativeAdView addSubview:IconImageView];
     }];
    
    //title
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(65.0, adCoverMediaView_height+FBMediaView_top+5, [[UIScreen mainScreen]bounds].size.width-155, 15)];
    titleLabel.text = nativeAd.title;
    [titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:14]];
    [nativeAdView addSubview:titleLabel];
    
    //Descrption
    UILabel *desc = [[UILabel alloc] initWithFrame:CGRectMake(65.0, (adCoverMediaView_height+FBMediaView_top)+20, [[UIScreen mainScreen]bounds].size.width-155, 20)];
    desc.text = nativeAd.body;
    [desc setFont:[UIFont systemFontOfSize:12]];
    desc.numberOfLines = 0;
    [nativeAdView addSubview:desc];
    
    //CallToAction
    UIButton *actionBut = [UIButton buttonWithType:UIButtonTypeCustom];
    actionBut.frame = CGRectMake([[UIScreen mainScreen]bounds].size.width-80, (adCoverMediaView_height+FBMediaView_top)+10, 75, 25);
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
    float height_Val = 100;

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
            height_Val = 65;
            NSLog(@"Running in 600");
        }
        webFrame = CGRectMake(0,
                              (fullScreen.size.height- (fullScreen.size.width * adHeightPercentage)-70),
                              fullScreen.size.width,
                              fullScreen.size.height- (fullScreen.size.width * adHeightPercentage));
    }

    UIWebView   *webViewForAd = [[UIWebView alloc] init];
    webViewForAd . tag = webViewTag;
    if (UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())
    {

        webViewForAd . frame = CGRectMake(0, self.view.frame.size.height*0.55, fullScreen.size.width, moreAppStrip+160);

        NSLog(@"Running ipad");
    }

    else
    {

        if (fullScreen.size.height > 600)
        {
            NSLog(@"Running > 600");

            webViewForAd . frame = CGRectMake(0, self.view.frame.size.height*0.55, fullScreen.size.width, moreAppStrip+90);
        }
        else if (fullScreen.size.height > 480.0)
        {
            webViewForAd . frame = CGRectMake(0, self.view.frame.size.height*0.55, fullScreen.size.width, moreAppStrip+90);

            NSLog(@"Running > 480");
        }

        else
        {
            webViewForAd . frame = CGRectMake(0, self.view.frame.size.height*0.60, fullScreen.size.width, moreAppStrip);
        }

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
