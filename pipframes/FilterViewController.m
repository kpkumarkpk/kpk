//
//  FilterViewController.m
//  
//
//  Created by OUTTHINKING PVT LTD on 4/6/16.
//
//

#import "FilterViewController.h"
#import "FourthViewController.h"
#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "GPUImage.h"
#import "OT_TabBar.h"
#import "Config.h"
#import <GoogleMobileAds/GoogleMobileAds.h>

#define screenWidth                         ([[UIScreen mainScreen]bounds].size.width)
#define screenHeight                        ([[UIScreen mainScreen]bounds].size.height)



int buttonindex;
int selectedImgTag;


@interface FilterViewController ()<UINavigationControllerDelegate,OT_TabBarDelegate>
{
    
    GPUImagePicture *lookupImageSource;
    
    UIImage   *blurredImagefinal;
    
    UIImageView *screenimgv;
    
    UIImage *squaredscreenshotimg;
    
    
    int index1;
    int index2;
    
    SSAlphaPassView * mainview;

    
    NSString *titlename;
    
    BOOL fill;
    
    
    
    
}

@property (nonatomic , assign) int currentEffectNumber;


@end

@implementation FilterViewController

@synthesize selimg,blurredimgv,maskimgv,clearedimgv,downscroll,menuitems,mybutton,maskimages,shapeimages,shapeimgv,frontimage,filterNames,blurredimage,backgroundstripimagev,customtabbar,filterbutton,interstitial,activeimage,blurredImage1,frontimage1,newimage1;

float player_y = 0.0;

int xCoord;
int yCoord;
int buffer;

int buttonHeight;
int buttonWidth;





-(void)viewWillAppear:(BOOL)animated
{

    
    NSLog(@"111111");
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [defaults objectForKey:@"theKey"];
    
    frontimage=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    
    if([titlename isEqualToString:@"Foreground"])
    {
        fill = TRUE;
        
        [self pickforegroundimagefromgallery];
        
        NSLog(@"aaaaa%d",fill);
        
    }
    else if ([titlename isEqualToString:@"Background Image"])
    {
        
        NSLog(@"bbb");
    }
    else
    {
        fill= FALSE;
        
        NSLog(@"ccccv %d",fill);
        
        
    }
    
    
    
}



- (void)viewDidLoad
{
    
    downscroll=[[UIScrollView alloc]init];
    backgroundstripimagev=[[UIImageView alloc]init];
    blurredimgv=[[UIImageView alloc]init];
    clearedimgv=[[SSAlphaPassButton alloc]init];
    maskimgv=[[SSAlphaPassButton alloc]init];
    shapeimgv=[[SSAlphaPassButton alloc]init];
    
    
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }

    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        
        backgroundstripimagev . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),player_y, 1.5*ImageView_Hieight, 1.5*ImageView_Hieight);
        
        
        blurredimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),player_y, 1.5*ImageView_Hieight, 1.5*ImageView_Hieight);
        
        mainview=[[SSAlphaPassView alloc]initWithFrame:(CGRectMake(0, 0, 1.5*ImageView_Hieight,1.5*ImageView_Hieight))];
        
        clearedimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, 1.5*ImageView_Hieight, 1.5*ImageView_Hieight);
        
        maskimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, 1.5*ImageView_Hieight, 1.5*ImageView_Hieight);
        
        
        shapeimgv . frame = CGRectMake(((fullScreen.size.width - ImageView_Hieight)-3*downstrip_height)/2,player_y, 1.5*ImageView_Hieight, 1.5*ImageView_Hieight);
        
        
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        backgroundstripimagev . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
        
        
        blurredimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),player_y, ImageView_Hieight, ImageView_Hieight);
        
        mainview=[[SSAlphaPassView alloc]initWithFrame:(CGRectMake(0, 0, ImageView_Hieight,ImageView_Hieight))];
        
        clearedimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
        
        maskimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
        
        shapeimgv . frame = CGRectMake(((fullScreen.size.width - ImageView_Hieight)-downstrip_height-10)/2,player_y, ImageView_Hieight, ImageView_Hieight);
        
        
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        backgroundstripimagev . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
        
        blurredimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),player_y, ImageView_Hieight, ImageView_Hieight);
        
        mainview=[[SSAlphaPassView alloc]initWithFrame:(CGRectMake(0, 0, ImageView_Hieight,ImageView_Hieight))];
        
        clearedimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
        
        maskimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
        
        
        shapeimgv . frame = CGRectMake(((fullScreen.size.width - ImageView_Hieight)-downstrip_height+10)/2,player_y, ImageView_Hieight, ImageView_Hieight);
        
    }
    
    //-------------Background strip imageview-------------//
    backgroundstripimagev . center = CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    backgroundstripimagev.backgroundColor=[UIColor colorWithRed:0.227 green:0.227 blue:0.227 alpha:1];
    [self.view addSubview:backgroundstripimagev];
    
    
    
    //---------------BLURRED IMAGEVIEW-----------------//
    
        blurredimgv . center = CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    
    blurredimgv.contentMode=UIViewContentModeScaleAspectFit;
    
    activeimage = [self squareImageWithImage:selimg scaledToSize:blurredimgv.frame.size];
    blurredImage1=activeimage;
    [self blur:blurredImage1];
    
    
    [self.view addSubview:blurredimgv];
    
    
    
    //--------main uiview-------------//
    
    mainview.center = CGPointMake(screenWidth/2, screenHeight/2);
    [mainview setBackgroundColor:[UIColor clearColor]];
    [mainview setUserInteractionEnabled:YES];
    [self.view addSubview:mainview];
    
    
    //---------clear imageview--------//
    
    frontimage1=activeimage;
    clearedimgv.image=frontimage1;
    [clearedimgv setUserInteractionEnabled:YES];
    [mainview addSubview:clearedimgv];
    
    
    //--------mask imageview---------//
    maskimgv . center = CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    [maskimgv setImage:[UIImage imageNamed:@"image2@.png"]];
    [maskimgv setBackgroundColor:[UIColor clearColor]];
    
    
    
    //--------Shapeimageview--------------//
    
    [shapeimgv setImage:[UIImage imageNamed:@"small2@.png"]];
    
    [clearedimgv addSubview:shapeimgv];
    
    [mainview setMaskView:shapeimgv];///-----------framecut----
    [self.view addSubview:maskimgv];
    [self.view bringSubviewToFront:maskimgv];
    
    
    //----------Ui Pan Gesture Recognizer-------------//
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [panGestureRecognizer setDelegate:self];
    [clearedimgv addGestureRecognizer:panGestureRecognizer];
    
    
    //----------- UI Pinch Gesture Recognizer---------------//
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [pinchRecognizer setDelegate:self];
    [clearedimgv addGestureRecognizer:pinchRecognizer];
    
    //------------Ui Rotattion Gesture Recognizer-----------//
    
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    [rotationRecognizer setDelegate:self];
    [clearedimgv addGestureRecognizer:rotationRecognizer];
    
    // [self allocateresourcesfordefaultpip];
    
    [self allocateResourcesForTopToolBar];
    
    [self allocatemenubarforaddframespage];
    
    
    [super viewDidLoad];
    
    
    NSLog(@"activeimage %@", selimg);
    
       [self showFullScreenAd];
    
    [[NSNotificationCenter defaultCenter] addObserver:self  selector:@selector(showFullScreenAd) name:UIApplicationDidBecomeActiveNotification  object:nil];
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


-(void)allocateresourcesfordefaultpip
{
    
    
    //-------------Background strip imageview-------------//
    
    backgroundstripimagev=[[UIImageView alloc]init];
    backgroundstripimagev . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
    backgroundstripimagev . center = CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    backgroundstripimagev.backgroundColor=[UIColor colorWithRed:0.227 green:0.227 blue:0.227 alpha:1];
    [self.view addSubview:backgroundstripimagev];
    
    
    
    //---------------BLURRED IMAGEVIEW-----------------//
    
    
    blurredimgv=[[UIImageView alloc]init];
    blurredimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),player_y, ImageView_Hieight, ImageView_Hieight);
    blurredimgv . center = CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    
    if (selectedImgTag==0)
    {
        
        blurredImage1 = [self squareImageWithImage:frontimage scaledToSize:blurredimgv.frame.size];
        
    }
    
    [self blur:blurredImage1];
    
    [self.view addSubview:blurredimgv];
    
    
    //--------main uiview-------------//
    
    
    mainview=[[SSAlphaPassView alloc]initWithFrame:(CGRectMake(0, 0, ImageView_Hieight,ImageView_Hieight))];
    mainview.center = CGPointMake(screenWidth/2, screenHeight/2);
    [mainview setBackgroundColor:[UIColor clearColor]];
    [mainview setUserInteractionEnabled:YES];
    [self.view addSubview:mainview];
    
    
    //---------clear imageview--------//
    
    
    
    clearedimgv=[[SSAlphaPassButton alloc]init];

    clearedimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
    
    //frontimage1=activeimage;
    
    if (selectedImgTag==1)
    {
        newimage1 = [self squareImageWithImage:frontimage scaledToSize:blurredimgv.frame.size];
    }
    
    clearedimgv.image=frontimage1;
    
    
    [clearedimgv setUserInteractionEnabled:YES];
    [mainview addSubview:clearedimgv];
    
    
    
    
    //--------mask imageview---------//
    
    maskimgv=[[SSAlphaPassButton alloc]init];

    maskimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,player_y, ImageView_Hieight, ImageView_Hieight);
    maskimgv . center = CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    
        maskimgv.image=[UIImage imageNamed:[maskimages objectAtIndex:index1]];
    
    
    
        //--------Shapeimageview--------------//
    
    
    
    shapeimgv=[[SSAlphaPassButton alloc]init];

    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        shapeimgv . frame = CGRectMake(((fullScreen.size.width - ImageView_Hieight)-downstrip_height+10)/2,player_y, ImageView_Hieight, ImageView_Hieight);///--------for iphone
        
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
        shapeimgv . frame = CGRectMake(((fullScreen.size.width - ImageView_Hieight)-downstrip_height-10)/2,player_y, ImageView_Hieight, ImageView_Hieight);   /////-------for ipad
        
        
    }
    
    shapeimgv.image=[UIImage imageNamed:[shapeimages objectAtIndex:index2]];
    
    
    
    [clearedimgv addSubview:shapeimgv];
    [mainview setMaskView:shapeimgv];///-----------framecut----
    [self.view addSubview:maskimgv];
    [self.view bringSubviewToFront:maskimgv];
    
    //----------Ui Pan Gesture Recognizer-------------//
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [panGestureRecognizer setDelegate:self];
    [clearedimgv addGestureRecognizer:panGestureRecognizer];
    
    
    //----------- UI Pinch Gesture Recognizer---------------//
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [pinchRecognizer setDelegate:self];
    [clearedimgv addGestureRecognizer:pinchRecognizer];
    
    //------------Ui Rotattion Gesture Recognizer-----------//
    
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];
    [rotationRecognizer setDelegate:self];
    [clearedimgv addGestureRecognizer:rotationRecognizer];
    
    [self viewWillAppear:YES];
    
    
}

- (void)handlePan:(UIPanGestureRecognizer*) recognizer
{
    clearedimgv.userInteractionEnabled=YES;
    
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [recognizer translationInView:recognizer.view];
        [recognizer.view setTransform:CGAffineTransformTranslate(recognizer.view.transform, translation.x, translation.y)];
        [recognizer setTranslation:CGPointZero inView:recognizer.view];
    }
    
}
- (IBAction)handleRotate:(UIRotationGestureRecognizer *)recognizer

{
    clearedimgv.userInteractionEnabled=YES;
    
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        CGFloat rotation = [recognizer rotation];
        [recognizer.view setTransform:CGAffineTransformRotate(recognizer.view.transform, rotation)];
        [recognizer setRotation:0];
    }
}
- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer
{
    
    
    clearedimgv.userInteractionEnabled=YES;
    
    
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
        CGFloat scale = [recognizer scale];
        [recognizer.view setTransform:CGAffineTransformScale(recognizer.view.transform, scale, scale)];
        [recognizer setScale:1.0];
    }

    
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

- (void)allocateResourcesForTopToolBar
{
    UIView *topToolBar = [[UIView alloc] init];
    
    
    topToolBar.backgroundColor=[UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    
    topToolBar . frame = CGRectMake(0, 0, fullScreen.size.width, downstrip_height);
    topToolBar . userInteractionEnabled = YES;
    [self.view addSubview:topToolBar];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, fullScreen.size.width, downstrip_height)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.shadowOffset = CGSizeMake(0, 1);
    label.textColor = [UIColor whiteColor];
    label.text = @"Pip Frames";
    if (UIUserInterfaceIdiomPad == UI_USER_INTERFACE_IDIOM())
    {
        label.font = [UIFont boldSystemFontOfSize:17.0];
    }
    else
    {
        label.font = [UIFont boldSystemFontOfSize:15.0];
        
    }
    
    [topToolBar addSubview:label];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton . frame = CGRectMake(0, 0, downstrip_height, downstrip_height);
    [backButton setImage:[UIImage imageNamed:@"BACK"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [topToolBar addSubview:backButton];
    
}
-(void)goBack
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
}


-(void)allocatemenubarforaddframespage
{
    customtabbar = [[OT_TabBar alloc]init];
    
  
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        
        customtabbar = [[OT_TabBar alloc]initWithFrame:CGRectMake(0,fullScreen.size.height-downstrip_height,fullScreen.size.width ,downstrip_height)];
        

        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
        customtabbar = [[OT_TabBar alloc]initWithFrame:CGRectMake(0,fullScreen.size.height-(downstrip_height),fullScreen.size.width ,downstrip_height)];
        
        NSLog(@"gbchdsbcdc");
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        customtabbar = [[OT_TabBar alloc]initWithFrame:CGRectMake(0,fullScreen.size.height-downstrip_height,fullScreen.size.width ,downstrip_height)];
        

        
    }
    

    
    customtabbar.delegate = self;
    
    
    customtabbar.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    
    customtabbar.showOverlayOnSelection = NO;
    
    
    OT_TabBarItem *frames = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"PIP"]
                                                  selectedImage:[UIImage imageNamed:@"PIP-1"]
                                                            tag:0];
    
    OT_TabBarItem *gallery = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"FROGROUND"]
                                                   selectedImage:[UIImage imageNamed:@"FROGROUND-1"]
                                                             tag:1];
    
    OT_TabBarItem *effects = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"FILTER"]
                                                   selectedImage:[UIImage imageNamed:@"FILTER-1"]
                                                             tag:2];
    OT_TabBarItem *next = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"NEXT"]
                                                selectedImage:[UIImage imageNamed:@"NEXT-1"]
                                                          tag:3];
    
    customtabbar.itemTitleArray = [NSArray arrayWithObjects:@"frames",@"gallery",@"filter",@"next", nil];
    customtabbar.items = [NSArray arrayWithObjects:frames,gallery,effects,next, nil];
    
    
    [self.view addSubview:customtabbar];
    
}
-(void)otTabBar:(OT_TabBar*)tbar didSelectItem:(OT_TabBarItem*)tItem
{
    switch (tItem.tag)
    {
        case 0:
        {
            
            [self addpiphere];
            
            break;
        }
        case 1:
        {
            
            [self galleryhere];
            
            break;
        }
        case 2:
        {
            
            
            [self filtereffects];
            
            break;
        }
        case 3:
        {
            
            [self moveheretoanother];
            
            
            break;
        }
        default:
        {
            break;
        }
    }
}

- (UIImage*) blur:(UIImage*)theImage
{
    
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:theImage.CGImage];
    
    // setting up Gaussian Blur (we could use one of many filters offered by Core Image)
    CIFilter *imagefilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [imagefilter setValue:inputImage forKey:kCIInputImageKey];
    [imagefilter setValue:[NSNumber numberWithFloat:8.0f] forKey:@"inputRadius"];
    CIImage *result = [imagefilter valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];//create a UIImage for this function to "return" so that ARC can manage the memory of the blur... ARC can't manage CGImageRefs so we need to release it before this function "returns" and ends.
    CGImageRelease(cgImage);//release CGImageRef because ARC doesn't manage this on its own.
    
    blurredimgv.image=returnImage;
    
        return returnImage;
    
    
}





-(void)addpiphere
{
    
    
    [self allocatemenubarforaddframespage];
    
    if (downscroll!=nil)
    {
        [downscroll removeFromSuperview];
        downscroll=nil;
        
        [mybutton removeFromSuperview];
        mybutton=nil;
    }
    
    //----------------Down UIscrollview for frames--------//
    
    
    
     xCoord=0;
     yCoord=4;
     buffer = 5;
    
    
    
    
    downscroll=[[UIScrollView alloc]init];
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {

        
         buttonHeight=screenWidth*0.2;
        
        
        
        downscroll.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-3*buffer,fullScreen.size.width ,downstrip_height+45);
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
         buttonHeight=screenWidth*0.09;
        
        downscroll.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+28);
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        
        
         buttonHeight=screenWidth*0.2;
        
        
        
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
    strip_transition.subtype=kCATransitionFromTop;
    strip_transition.duration=0.50;
    [[downscroll layer] addAnimation:strip_transition forKey:@"down-strip.jpg"];
    
    [mybutton addSubview:downscroll];
    
    [self.view sendSubviewToBack:downscroll];
    
    
    
    //-------------------Adding frames to Ui scrollview------------------//
    
    menuitems = [[NSArray alloc]initWithObjects:@"fs1.png",@"fs2.png",@"fs3.png",@"fs4.png",@"fs5.png",@"fs6.png",@"fs7.png",@"fs9.png",@"fs10.png",@"fs11.png",@"fs12.png",@"fs13.png",@"fs14.png",@"fs15.png",@"fs16.png",@"fs17.png",@"fs18.png",@"fs19.png",@"fs20.png",@"fs21.png",@"fs22.png",@"fs23.png",@"fs24.png",@"fs25.png",@"fs26.png",@"fs28.png",@"fs29.png",@"fs30.png",nil];
    
    
    for (int b=0;b<[menuitems count];b++)
    {
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
        {
            
             buttonHeight=screenWidth*0.2;
             buttonWidth=screenWidth*0.2;
            
            
            mybutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscroll setContentSize:CGSizeMake((29*screenWidth*0.2)+(29*buffer), yCoord)];
            
            
        }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
        {
            
            
             buttonHeight=screenWidth*0.09;
             buttonWidth=screenWidth*0.09;
            
            
            
            mybutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscroll setContentSize:CGSizeMake((29*screenWidth*0.09)+(29*buffer), yCoord)];
            
            
            
        }
        else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            
             buttonHeight=screenWidth*0.2;
             buttonWidth=screenWidth*0.2;
            
            
            mybutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscroll setContentSize:CGSizeMake((29*screenWidth*0.2)+(29*buffer), yCoord)];
            
            
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
    [[NSArray alloc]initWithObjects:@"image1@.png",@"image2@.png",@"image3@.png",@"image4@.png",@"image5@.png",@"image6@.png",@"image7@.png",@"image9@.png",@"image10@.png",@"image11@.png",@"image12@.png",@"image13@.png",@"image14@.png",@"image15@.png",@"image16@.png",@"image17@.png",@"image18@.png",@"image19@.png",@"image20@.png",@"image21@.png",@"image22@.png",@"image23@.png",@"image24@.png",@"image25@.png",@"image26@.png",@"image28@.png",@"image29@.png",@"image30@.png", nil];
    
    
    //----------------Adding shapes to the frames----------------------//
    
    shapeimages=
    [[NSArray alloc]initWithObjects:@"small1@.png",@"small2@.png",@"small3@.png",@"small4@.png",@"small5@.png",@"small6@.png",@"small7@.png",@"small9@.png",@"small10@.png",@"small11@.png",@"small12@.png",@"small13@.png",@"small14@.png",@"small15@.png",@"small16@.png",@"small17@.png",@"small18@.png",@"small19@.png",@"small20@.png",@"small21@.png",@"small22@.png",@"small23@.png",@"small24@.png",@"small25@.png",@"small26@.png",@"small28@.png",@"small29@.png",@"small30@.png", nil];
    
    
    
    
    
}


-(void)pipbuttonpress:(UIButton*)sender
{
    
    NSLog(@"Selected current pip button:%ld",(long)sender.tag);
    
    
    int index = (int)sender.tag;
    
    
    index1=(int)sender.tag;
    
    
    index2=(int)sender.tag;
    
    
    UIImage * sample;
    
    sample=[menuitems objectAtIndex:index];
    
   
    shapeimgv.image=[UIImage imageNamed:[shapeimages objectAtIndex:index2]];
    
    maskimgv.image=[UIImage imageNamed:[maskimages objectAtIndex:index1]];
    
    NSLog(@" pip buttonpress method object at index%@",sample);
    
}

-(void)galleryhere
{
    
    if (downscroll!=nil)
    {
        [downscroll removeFromSuperview];
        
        [mybutton removeFromSuperview];
        
        mybutton=nil;
        
        downscroll=nil;
    }
    
    
    
    
    UIAlertView *gallery=[[UIAlertView alloc]initWithTitle:@"ChangeImage!!" message:@"" delegate:self cancelButtonTitle:@"Cancel"otherButtonTitles:@"Foreground" ,@"Background",nil];
    
    [gallery show];

    
    
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
    else if ([title isEqualToString:@"Background"])
    {
        
        selectedImgTag=1;
        
        [self pickforegroundimagefromgallery];
        
        NSLog(@"Background");
        
        
    }
    else
    {
        [alertView removeFromSuperview];
        
    }
}




-(void)pickforegroundimagefromgallery
{
    
    UIImagePickerController *imagpicker=[[UIImagePickerController alloc]init];
    imagpicker.delegate=self;
    imagpicker.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    imagpicker.allowsEditing=NO;
    [self presentViewController:imagpicker animated:YES completion:nil];
    
    
}


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
    if (selectedImgTag == 0)
        
    {
        frontimage1=nil;
        
        NSLog(@"foregroundimage");
        
        [clearedimgv setContentMode:UIViewContentModeScaleAspectFit];
        
        frontimage=[info valueForKey:UIImagePickerControllerOriginalImage];
        
        frontimage1=frontimage;

       clearedimgv.image=frontimage1;
        
    }
    
    else if (selectedImgTag==1)
        
    {
        blurredImage1=nil;
        
        NSLog(@"Backgroundimage");
        
        frontimage=[info valueForKey:UIImagePickerControllerOriginalImage];
        
        newimage1=[[UIImage alloc]init];
        
        NSLog(@"chosenimage%@",frontimage);
        
        
        if(frontimage.imageOrientation == 1)
        {
            newimage1 = [self imageRotatedByDegrees:frontimage deg:180];
        }
        
        else if (frontimage.imageOrientation == 2)
        {
            newimage1 = [self imageRotatedByDegrees:frontimage deg:270];
        }
        else if (frontimage .imageOrientation == 3)
        {
            newimage1 = [self imageRotatedByDegrees:frontimage deg:90];
        }
        else
        {
            newimage1=frontimage;
        }
        
        blurredImage1 = [self blur:newimage1];
        
        blurredimgv.image=[self squareImageWithImage:blurredImage1 scaledToSize:backgroundstripimagev.frame.size];
        
        NSLog(@"afterblurring%@",blurredimgv.image);
        
        blurredimgv.contentMode = UIViewContentModeScaleAspectFit;
        
        blurredimgv.clipsToBounds = YES;
        
        [backgroundstripimagev sendSubviewToBack:blurredimgv];
        
        [mainview sendSubviewToBack:blurredimgv];
        
        
    }
    
}
-(UIImage *)imageRotatedByDegrees:(UIImage*)oldImage deg:(CGFloat)degrees
{
    
    
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

-(void)filtereffects
{
    if (downscroll!=nil)
    {
        [downscroll removeFromSuperview];
        downscroll=nil;
        
        [filterbutton removeFromSuperview];
        filterbutton=nil;
    }
    
    
     xCoord=0;
     yCoord=4;
     buffer = 5;
    
    
    //----------------Down UIscrollview for frames--------//
    
    
    downscroll=[[UIScrollView alloc]init];
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
         buttonHeight=screenWidth*0.2;
        
        
        
        downscroll.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-3*buffer,fullScreen.size.width ,downstrip_height+45);
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
         buttonHeight=screenWidth*0.09;
        
        downscroll.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+28);
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
         buttonHeight=screenWidth*0.2;
        
        
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
    strip_transition.subtype=kCATransitionFromTop;
    strip_transition.duration=0.50;
    [[downscroll layer] addAnimation:strip_transition forKey:@"down-strip.jpg"];
    [filterbutton addSubview:downscroll];
    
    [self.view sendSubviewToBack:downscroll];

    
    filterNames = [[NSArray alloc] initWithObjects:@"Original",@"Chrome",@"Dodge",@"Retro",@"Custom Chrome",@"Geo",@"Hd Plus",@"Lomo",@"Lomo1",@"Rainy",@"Skyblue",@"Splittone",@"Splittone Green",@"Sunny",@"Techni Color2",@"Techni Color3",@"Acid",@"Vintage",@"Amatorka", nil];
    
    UIImage *sample_Image = [UIImage imageNamed:@"5.jpg"];
    
    for (int b=0;b<[filterNames count];b++)
    {
        
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
             buttonHeight=screenWidth*0.2;
             buttonWidth=screenWidth*0.2;
            filterbutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscroll setContentSize:CGSizeMake((20*screenWidth*0.2)+(20*buffer), yCoord)];
            
        }
        else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
            
        {
            
             buttonHeight=screenWidth*0.09;
             buttonWidth=screenWidth*0.09;
            filterbutton = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscroll setContentSize:CGSizeMake((20*screenWidth*0.09)+(20*buffer), yCoord)];
            
        }
        
        
        
        [filterbutton setTag:b];
        
        
        filterbutton.backgroundColor=[UIColor blueColor];
        
        
        [filterbutton setImage:[self add_EffectOnImage:sample_Image effectNumber:b] forState:UIControlStateNormal];
        
        [filterbutton addTarget:self action:@selector(add_ColorEffect:) forControlEvents:UIControlEventTouchUpInside];
        
        [filterbutton setSelected:false];
        
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
    UIImage *resultantImage = nil;
    
    
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
    
    UIImage *filtr_image1 = [UIImage imageNamed:@"lookup_300.png"];
    
   // UIImage *filtr_image2 = [UIImage imageNamed:@"lookup_chrom.png"];
    UIImage *filtr_image3 = [UIImage imageNamed:@"lookup_chrom_dodge.png"];
    UIImage *filtr_image4 = [UIImage imageNamed:@"lookup_chrom_retro.png"];
    UIImage *filtr_image5 = [UIImage imageNamed:@"lookup_customchrom.png"];
    UIImage *filtr_image6 = [UIImage imageNamed:@"lookup_Geo.png"];
    UIImage *filtr_image7 = [UIImage imageNamed:@"lookup_hdrplus.png"];
    UIImage *filtr_image8 = [UIImage imageNamed:@"lookup_lomo.png"];
    UIImage *filtr_image9 = [UIImage imageNamed:@"lookup_lomo1.png"];
    UIImage *filtr_image10 = [UIImage imageNamed:@"lookup_rainy.png"];
    UIImage *filtr_image11 = [UIImage imageNamed:@"lookup_skyblue.png"];
    UIImage *filtr_image12 = [UIImage imageNamed:@"lookup_splittonecolor.png"];
    UIImage *filtr_image13 = [UIImage imageNamed:@"lookup_splittonegreen.png"];
    UIImage *filtr_image14 = [UIImage imageNamed:@"lookup_sunny.png"];
    UIImage *filtr_image15 = [UIImage imageNamed:@"lookup_technicolor2.png"];
    UIImage *filtr_image16 = [UIImage imageNamed:@"lookup_technicolor3.png"];
    UIImage *filtr_image17 = [UIImage imageNamed:@"lookup_urbanacid.png"];
    UIImage *filtr_image18 = [UIImage imageNamed:@"lookup_vintagefilm.png"];
    UIImage *filtr_image19 = [UIImage imageNamed:@"lookup_amatorka.png"];
    
    
    switch (filterValue)
    {
        case 1:
            
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            filtr_image1 = nil;
            
            
            break;
            
       /* case 2:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image2, 0.5)]];
            filtr_image2 = nil;
            
            
            break;*/
            
        case 2:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image3, 0.5)]];
            filtr_image3 = nil;
            
            break;
            
        case 3:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image4, 0.5)]];
            filtr_image4 = nil;
            
            break;
            
        case 4:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image5, 0.5)]];
            filtr_image5 = nil;
            
            
            break;
            
        case 5:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image6, 0.5)]];
            filtr_image6 = nil;
            
            break;
            
        case 6:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image7, 0.5)]];
            filtr_image7 = nil;
            
            break;
            
        case 7:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image8, 0.5)]];
            filtr_image8 = nil;
            
            break;
            
            
        case 8:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image9, 0.5)]];
            filtr_image9 = nil;
            
            break;
            
            
        case 9:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image10, 0.5)]];
            filtr_image10 = nil;
            
            break;
            
        case 10:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image11, 0.5)]];
            filtr_image11 = nil;
            
            break;
            
        case 11:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image12, 0.5)]];
            filtr_image12 = nil;
            
            break;
            
        case 12:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image13, 0.5)]];
            filtr_image13 = nil;
            
            break;
            
        case 13:
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image14, 0.5)]];
            filtr_image14 = nil;
            
            break;
            
        case 14:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image15, 0.5)]];
            filtr_image15 = nil;
            
            break;
            
            
        case 15:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image16, 0.5)]];
            filtr_image16 = nil;
            
            break;
            
            
        case 16:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image17, 0.5)]];
            filtr_image17 = nil;
            
            break;
            
        case 17:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image18, 0.5)]];
            filtr_image18 = nil;
            
            break;
            
        case 18:
            
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image1, 0.5)]];
            selectedFilter = [self filterWithLookupmage:[UIImage imageWithData:UIImageJPEGRepresentation(filtr_image19, 0.5)]];
            filtr_image19 = nil;
            
            break;
            
            
        default:
            break;
            
    }
    
    
    
    [selectedFilter forceProcessingAtSizeRespectingAspectRatio:CGSizeMake(0, 0)];
    outputImage = [selectedFilter imageByFilteringImage:img];
    
    
    
    
    return outputImage;
    
    
    
}






-(void)moveheretoanother
{
    
    
    if (downscroll!=nil)
    {
        
        [downscroll removeFromSuperview];
        downscroll=nil;
        
        [mybutton removeFromSuperview];
        mybutton=nil;
        
        
        [filterbutton removeFromSuperview];
        filterbutton=nil;
        
        
    }
    
    if (customtabbar!=nil)
    {
        
        [customtabbar removeFromSuperview];
        customtabbar=nil;
        
        
    }
    
    
    
    
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
        screenimgv=[[UIImageView alloc]initWithFrame:blurredimgv.frame];
    
    screenimgv.center = CGPointMake(screenWidth/2, screenHeight/2);
    
    [screenimgv setBackgroundColor:[UIColor clearColor]];
    
    [blurredimgv.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    [clearedimgv.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    [maskimgv.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    [shapeimgv.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    
    CGSize size = CGSizeMake(blurredimgv.frame.size.width, blurredimgv.frame.size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    //CGRect rec = CGRectMake(-downstrip_height, -3*downstrip_height,screenWidth+2*downstrip_height, screenHeight+6*downstrip_height);
    
    CGRect rec=CGRectMake(-downstrip_height/2, -3.3*downstrip_height, blurredimgv.frame.size.width+downstrip_height, blurredimgv.frame.size.height+6.5*downstrip_height);
    
    
    [self.view drawViewHierarchyInRect:rec afterScreenUpdates:YES];
    
    [blurredimgv setHidden:NO];
    [clearedimgv setHidden:NO];
    [shapeimgv setHidden:NO];
    [maskimgv setHidden:NO];
    
    
    UIImage *screenShot = UIGraphicsGetImageFromCurrentImageContext();
    
    squaredscreenshotimg = [self squareImageWithImage:screenShot scaledToSize:blurredimgv.frame.size];
    
    UIGraphicsEndImageContext();
    
    [self.view addSubview:screenimgv];
    
    FourthViewController *textvwcon=[[FourthViewController alloc]init];
    
    [self.navigationController pushViewController:textvwcon animated:YES];
    
    textvwcon.thirdimage=squaredscreenshotimg;
    
    
    [self allocatemenubarforaddframespage];
    
  
    
    
}


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
// Resorces for labe

// Full screen adds
-(void)showFullScreenAd
{
    if (interstitial != nil)
    {
        interstitial . delegate = nil;
        
        interstitial = nil;
    }
    
    interstitial = [[GADInterstitial alloc] initWithAdUnitID:fullscreen_admob_id];
    interstitial.delegate = self;
    GADRequest *request=[GADRequest request];
    
    [interstitial loadRequest:request];
    
}

-(void)interstitialDidReceiveAd:(GADInterstitial *)ad
{
    if (self.navigationController.visibleViewController == self)
    {
        NSLog(@"vissble");
        [ad presentFromRootViewController:self];
        
    }else
    {
        NSLog(@"niavig");
        [ad presentFromRootViewController:self.navigationController.topViewController];
    }
}

- (void)interstitialDidDismissScreen:(GADInterstitial *)interstitial
{
    NSLog(@"Ad Closed!");
}





@end
