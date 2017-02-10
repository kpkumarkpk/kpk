//
//  AppConfig.h
//  FaceBookNativeAdTest
//
//  Created by Deepti's Mac on 12/3/15.
//  Copyright © 2015 D.Yoganjulu  Reddy. All rights reserved.
//

#ifndef AppConfig_h
#define AppConfig_h

#define applicationId 1136130593
#define applicationName @"Pic Projector"

//#define appReviewUrl @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d"
#define appReviewUrl @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d"
static NSString *const iOSAppStoreURLFormat = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d";
#define websiteUrl @"http://www.outthinkingindia.com"
#define facebookId @"564692443591238"
#define instagramUrl @"http://www.instagram.com/outthinking"
#define facebookUrl @"fb://profile/%@"
#define moreAppsUrl @"http://appstore.com/outthinkinglimited"
#define appIconName @"1024.png"
#define facebookPlacementId @"1718429068407302_1718429608407248"
#define fullScreen [[UIScreen mainScreen]bounds]
#define fullscreen_Admob_id   ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?@"ca-app-pub-8572140050384873/1919845940" : @"ca-app-pub-8572140050384873/1919845940")
#define aboutAppScreenHightGap     ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?300 : 50)
#define adHieghtPercentage         ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?0.42f : 0.36f)
//#define adHieghtPercentage         ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?0.40f : 0.4f)
#define toolbarHeight 50.0
#define toolbarHeightbut 50.0
#define adView_height 0.5
#define  adBagViewTag 100
#define  adScrollviewTag 101
#define addSize         ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?350 : 120)
#define ad_gap         ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?45 : 30)

#define startAdHieghtPercentage         ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?0.47f : 0.45f)
#endif /* AppConfig_h */
