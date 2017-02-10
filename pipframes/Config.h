//
//  Config.h
//  VideoEditor
//
//  Created by Deepti's Mac on 5/14/14.
//  Copyright (c) 2014 D.Yoganjulu  Reddy. All rights reserved.
//

#ifndef VideoEditor_Config_h
#define VideoEditor_Config_h

#define fullScreen ([[UIScreen mainScreen]bounds])
#define maximumSizeofVideoInMB 20.0

#define itoapp_ios6 @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%@&mt=8"
#define itoapp_ios7 @"itms-apps://itunes.apple.com/app/id%@"
#define ilinktoApp ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)?itoapp_ios7:itoapp_ios6
#define proappId @"881323364"
#define videoCollageAppId @"722633887"

#define  frameButtonSize  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?185.0:97.0)

#define label_height  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?70.0:50.0)
#define divisor  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?4:3)
#define start_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?200.0:120.0)
#define start_width ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?70.0:50.0)
#define closeButton_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?40.0:30.0)
#define stripHeight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?50.0:50.0)
#define videoViewSize ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?300.0:150.0)
#define editorScreenColor ([UIColor colorWithRed:0.13 green:0.13 blue:0.13 alpha:1.0])
#define editorStripColor ([UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.7])
#define cancelButtonColor ([UIColor colorWithRed:(0.0/255.0) green:(191.0/255.0) blue:(255.0/255.0) alpha:1.0])
#define applyButtonColor ([UIColor colorWithRed:(0.0/255.0) green:(191.0/255.0) blue:(255.0/255.0) alpha:1.0])
#define xCoordinate ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?80.0:5.0)
#define backButtonWidth ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?150.0:100.0)
#define effectTitleLabelFontSize    ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?15.0:10.0)
#define cropOptionGap  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?65.0:15.0)


#if defined(VideoSquare) || defined(VideoOverlay)

#define more_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?112.0:56.0)
#define facebook_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?84.0:40.0)


#else

#define free_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?138.0:69.0)
#define more_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?138.0:69.0)
#define facebook_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())? 45.0:40.0)
#define facebook_width ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?45.0:9.0)
#define instagram_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?34.0:17.0)
#define twitter_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?34.0:17.0)
#define twitter_width ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?41.0:20.0)

#endif


#define customBarHeight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?44.0:49.0)

#define topBar_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?49.0:44.0)
    //#define videoButton_width ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?130.0:110.0)
#define videoButton_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?130.0:100.0)
#define popUp_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?300.0:300.0)
#define popUp_label_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?150.0:100.0)
#define popUp_button_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?50.0:50.0)
#define popUp_button_width ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?150.0:150.0)

#define galleryView_Hieight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?150.0:120.0)
#define playerView_Hieight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?600.0:280.0)
#define playButton_Hieight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?100.0:50.0)
#define selectMusic_Width ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?70.0:50.0)
#define baseView_height     ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?50.0:40.0)
#define songTitleLabel_width    ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?400.0:150.0)
#define songTitleLabel_height     ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?80.0:40.0)
#define switch_width     ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?70.0:60.0)
#define switch_height     ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?40.0:40.0)
#define bannerad_height  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?70.0:50.0)
#define heightFor480 80.0

/* editor screen */
#define editor_preview_size  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?600.0:300.0)
#define menubar_height  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?100.0:50.0)
#define optionBar_height  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?120.0:100.0)
#define cropBar_height  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?100.0:70.0)
/* share screen */
#define shareItemButton_width      ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:40.0)
#define shareItemButton_height      ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:40.0)
#define shareItemStrip_height      ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?80.0:60.0)
#define yAxis      ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?80.0:50.0)
    //Tags
#define baseViewTag 1001
#define portraitButtonTag 1002
#define landscapeButtonTag 1003
#define squareButtonTag 1004
#define playButtonTag 1005
#define musicSwitchTag 1006
#define selectMusicButtonTag 1007
#define bgViewTag 1008
#define scrollviewTag 1009
#define frameViewTag 1010
#define colorPatternBaseViewTag 1011
#define webViewTag 1012
#define  overlayViewTag 1013
#define overlayOptionViewTag 1014
#define categoryViewTag 1015
#define categoryScrollViewTag 1016
#define itemScrollViewTag 1017
#define effectOptionViewTag 1018
#define effectOptionScrollViewTag 1019
#define videoSelectionBackgroundTag 1020
#define videoSelectionScrollViewTag 1021
#define sliderbackgroundTag 1022
#define alertViewTagForEffect 1023
#define cropViewBottomBar 1024
#define cropRatioScrollViewTag 1025
/* image names */



/* second screen */

#define editbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"edit_ipad.png":@"edit.png")
#define effectbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"effect.png":@"effect.png")
#define overlaybuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"overlay.png":@"overlay.png")
#define cropbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"crop.png":@"crop.png")

     //#define plusbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"plusbutton_ipad.png":@"plusbutton.png")
#define playbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"playbutton_ipad.png":@"play_button.png")

#define whitelineImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"whiteline_ipad.png":@"whiteline.png")

#define portrait_video_Image  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"portrait_op_ipad.png":@"portrait_op.png")
#define landscape_video_Image  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"landscape_op_ipad.png":@"landscape_op.png")
#define square_video_Image  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"square_op_ipad.png":@"square_op.png")
#define lock_image ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"lock_vs.png":@"lock_vs.png")
#define closeOptionButtonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"Close_overlay@2x.png":@"Close_overlay.png")

#if defined(VideoMergerPro)
/* ----------------------------------------------------------------Video Merger Pro----------------------------------------------------------------------*/
/* app details */
#define appName @"VideoMerger"
#define app_Id 881323364
#define appIdInString @"881323364"

#define title_font ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?75.0:50.0)
#define title_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?120.0:80.0)
#define startButtonPercentage ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?0.3:0.3)
#define moreButtonPercentage ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?0.75:0.7)
#define youtube_developerKey @"AIzaSyCjG__AyCXLNg5W5XcNIjCOjg3p03t60VU"
#define youtube_clienID   @"694892442743-f2dmqbdjqmkj004kpgl3omoomp9f8knn.apps.googleusercontent.com"

     //@"694892442743.apps.googleusercontent.com"


/* first screen  */
#define bottomStripHeight  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?116.0:50.0)
#define startButtonHeight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?116.0:60.0)
#define moreButtonHeight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())? 116.0:60.0)
#define startButtonIconHeight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?92.0:46.0)
#define moreButtonIconHeight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?92.0:46.0)
#define facebookButtonIconHeight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?75.0:50.0)
#define facebookButtonIconHeight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?75.0:50.0)


#define startbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"start_button_vmp_ipad.png":@"start_button_vmp.png")

#define morebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"more_button_vmp_ipad.png":@"more_button_vmp.png")

#define startbuttonIconImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"start_icon_vmp_ipad.png":@"start_icon_vmp.png")

#define morebuttonIconImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"more_icon_vmp_ipad.png":@"more_icon_vmp.png")


#define facebookbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"fb_vmp_ipad.png":@"fb_vmp.png")

#define instagrambuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"instagram_vmp_ipad.png":@"instagram_vmp.png")

#define mailButtonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_vmp_ipad.png":@"mail_vmp.png")

#define buttomStripImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"strip_vmp_ipad.png":@"strip_vmp.png")

#define backbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"backButton_ipad.png":@"back_button.png")
#define musicbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"musicbutton_ipad.png":@"musicButton.png")
#define colorImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"colour-brush_ipad.png":@"colour-brush.png")
#define sharebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"sharebutton_ipad.png":@"share.png")
#define plusbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"plusbutton_ipad.png":@"plusbutton.png")



/*  Share Item image */
#define albumShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"gallery_share_ipad.png":@"gallery_share.png")
#define mailShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_share_ipad.png":@"mail_share.png")
#define instagramShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"instagram_share_ipad.png":@"instagram_share.png")
#define viddyShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"viddy_share_ipad.png":@"viddy_share.png")
#define youtubeShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"youtube_share_ipad.png":@"youtube_share.png")


#elif defined(VideoSquare)
/* ---------------------------------------------------------------Video Square-----------------------------------------------------------------------*/
#define appName @"VideoSquare"
#define appId 889899887
#define appIdInString @"889899887"


#define title_font ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:35.0)
#define title_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?120.0:80.0)


#define youtube_developerKey @"AIzaSyBTux0YviQfu3Ppzn-FvijOFxHYXdA1588"
#define youtube_clienID @"720110108211-snp6sqe5pd7q00u1d9jj7f1cc6us227v.apps.googleusercontent.com"

#define admobpublishedid_iphone @"ca-app-pub-8572140050384873/6869717544"
#define admobmediationid_iphone @"ca-app-pub-8572140050384873/6869717544"
#define admobmediationid_ipad @"ca-app-pub-8572140050384873/6869717544"
#define admobpublishedid_ipad @"ca-app-pub-8572140050384873/6869717544"
#define fullscreen_admob_id   ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?@"ca-app-pub-8572140050384873/8346450748" : @"ca-app-pub-8572140050384873/8346450748")


/* first screen  */
#define startbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"start_vs_ipad.png":@"start_vs.png")
#define freebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"free_vs@2x.png":@"free_vs.png")
#define morebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"more_vs@2x.png":@"more_vs.png")
#define facebookbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"facebook_vs@2x.png":@"facebook_vs.png")
#define instagrambuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"instagram_vs@2x":@"instagram_vs.png")
#define twitterbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_vs@2x.png":@"mail_vs.png")


#define plusbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"add_vs_ipad.png":@"add_vs.png")
#define backbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"back_vs_ipad.png":@"back_vs.png")
#define musicbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"music_vs_ipad.png":@"music_vs.png")
#define colorImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"color_vs_ipad.png":@"color_vs.png")
#define sharebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"share_vs_ipad.png":@"share_vs.png")
#define framebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"frame_vs_ipad.png":@"frame_vs.png")



/*  Share Item image */
#define albumShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"gallery_share_vs_ipad.png":@"gallery_share_vs.png")
#define mailShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_share_vs_ipad.png":@"mail_share_vs.png")
#define instagramShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"instagram_share_vs_ipad.png":@"instagram_share_vs.png")
#define viddyShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"viddy_share_vs_ipad.png":@"viddy_share_vs.png")
#define youtubeShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"youtube_share_vs_ipad.png":@"youtube_share_vs.png")


#elif defined(VideoOverlay)
/* ---------------------------------------------------------------Video Overlay-----------------------------------------------------------------------*/
#define appName @"VidFx"
#define appId 912284742
#define appIdInString @"912284742"
#define title_font ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:35.0)
#define title_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?120.0:80.0)

#define youtube_developerKey @"AIzaSyAddY3o_5_AqFsVtQkN6apRP0zO4PDQkK0"
#define youtube_clienID @"586859638202-sr5dgookvt9f6lhji17ttic7guf8kper.apps.googleusercontent.com"

#define admobpublishedid_iphone @"ca-app-pub-8572140050384873/6186132747"
#define admobmediationid_iphone @"ca-app-pub-8572140050384873/6186132747"
#define admobmediationid_ipad @"ca-app-pub-8572140050384873/6186132747"
#define admobpublishedid_ipad @"ca-app-pub-8572140050384873/6186132747"
#define fullscreen_admob_id   ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?@"ca-app-pub-8572140050384873/7662865949" : @"ca-app-pub-8572140050384873/7662865949")


/* first screen  */
#define startbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"start_vo@2x.png":@"start_vo.png")
#define freebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"free_vo@2x.png":@"free_vo.png")
#define morebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"more_vo@2x.png":@"more_vo.png")
#define facebookbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"facebook_vo@2x.png":@"facebook_vo.png")
#define instagrambuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"instagram_vo@2x":@"instagram_vo.png")
#define twitterbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_vo@2x.png":@"mail_vo.png")

#define backbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"backButton_ipad.png":@"back_button.png")
#define musicbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"musicbutton_ipad.png":@"musicButton.png")
#define colorImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"colour-brush_ipad.png":@"colour-brush.png")
#define sharebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"sharebutton_ipad.png":@"share.png")
#define plusbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"plusbutton_ipad.png":@"plusbutton.png")


/*  Share Item image */
#define albumShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"gallery_share_ipad.png":@"gallery_share.png")
#define mailShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_share_ipad.png":@"mail_share.png")
#define instagramShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"instagram_share_ipad.png":@"instagram_share.png")
#define viddyShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"viddy_share_ipad.png":@"viddy_share.png")
#define youtubeShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"youtube_share_ipad.png":@"youtube_share.png")



#else

/* -----------------------------------------------------------Video Merger---------------------------------------------------------------------------*/
/* app details   for Video Merger */
#define appName @"VideoMerger"
#define app_Id 880953154
#define appIdInString @"880953154"

#define title_font ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?60.0:35.0)
#define title_height ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?120.0:80.0)
     //#define mailbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_vo@2x.png":@"mail_vo.png")

#define youtube_developerKey @"AIzaSyBskcQTP0wlnV9ytfhZr3womqTJcHIUqXE"
     //#define youtube_clienID @"163001081725.apps.googleusercontent.com"
#define youtube_clienID @"163001081725-frm4kbjdjk7hfmkpuqa8un78rvdhqlg0.apps.googleusercontent.com"
#define admobpublishedid_iphone @"ca-app-pub-8572140050384873/2299917146"
#define admobmediationid_iphone @"ca-app-pub-8572140050384873/2299917146"
#define admobmediationid_ipad @"ca-app-pub-8572140050384873/2299917146"
#define admobpublishedid_ipad @"ca-app-pub-8572140050384873/2299917146"
//#define fullscreen_admob_id   ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ?@"ca-app-pub-8572140050384873/3776650340" : @"ca-app-pub-8572140050384873/3776650340")
#define fullscreen_admob_id @"ca-app-pub-8572140050384873/5322703949"
/* first screen  */
#define startbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"start_ipad.png":@"start.png")
#define freebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"free_vo_ipad.png":@"free_vo.png")
#define morebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"more_vo@2x.png":@"more_vo.png")
#define facebookbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"facebook_vo_ipad.png":@"facebook_vo.png")
#define instagrambuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"instagram_vo_ipad":@"instagram_vo.png")
#define mailbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_vo_ipad.png":@"mail_vo.png")

#define backbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"backButton_ipad.png":@"back_button.png")
#define musicbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"musicbutton_ipad.png":@"musicButton.png")
#define colorImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"colour-brush_ipad.png":@"colour-brush.png")
#define sharebuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"sharebutton_ipad.png":@"share.png")
#define plusbuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"plusbutton_ipad.png":@"plusbutton.png")
#define probuttonImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"pro_ipad.png":@"pro.png")


/*  Share Item image */
#define albumShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"gallery_share_ipad.png":@"gallery_share.png")
#define mailShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"mail_share_ipad.png":@"mail_share.png")
#define instagramShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"instagram_share_ipad.png":@"instagram_share.png")
#define viddyShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"viddy_share_ipad.png":@"viddy_share.png")
#define youtubeShareImage  ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?@"youtube_share_ipad.png":@"youtube_share.png")


#define ImageView_Hieight ((UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())?700.0:280.0)



#endif
#endif
