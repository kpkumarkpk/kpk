//
//  FilterViewController.m
//  
//
//  Created by OUTTHINKING PVT LTD on 4/6/16.
//
//

#import "FilterViewController.h"

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Config.h"
#import <AVFoundation/AVFoundation.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "GPUImage.h"
#import "PreviewViewController.h"
#import "AppConfig.h"

#define screenWidth                         ([[UIScreen mainScreen]bounds].size.width)
#define screenHeight                        ([[UIScreen mainScreen]bounds].size.height)



int buttonindex;
int selectedImgTag;

int filtertag;

@interface FilterViewController ()<UINavigationControllerDelegate>
{
    
    GPUImagePicture *lookupImageSource;
    
    
    UIImage   *blurredImagefinal, * sample1,*sample3;
    
    
    UIImageView *screenimgv;
    
    UIImage *squaredscreenshotimg;
    Boolean buttonFlashing;
    
     UIImage * sample;
    int index1;
    int index2;
    UIImage *resultantImage;
    
    
    
}

@property (nonatomic , assign) int currentEffectNumber;


@end

@implementation FilterViewController

@synthesize selimg,blurredimgv,filterbt,mainview,maskimgv,clearedimgv,downscroll,menuitems,mybutton,maskimages,shapeimages,shapeimgv,frontimage,filterNames,blurredimage,backgroundstripimagev,filterbutton,interstitial,activeimage,blurredImage1,frontimage1,newimage1;

float player_y = 0.0;


-(void)viewWillAppear:(BOOL)animated

{
    
    [clearedimgv setImage:[self add_EffectOnImage:frontimage1 effectNumber:_currentEffectNumber]];
}


- (void)viewDidLoad
{
    
    
    [self uidesign];
 
    [self allocatemenubarforaddframespage];
    
    
    [super viewDidLoad];
    
    
    interstitial = [[GADInterstitial alloc] initWithAdUnitID:fullscreen_admob_id];
    GADRequest *request = [GADRequest request];
    
    [interstitial loadRequest:request];
    
    
    interstitial = [self createAndLoadInterstitial];
    
    [self addPreLoad];

    
   // [self showFullScreenAd];
    
   // [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(showFullScreenAd) name:UIApplicationDidBecomeActiveNotification  object:nil];
}


-(void)galleryhereshow
{
    
//    if (downscroll!=nil)
//    {
//       
//        [downscroll removeFromSuperview];
//        
////        [mybutton removeFromSuperview];
////        
////        [filterbt removeFromSuperview];
////        
//        filterbt=nil;
//        
//        mybutton=nil;
//        
//        downscroll=nil;
//    }
    
    
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Change Image here" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Fore-Ground Image",
                            
                            
                            nil];
    
    
    popup.tag = 1;
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        [popup showInView:self.view];
        
        NSLog(@"calling gallery");
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        UIAlertView *gallery=[[UIAlertView alloc]initWithTitle:@"changeImage!!" message:@"" delegate:self cancelButtonTitle:@"Cancel"otherButtonTitles:@"Foreground" ,nil];
        
        [gallery show];
        
        
    }
    
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
    NSLog(@"kkkkkkkkkk");
    if ([interstitial isReady])
    {
        
        [interstitial presentFromRootViewController:self];
    }
    
}


-(void)uidesign

{
    
    
    
    //---------------BLURRED IMAGEVIEW-----------------//
    
    
    blurredimgv=[[UIImageView alloc]init];
    
    clearedimgv=[[UIImageView alloc]init];
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
         blurredimgv . frame = CGRectMake(0,0, ImageView_Hieight+120, ImageView_Hieight+320);
        
        clearedimgv . frame = CGRectMake(55, 10, ImageView_Hieight,ImageView_Hieight);
        
        activeimage =[self squareImageFromImage:selimg scaledToSize:500];
        frontimage1=activeimage;
        
    }
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
       blurredimgv . frame = CGRectMake(0,0, ImageView_Hieight+120, ImageView_Hieight+250);
        
       clearedimgv . frame = CGRectMake(55, 10, ImageView_Hieight,ImageView_Hieight);
       
        activeimage =[self squareImageFromImage:selimg scaledToSize:500];
        frontimage1=activeimage;
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
         blurredimgv . frame = CGRectMake(0,0, ImageView_Hieight+120, ImageView_Hieight-150);
        
         clearedimgv . frame = CGRectMake(160, 20, 450, 450);
        
        
         activeimage =[self squareImageFromImage:selimg scaledToSize:500];
         frontimage1=activeimage;
        
    }
   
    blurredimgv.image=[UIImage imageNamed:@"bbbg_03.jpg"];
    blurredimgv.contentMode=UIViewContentModeScaleAspectFill;
    blurredImage1=activeimage;
    
    sample=blurredimgv.image;
    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(sample)forKey:@"SomeValue"];
    NSLog(@"image is fdgdtytfry %@",sample);
    
    
    CGFloat width = sample.size.width;
    CGFloat height = sample.size.height;
    
    NSLog(@"Captured image is %f  %f",width,height);
    
    NSLog(@" pip buttonpress method object at index%@",sample);
    
    [self.view addSubview:blurredimgv];
    
    //---------clear imageview--------//
    
    
    
   
    clearedimgv.backgroundColor = [UIColor clearColor];
     clearedimgv.clipsToBounds = YES;
   // clearedimgv.contentMode=UIViewContentModeScaleAspectFill;
    clearedimgv.image=frontimage1;
    [self.view addSubview:clearedimgv];

}


-(void)allocateresourcesfordefaultpip
{
    
    
    
    if (clearedimgv!=nil)
    {
        clearedimgv=nil;
    }
    
    if (blurredimgv!=nil)
    {
        blurredimgv=nil;
    }
    
    

    
     //---------------BLURRED IMAGEVIEW-----------------//
    
    
    blurredimgv=[[UIImageView alloc]init];
    blurredimgv . frame = CGRectMake(0,player_y, ImageView_Hieight+40, ImageView_Hieight+200);
   
    
    if (selectedImgTag==0)
    {
        
        blurredImage1 = [self squareImageWithImage:frontimage scaledToSize:blurredimgv.frame.size];
        
    }
    
    [self.view addSubview:blurredimgv];
    
    //--------main uiview-------------//
    
    mainview=[[UIView alloc]initWithFrame:(CGRectMake(0, 0, ImageView_Hieight+5,ImageView_Hieight))];
    [mainview setBackgroundColor:[UIColor clearColor]];
    [mainview setUserInteractionEnabled:YES];
    [self.view addSubview:mainview];
    
    
    //---------clear imageview--------//
    
    
    clearedimgv=[[UIImageView alloc]init];
    clearedimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,10, ImageView_Hieight+5, ImageView_Hieight);
    
    
    if (selectedImgTag==1)
    {
        newimage1 = [self squareImageWithImage:frontimage scaledToSize:blurredimgv.frame.size];
    }
    
    clearedimgv.image=frontimage1;
    
    
    [clearedimgv setUserInteractionEnabled:YES];
    [mainview addSubview:clearedimgv];
    
    [self viewWillAppear:YES];
    
    
}



+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}



//make sure image size as square:-
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
        downscroll.hidden=YES;
    
    
}
-(void)goBack
{
    
    [self.navigationController popViewControllerAnimated:NO];
    
 }

-(void)allocatemenubarforaddframespage
{
    
    UIView* _topView = [[UIView alloc]initWithFrame:CGRectMake(0,fullScreen.size.height-downstrip_height,fullScreen.size.width ,downstrip_height)];
    [_topView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"downstrip_img.jpg"]]];
    [self.view addSubview:_topView];
    
    UIButton*backButton,*gallerybutton,*backgroundbutton,*effects,*nextButton;
    
    
    
    backButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];

    backgroundbutton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    
    gallerybutton =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    
    effects =[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    
    nextButton =[[UIButton alloc]initWithFrame:CGRectMake(0, fullScreen.size.height-downstrip_height, 38, 38)];
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        backButton.center=CGPointMake(self.view.frame.size.width*0.13, self.view.frame.size.height*0.96);
        
        backgroundbutton.center=CGPointMake(self.view.frame.size.width*0.32, self.view.frame.size.height*0.96);
        
        gallerybutton.center=CGPointMake(self.view.frame.size.width*0.50, self.view.frame.size.height*0.96);
        
        effects.center=CGPointMake(self.view.frame.size.width*0.69, self.view.frame.size.height*0.96);
        
        nextButton.center=CGPointMake(self.view.frame.size.width*0.88, self.view.frame.size.height*0.96);

    }
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        backButton.center=CGPointMake(self.view.frame.size.width*0.13, self.view.frame.size.height*0.96);
        
        backgroundbutton.center=CGPointMake(self.view.frame.size.width*0.32, self.view.frame.size.height*0.96);
        
        gallerybutton.center=CGPointMake(self.view.frame.size.width*0.50, self.view.frame.size.height*0.96);
        
        effects.center=CGPointMake(self.view.frame.size.width*0.69, self.view.frame.size.height*0.96);
        
        nextButton.center=CGPointMake(self.view.frame.size.width*0.88, self.view.frame.size.height*0.96);
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        backButton.center=CGPointMake(self.view.frame.size.width*0.13, self.view.frame.size.height*0.976);
        
        backgroundbutton.center=CGPointMake(self.view.frame.size.width*0.32, self.view.frame.size.height*0.976);
        
        gallerybutton.center=CGPointMake(self.view.frame.size.width*0.50, self.view.frame.size.height*0.976);
        
        effects.center=CGPointMake(self.view.frame.size.width*0.69, self.view.frame.size.height*0.976);
        
        nextButton.center=CGPointMake(self.view.frame.size.width*0.88, self.view.frame.size.height*0.976);
        
    }
    
    // --------- Back Button ----------------//
    
   
    [backButton setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setBackgroundImage:[UIImage imageNamed:@"back_active"] forState:UIControlStateHighlighted];
    backButton .contentMode = UIViewContentModeScaleAspectFit;
    [backButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    
     // --------- backgroundbutton Button ----------------//
    
   
   
    [backgroundbutton setBackgroundImage:[UIImage imageNamed:@"bg"] forState:UIControlStateNormal];
    [backgroundbutton setBackgroundImage:[UIImage imageNamed:@"bg_active"] forState:UIControlStateHighlighted];
     backgroundbutton .contentMode = UIViewContentModeScaleAspectFit;
    [backgroundbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [backgroundbutton addTarget:self action:@selector(galleryhereshow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backgroundbutton];

    
    
    // --------- gallery Button ----------------//
    [gallerybutton setBackgroundImage:[UIImage imageNamed:@"fx"] forState:UIControlStateNormal];
    [gallerybutton setBackgroundImage:[UIImage imageNamed:@"fx_active"] forState:UIControlStateHighlighted];
    gallerybutton .contentMode = UIViewContentModeScaleAspectFit;
    [gallerybutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [gallerybutton addTarget:self action:@selector(filtereffects) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gallerybutton];
    

    
    // --------- effects Button ----------------//
    [effects setBackgroundImage:[UIImage imageNamed:@"bg11"] forState:UIControlStateNormal];
    [effects setBackgroundImage:[UIImage imageNamed:@"bg11_active"] forState:UIControlStateHighlighted];
    effects .contentMode = UIViewContentModeScaleAspectFit;
    [effects setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [effects addTarget:self action:@selector(addpiphere) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:effects];
    

    
    // --------- Next Button ----------------//
    [nextButton setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [nextButton setBackgroundImage:[UIImage imageNamed:@"next_active"] forState:UIControlStateHighlighted];
    nextButton .contentMode = UIViewContentModeScaleAspectFit;
    [nextButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(moveheretoanother) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];

    
    
    
    
    
}


-(void)addpiphere
{
    
    downscroll.hidden=NO;
    [self allocatemenubarforaddframespage];
    
    
    if (downscroll!=nil)
    {
        [downscroll removeFromSuperview];
        downscroll=nil;
        
        [mybutton removeFromSuperview];
         mybutton=nil;
    }
    
    
    
    //----------------Down UIscrollview for frames--------//
    
    
    
    int xCoord=0;
    int yCoord=4;
    int buffer = 5;
    
    
    
    
    downscroll=[[UIScrollView alloc]init];
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        int buttonHeight=screenWidth*0.2;
        
        
        
        downscroll.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+28);
        
        
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
        int buttonHeight=screenWidth*0.09;
        
        downscroll.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+28);
        
        
        
        
    }
    
   
    
    downscroll.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    
    
    downscroll.contentSize=activeimage.size;
    
    [downscroll setUserInteractionEnabled:YES];
    
    [downscroll setShowsHorizontalScrollIndicator:NO];
    
    [downscroll setShowsVerticalScrollIndicator:NO];
    
    [downscroll setUserInteractionEnabled:YES];
    
    
    [self.view addSubview:downscroll];
    
    //------applying animation------------//
    
    CATransition *strip_transition=[CATransition animation];
    strip_transition.type=kCATransitionPush;
    strip_transition.duration=0.50;
    [[downscroll layer] addAnimation:strip_transition forKey:@"down-strip.jpg"];
    
    [mybutton addSubview:downscroll];
    
    
    
    //-------------------Adding frames to Ui scrollview------------------//
    
    menuitems = [[NSArray alloc]initWithObjects:@"bg_03.jpg",@"bg_01.jpg",@"bg_02.jpg",@"bg_04.jpg",@"bg_05.jpg",@"bg_06.jpg",@"bg_07.jpg",@"bg_08.jpg",@"bg_09.jpg",@"bg_10.jpg",nil];
    
    
    for (int b=0;b<[menuitems count];b++)
    {
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        int buttonHeight=screenWidth*0.2;
        int buttonWidth=screenWidth*0.2;
        
        
        mybutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
        
        xCoord += buttonWidth + buffer;
        

        downscroll.contentSize=CGSizeMake(400, yCoord);

    }
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            
            int buttonHeight=screenWidth*0.2;
            int buttonWidth=screenWidth*0.2;
            
            
            mybutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            downscroll.contentSize=CGSizeMake(700, yCoord);
            
            
        }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
        {
            
            
            int buttonHeight=screenWidth*0.09;
            int buttonWidth=screenWidth*0.09;
            
            
            
            mybutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            downscroll.contentSize=CGSizeMake(100, yCoord);
            
            
            
        }
        
        
        [mybutton setTag:b];
        
        buttonindex=b;
        
        [mybutton setImage:[UIImage imageNamed:[menuitems objectAtIndex:b]] forState:UIControlStateNormal];
        
        [mybutton setSelected:true];
        
        NSLog(@"menuitems object at index%@",[menuitems objectAtIndex:b]);
        
        [mybutton addTarget:self action:@selector(pipbuttonpress:) forControlEvents:UIControlEventTouchUpInside];
        
        [downscroll addSubview:mybutton];
        
        }
    
    
    //-----------Adding small frames inside a frames----------------------//
    
    maskimages=
    [[NSArray alloc]initWithObjects:@"bbbg_03.jpg",@"bbbg_01.jpg",@"bbbg_02.jpg",@"bbbg_04.jpg",@"bbbg_05.jpg",@"bbbg_06.jpg",@"bbbg_07.jpg",@"bbbg_08.jpg",@"bbbg_09.jpg",@"bbbg_10.jpg",nil];
    
    
    //----------------Adding shapes to the frames----------------------//
    
    
    
    
    
}
-(UIImage *) resizeImage:(UIImage *)orginalImage resizeSize:(CGSize)size
{
    CGFloat actualHeight = orginalImage.size.height;
    CGFloat actualWidth = orginalImage.size.width;
    //  if(actualWidth <= size.width && actualHeight<=size.height)
    //  {
    //      return orginalImage;
    //  }
    float oldRatio = actualWidth/actualHeight;
    float newRatio = size.width/size.height;
    if(oldRatio < newRatio)
    {
        oldRatio = size.height/actualHeight;
        actualWidth = oldRatio * actualWidth;
        actualHeight = size.height;
    }
    else
    {
        oldRatio = size.width/actualWidth;
        actualHeight = oldRatio * actualHeight;
        actualWidth = size.width;
    }
    
    CGRect rect = CGRectMake(0.0,0.0,actualWidth,actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [orginalImage drawInRect:rect];
    orginalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return orginalImage;
}
-(void)pipbuttonpress:(UIButton*)sender
{
    
    NSLog(@"Selected current pip button:%ld",(long)sender.tag);
    
    int index = (int)sender.tag;
    
    sample=[menuitems objectAtIndex:index];
    NSLog(@"index%d",index);
    
    sample=blurredimgv.image;
    
    blurredimgv.image = [UIImage imageNamed:[maskimages objectAtIndex:index]];
    
    sample=[self resizeImage:blurredimgv.image resizeSize:CGSizeMake(ImageView_Hieight+120, ImageView_Hieight+250)];
   
    [[NSUserDefaults standardUserDefaults] setObject:UIImagePNGRepresentation(sample)forKey:@"SomeValue"];
    NSLog(@"image is fdgdtytfry %@",sample);
    
    
    CGFloat width = sample.size.width;
    CGFloat height = sample.size.height;

    
    NSLog(@" pip buttonpress method object at index%@",sample);
    
    NSLog(@"Selected current pip button:%ld",(long)sender.tag);
    
    NSLog(@"Captured image is %f  %f",width,height);

    
}


-(void)filtereffects
{
     downscroll.hidden=NO;
     [self allocatemenubarforaddframespage];
   
    if (downscroll!=nil)
    {
        [downscroll removeFromSuperview];
        downscroll=nil;
        
        [filterbutton removeFromSuperview];
        filterbutton=nil;
    }
    
    
    int xCoord=0;
    int yCoord=4;
    int buffer = 5;
    
    
    //----------------Down UIscrollview for frames--------//
    
    
    downscroll=[[UIScrollView alloc]init];
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        int buttonHeight=screenWidth*0.2;
        
        
        downscroll.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+28);
        
        
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
        int buttonHeight=screenWidth*0.09;
        
        downscroll.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+28);
        
    }
    
    
    downscroll.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    
    downscroll.contentSize=activeimage.size;
    
    [downscroll setUserInteractionEnabled:YES];
    
    [downscroll setShowsHorizontalScrollIndicator:NO];
    
    [downscroll setShowsVerticalScrollIndicator:NO];
    
    [downscroll setUserInteractionEnabled:YES];
    
    
    [self.view addSubview:downscroll];
    
    //------applying animation------------//
    
    CATransition *strip_transition=[CATransition animation];
    strip_transition.type=kCATransitionPush;
    strip_transition.duration=0.50;
    [[downscroll layer] addAnimation:strip_transition forKey:@"down-strip.jpg"];
    
    [filterbutton addSubview:downscroll];
    
    filterNames = [[NSArray alloc] initWithObjects:@"Original",@"Chrome",@"Dodge",@"Retro",@"Custom Chrome",@"Geo",@"Hd Plus",@"Lomo",@"Rainy",@"Skyblue",@"Splittone",@"Splittone Green",@"Sunny",@"TechniColor2",@"TechniColor3",@"Acid",@"Vintage",@"Amatorka",nil];
    
    
    UIImage *sample_Image = [UIImage imageNamed:@"Fx_gallery_120.png"];
    
    for (int b=0;b<[filterNames count];b++)
    {
        
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            
            int buttonHeight=screenWidth*0.2;
            int buttonWidth=screenWidth*0.2;
            
            filterbutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            downscroll.contentSize=CGSizeMake(1300, yCoord);
            
        }
        else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
            
        {
            
            
            int buttonHeight=screenWidth*0.09;
            int buttonWidth=screenWidth*0.09;
            
            filterbutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscroll setContentSize:CGSizeMake((20*screenWidth*0.09)+(20*buffer), yCoord)];
            
        }
        
        [filterbutton setTag:b];
        
        [filterbutton setImage:[self add_EffectOnImage:sample_Image effectNumber:b] forState:UIControlStateNormal];
        
        [filterbutton addTarget:self action:@selector(add_ColorEffect:) forControlEvents:UIControlEventTouchUpInside];
        
        [filterbutton setSelected:true];
        
        NSString *nameOfEffect = [filterNames objectAtIndex:b];
        
        [self addTitle:filterbutton  name:nameOfEffect];
        
        [downscroll addSubview:filterbutton];
    }
    
}
- (void)add_ColorEffect:(UIButton *)sndr
{
    
    int index = (int)sndr.tag;
    
    _currentEffectNumber  = index;
    
    [clearedimgv setImage:[self add_EffectOnImage:frontimage1 effectNumber:_currentEffectNumber]];
    
}

-(void)addTitle:(UIButton *)but name:(NSString *)effectName
{
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel . frame = CGRectMake(0, but.frame.size.height - 20, but.frame.size.width, 20);
    titleLabel . text =  effectName;
    titleLabel . textAlignment = NSTextAlignmentCenter;
    titleLabel . font = [UIFont systemFontOfSize:10.0];
    titleLabel . textColor = [UIColor whiteColor];
    titleLabel . backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.8];
    [but addSubview:titleLabel];
    
}

- (UIImage *)add_EffectOnImage:(UIImage *)image effectNumber:(int)effectNo
{
    resultantImage = nil;
    
    
    if (effectNo == 0)
    {
        resultantImage = image;
        
        NSLog(@"Images applies effect:%d",effectNo);
        
    }
    
    else
    {
        
        resultantImage = [self apply_GPUFilter:effectNo onImage:image];
        
        NSLog(@"Images applies effect:%d",effectNo);
        
    }
    
    return  resultantImage;
}



-(id)filterWithLookupmage:(UIImage *)_image
{
    id fil = [[GPUImageFilterGroup alloc]init];
    
    NSAssert(_image, @"To use GPUImageAmatorkaFilter you need to add lookup_amatorka.png from GPUImage/framework/Resources to your application bundle.");
    
    
    lookupImageSource = nil;
    GPUImageLookupFilter *lookupFilter = nil;
    
    lookupImageSource = [[GPUImagePicture alloc] initWithImage:_image];
    
    lookupFilter = [[GPUImageLookupFilter alloc] init];
    
    [lookupImageSource addTarget:lookupFilter atTextureLocation:1];
    [lookupImageSource processImage];
    
    [fil setInitialFilters:[NSArray arrayWithObjects:lookupFilter, nil]];
    [fil setTerminalFilter:lookupFilter];
    
    return fil;
}

-(UIImage*)apply_GPUFilter:(int)filterValue onImage:(UIImage*)img
{
    UIImage *outputImage = nil;
    
    GPUImageFilterGroup *selectedFilter = nil;
    
   
    UIImage *filtr_image1 = [UIImage imageNamed:@"lookup_chrom.png"];
    UIImage *filtr_image2 = [UIImage imageNamed:@"lookup_chrom_dodge.png"];
    UIImage *filtr_image3 = [UIImage imageNamed:@"lookup_chrom_retro.png"];
    UIImage *filtr_image4 = [UIImage imageNamed:@"lookup_customchrom.png"];
    UIImage *filtr_image5 = [UIImage imageNamed:@"lookup_Geo.png"];
    UIImage *filtr_image6 = [UIImage imageNamed:@"lookup_hdrplus.png"];
    UIImage *filtr_image7 = [UIImage imageNamed:@"lookup_lomo.png"];
    UIImage *filtr_image8 = [UIImage imageNamed:@"lookup_lomo1.png"];
    UIImage *filtr_image9 = [UIImage imageNamed:@"lookup_rainy.png"];
    UIImage *filtr_image10 = [UIImage imageNamed:@"lookup_skyblue.png"];
    UIImage *filtr_image11 = [UIImage imageNamed:@"lookup_splittonecolor.png"];
    UIImage *filtr_image12 = [UIImage imageNamed:@"lookup_splittonegreen.png"];
    UIImage *filtr_image13 = [UIImage imageNamed:@"lookup_sunny.png"];
    UIImage *filtr_image14 = [UIImage imageNamed:@"lookup_technicolor2.png"];
    UIImage *filtr_image15 = [UIImage imageNamed:@"lookup_technicolor3.png"];
    UIImage *filtr_image16 = [UIImage imageNamed:@"lookup_urbanacid.png"];
    UIImage *filtr_image17 = [UIImage imageNamed:@"lookup_vintagefilm.png"];
    UIImage *filtr_image18 = [UIImage imageNamed:@"lookup_amatorka.png"];
    
    
    
    
    switch (filterValue)
    {
        case 1:
            
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            filtr_image1 = nil;
            
            
            break;
            
        case 2:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image2, 0.5)]];
            filtr_image2 = nil;
            
            
            break;
            
        case 3:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image3, 0.5)]];
            filtr_image3 = nil;
            
            break;
            
        case 4:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image4, 0.5)]];
            filtr_image4 = nil;
            
            break;
            
        case 5:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image5, 0.5)]];
            filtr_image5 = nil;
            
            
            break;
            
        case 6:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image6, 0.5)]];
            filtr_image6 = nil;
            
            break;
            
        case 7:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image7, 0.5)]];
            filtr_image7 = nil;
            
            break;
            
        case 8:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image8, 0.5)]];
            filtr_image8 = nil;
            
            break;
            
            
        case 9:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image9, 0.5)]];
            filtr_image9 = nil;
            
            break;
            
            
        case 10:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image10,0.5)]];
            filtr_image10 = nil;
            
            break;
            
        case 11:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image11, 0.5)]];
            filtr_image11 = nil;
            
            break;
            
        case 12:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image12, 0.5)]];
            filtr_image12 = nil;
            
            break;
            
        case 13:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image13, 0.5)]];
            filtr_image13 = nil;
            
            break;
            
        case 14:
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image14, 0.5)]];
            filtr_image14 = nil;
            
            break;
            
        case 15:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image15, 0.5)]];
            filtr_image15 = nil;
            
            break;
            
            
        case 16:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image16, 0.5)]];
            filtr_image16 = nil;
            
            break;
            
            
        case 17:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image17, 0.5)]];
            filtr_image17 = nil;
            
            break;
            
        case 18:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image18, 0.5)]];
            filtr_image18 = nil;
            
            break;
            
        case 19:
            break;
            
            
        default:
            break;
            
    }
    
    
    
    [selectedFilter forceProcessingAtSizeRespectingAspectRatio:CGSizeMake(0, 0)];
    outputImage = [selectedFilter imageByFilteringImage:img];
    
    
    
    
    return outputImage;
    
    
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title=[alertView buttonTitleAtIndex:buttonIndex];
    
    
    if ([title isEqualToString:@"Foreground"])
    {
        selectedImgTag=0;
        
        [self pickforegroundimagefromgallery];
        
        NSLog(@"changeforeground");
        
    }

    else
    {
        
        [alertView removeFromSuperview];
        
    }
}



- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    switch (popup.tag)
    {
        case 1:
        {
            switch (buttonIndex)
            
            {
                case 0:
                    
                    selectedImgTag = 0;
                    
                    [self pickforegroundimagefromgallery];
                    
                    
                    NSLog(@"pick foreground image from gallary");
                    
                    break;
                    
//                case 1:
//                    
//                    selectedImgTag = 1;
//                    
//                    [self pickforegroundimagefromgallery];
//                    
//                    
//                    NSLog(@"pick background image from gallary");
//                    
//                    break;
                    
                default:
                    
                    break;
                    
            }
            break;
        }
        default:
            break;
    }
}

-(void)pickforegroundimagefromgallery
{
    
    
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        imagePicker.delegate = self;
        imagePicker.allowsEditing = NO;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    

}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if (selectedImgTag == 0)
        
    {
        
        frontimage1=nil;
        
        NSLog(@"foregroundimage");
        
        //frontimage=[info valueForKey:UIImagePickerControllerEditedImage];
        
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
        {
            frontimage=[info valueForKey:UIImagePickerControllerEditedImage];
        }
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            frontimage=[info valueForKey:UIImagePickerControllerEditedImage];
        }
        else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
        {
            frontimage=[info valueForKey:UIImagePickerControllerOriginalImage];
        }

        
        frontimage1=[self squareImageFromImage:frontimage scaledToSize:500];
        NSLog(@"image size is %f---%f",frontimage.size.width,frontimage.size.height);
        
        clearedimgv.image=frontimage1;
    
        
     }
    
    

 
}

- (UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize {
    CGAffineTransform scaleTransform;
    CGPoint origin;
    
    if (image.size.width > image.size.height) {
        CGFloat scaleRatio = newSize / image.size.height;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(-(image.size.width - image.size.height) / 2.0f, 0);
    } else {
        CGFloat scaleRatio = newSize / image.size.width;
        scaleTransform = CGAffineTransformMakeScale(scaleRatio, scaleRatio);
        
        origin = CGPointMake(0, -(image.size.height - image.size.width) / 2.0f);
    }
    
    CGSize size = CGSizeMake(newSize, newSize);
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    } else {
        UIGraphicsBeginImageContext(size);
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextConcatCTM(context, scaleTransform);
    
    [image drawAtPoint:origin];
    
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

-(UIImage *)imageRotatedByDegrees:(UIImage*)oldImage deg:(CGFloat)degrees
{
    
    // calculate the size of the rotated view's containing box for our drawing space
    
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,oldImage.size.width, oldImage.size.height)];
    
    CGAffineTransform t = CGAffineTransformMakeRotation(degrees * M_PI / 180);
    
    rotatedViewBox.transform = t;
    
    CGSize rotatedSize = rotatedViewBox.frame.size;
    
    // Create the bitmap context
    
    UIGraphicsBeginImageContext(rotatedSize);
    
    CGContextRef bitmap = UIGraphicsGetCurrentContext();
    
    
    
    // Move the origin to the middle of the image so we will rotate and scale around the center.
    
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    
    
    
    //   // Rotate the image context
    
    CGContextRotateCTM(bitmap, (degrees * M_PI / 180));
    
    
    
    // Now, draw the rotated/scaled image into the context
    
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    
    CGContextDrawImage(bitmap, CGRectMake(-oldImage.size.width / 2, -oldImage.size.height / 2, oldImage.size.width, oldImage.size.height), [oldImage CGImage]);
    
    
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}




- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    
}






-(void)moveheretoanother
{
    [self addPreLoad];
    
    if (downscroll!=nil)
    {
        
        [downscroll removeFromSuperview];
        downscroll=nil;
        
        [mybutton removeFromSuperview];
        mybutton=nil;
        
        
        [filterbutton removeFromSuperview];
        filterbutton=nil;
        
        
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(self.view.frame.size.width,self.view.frame.size.height));
    CGContextRef context =UIGraphicsGetCurrentContext();
    [clearedimgv.layer renderInContext:context];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    UIGraphicsEndImageContext();
    PreviewViewController *textvwcon=[[PreviewViewController alloc]init];
    
    textvwcon.sampleimg2=viewImage;
    [self.navigationController pushViewController:textvwcon animated:YES];

    
    [self allocatemenubarforaddframespage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

///// Full screen adds
//-(void)showFullScreenAd
//{
//        if (interstitial != nil)
//        {
//            interstitial . delegate = nil;
//    
//            interstitial = nil;
//        }
//    
//        interstitial = [[GADInterstitial alloc] initWithAdUnitID:fullscreen_admob_id];
//        interstitial.delegate = self;
//        GADRequest *request=[GADRequest request];
//    
//        [interstitial loadRequest:request];
//    
//}
//
//-(void)interstitialDidReceiveAd:(GADInterstitial *)ad
//{
//    if (self.navigationController.visibleViewController == self)
//    {
//        NSLog(@"vissble");
//        [ad presentFromRootViewController:self];
//
//    }else
//    {
//        NSLog(@"niavig");
//        [ad presentFromRootViewController:self.navigationController.topViewController];
//    }
//}
//
//- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial
//{
//    NSLog(@"Ad Closed!");
//     //[self addButtonAnimation];
//}




@end
