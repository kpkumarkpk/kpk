//
//  FourthViewController.m
//  secondapp
//
//  Created by OUTTHINKING PVT LTD on 1/29/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import "FourthViewController.h"
#import "OT_TabBar.h"
#import "Config.h"

#import "FilterViewController.h"

#define FONT_SIZE 20

//#define fullScreen                          ([[UIScreen mainScreen]bounds])
#define screenWidth                         ([[UIScreen mainScreen]bounds].size.width)
#define screenHeight                        ([[UIScreen mainScreen]bounds].size.height)



@interface FourthViewController ()<UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    
    
    UIImageView *screenshotimagev;
    
    UIImage *squarscreenshot;
    
    UITextField *textdata;
    
    NSInteger i;
    
    UISlider *opacityslider;
    
    UIImage *screenShot;
    
    
    NSInteger value;
    
    UIScrollView *panscrollview;
    
        
   }



@end

@implementation FourthViewController

@synthesize blurimgv,thirdimage,stickerview,downvw,downscro,stickers,stickerimgv,fontarray,colorbutton,stylebutton,colorarray,applycolbt,applystylebt,familyname,fontname,stickerlargarr,applyfontbt,stickerapplybt,bottommenubar,sizes,style,color,opacity,backgroundstripimgv,sizearray,applysizebt,sizebutton,panGestureforsticker,pinchforsticker,rotationforsticker,textpanGesture,textrotation;

  int  fontindex;




- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self allocateresourcesforbottommenubar];
    
    [self allocateResourcesForTopToolBar];
    
    [self allocateresourcesforstickerview];
    
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }
    


     ///----------Pan view---------------//
    
    
    if(panscrollview!=nil)
    {
        [panscrollview removeFromSuperview];
        panscrollview=nil;
    }
    
    panscrollview=[[UIScrollView alloc]init];
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        panscrollview.frame=CGRectMake((fullScreen.size.width - ImageView_Hieight),0, 1.4*ImageView_Hieight, 1.58*ImageView_Hieight-12);
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        panscrollview.frame=CGRectMake((fullScreen.size.width - ImageView_Hieight+downstrip_height/8),0+downstrip_height/8, ImageView_Hieight-downstrip_height/8, ImageView_Hieight-downstrip_height/8);

        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        panscrollview.frame=CGRectMake((fullScreen.size.width - ImageView_Hieight+downstrip_height/8),0+downstrip_height/8, ImageView_Hieight-downstrip_height/8, ImageView_Hieight-downstrip_height/8);
        
        
        
    }
    
    [panscrollview setBackgroundColor:[UIColor clearColor]];
    
    panscrollview.center=CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    
    [self.view addSubview:panscrollview];
    
    
    
}

-(void)allocateresourcesforstickerview
{
    backgroundstripimgv=[[UIImageView alloc]init];
    blurimgv=[[UIImageView alloc]init];


    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        backgroundstripimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),0, 1.4*ImageView_Hieight,1.58*ImageView_Hieight);
        
        blurimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),0, 1.4*ImageView_Hieight, 1.58*ImageView_Hieight);
        

        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        backgroundstripimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,0, ImageView_Hieight, ImageView_Hieight);
        
        blurimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),0, ImageView_Hieight, ImageView_Hieight);
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
       backgroundstripimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight)/2,0, ImageView_Hieight, ImageView_Hieight);
        
        blurimgv . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),0, ImageView_Hieight, ImageView_Hieight);
        
        
    }

    
    
    //-------------Background strip imageview-------------//
    
    
    backgroundstripimgv . center = CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    backgroundstripimgv.backgroundColor=[UIColor colorWithRed:0.227 green:0.227 blue:0.227 alpha:1];
    [self.view addSubview:backgroundstripimgv];
    
    
        //--------passing screenshot on this imageview--------//
    
    
    blurimgv . center = CGPointMake(fullScreen.size.width/2, fullScreen.size.height/2);
    UIImage *img = [self squareImageWithImage:thirdimage scaledToSize:blurimgv.frame.size];
    blurimgv.image=img;
    [self.view addSubview:blurimgv];

    
    
}
-(void)allocateresourcesforbottommenubar
{
    
        if (bottommenubar!=nil)
    {
        [bottommenubar removeFromSuperview];
        bottommenubar=nil;
    }
    
    
    bottommenubar = [[OT_TabBar alloc]initWithFrame:CGRectMake(0,fullScreen.size.height-44,fullScreen.size.width,downstrip_height)];
    bottommenubar.delegate = self;
    bottommenubar.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    bottommenubar.showOverlayOnSelection = NO;
    
    OT_TabBarItem *addtext= [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"TEXT"]
                                                 selectedImage:[UIImage imageNamed:@"TEXT-1"]
                                                           tag:0];
    
    
    OT_TabBarItem *addsticker = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"STICKER"]
                                                   selectedImage:[UIImage imageNamed:@"STICKER-1"]
                                                             tag:1];
    
    OT_TabBarItem *share = [[OT_TabBarItem alloc]initWithImage:[UIImage imageNamed:@"SHARE"]
                                                      selectedImage:[UIImage imageNamed:@"SHARE-2"]
                                                                tag:2];
      bottommenubar.itemTitleArray = [NSArray arrayWithObjects:@"Text",@"Sticker",@"Share", nil];
    bottommenubar.items = [NSArray arrayWithObjects:addtext,addsticker,share, nil];
    
    [self.view addSubview:bottommenubar];
    
    
}
-(void)otTabBar:(OT_TabBar*)tbar didSelectItem:(OT_TabBarItem*)tItem
{
    switch (tItem.tag)
    {
        case 0:
        {
            [self allocateResourcesForLabels];
            
            break;
        }
        case 1:
        {
            [self addstickerhere];
            
            break;
        }
        case 2:
        {
            [self Movehere];
            break;
        }
        default:
        {
            break;
        }
    }
}

-(void)allocateResourcesForLabels
{
   
    fontindex=0;
    
    if (downscro!=nil)
    {
        [downscro removeFromSuperview];
        downscro=nil;

    }
    
    
    [stickerapplybt removeFromSuperview];
    stickerapplybt=nil;
    
    [opacityslider removeFromSuperview];
    
    if (textdata!=nil)
    {
        [textdata removeFromSuperview];
        textdata=nil;
    };
    
    
    textdata = [[UITextField alloc] initWithFrame:CGRectMake(50,100,screenWidth,70)];
    textdata.center=CGPointMake(fullScreen.size.width/3, fullScreen.size.height/4);
    textdata.backgroundColor=[UIColor clearColor];
    textdata.textColor = [UIColor whiteColor];
    textdata.textAlignment = NSTextAlignmentCenter;
    [textdata resignFirstResponder];
    [textdata becomeFirstResponder];
    [textdata setAdjustsFontSizeToFitWidth:NO];
    [textdata endEditing:YES];
    
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        textdata.font = [UIFont fontWithName:@"Copperplate" size:def_fontsize];

        
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        textdata.font = [UIFont fontWithName:@"Copperplate" size:def_fontsize];

        
        
    }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        textdata.font = [UIFont fontWithName:@"Thonburi" size:def_fontsize];

        
    }
    

    
    
    
    
    
    [textdata performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.0];
    textdata.delegate = self;
    textdata.text = @"";
    textdata.layer. masksToBounds = YES;
    [panscrollview addSubview:textdata];
    
    //----------Ui Pan Gesture Recognizer-------------//
    
    textpanGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan1:)];
    [textpanGesture setDelegate:self];
    [textdata addGestureRecognizer:textpanGesture];
    
    
    
    
    
    
    //------------Ui Rotattion Gesture Recognizer-----------//
    
    textrotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate1:)];
    [textrotation setDelegate:self];
    [textdata addGestureRecognizer:textrotation];
    NSLog(@"textclicked");
    [self allocatedownvwbuttons];
    

}


-(void)allocatedownvwbuttons
{
    
    
    if(downvw!=nil){
        [downvw removeFromSuperview];
        [stickerapplybt removeFromSuperview];
        downvw=nil;
    }
    
    
    //-----------Adding downView-----------//
    
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        downvw=[[UIView alloc]initWithFrame:CGRectMake(0.0, (fullScreen.size.height-(Top_Strip*2)-Top_Strip/4), fullScreen.size.width,Top_Strip+Top_Strip/5)];
        
        downvw.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
        downvw=[[UIView alloc]initWithFrame:CGRectMake(0.0, (fullScreen.size.height-(Top_Strip*2)-Top_Strip/8), fullScreen.size.width,Top_Strip+Top_Strip/5)];
        
        downvw.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        downvw=[[UIView alloc]initWithFrame:CGRectMake(0.0, (fullScreen.size.height-(Top_Strip*1.95)-Top_Strip/4), fullScreen.size.width,Top_Strip+Top_Strip/8)];
        
        downvw.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
        
        
    }
    
    
    
    [self.view addSubview:downvw];
    
    sizebutton= [UIButton buttonWithType:UIButtonTypeCustom];
    sizebutton.frame = CGRectMake(but_width*2, (but_height/2), but_width, but_height);
    
    
    [sizebutton setImage:[UIImage imageNamed:@"TEXT-SIZE"] forState:UIControlStateNormal];
    [sizebutton addTarget:self action:@selector(sizehere) forControlEvents:UIControlEventTouchUpInside];
    [downvw addSubview:sizebutton];
    
    stylebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    stylebutton.frame = CGRectMake(fullScreen.size.width/4+but_width+but_width/2, but_height/2, but_width, but_height);
    [stylebutton setImage:[UIImage imageNamed:@"TEXT-STYLE"] forState:UIControlStateNormal];
    [stylebutton addTarget:self action:@selector(fontandsizeselecthere) forControlEvents:UIControlEventTouchUpInside];
    [downvw addSubview:stylebutton];
    
    colorbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    colorbutton.frame = CGRectMake(fullScreen.size.width/2+fullScreen.size.width/4-but_width*2-but_width/2, but_height/2, but_width, but_height);
    [colorbutton setImage:[UIImage imageNamed:@"TEXT-COLOR"] forState:UIControlStateNormal];
    [colorbutton addTarget:self action:@selector(colorselecthere) forControlEvents:UIControlEventTouchUpInside];
    [downvw addSubview:colorbutton];
    
    

    
    opacity = [UIButton buttonWithType:UIButtonTypeCustom];
    opacity.frame = CGRectMake(fullScreen.size.width-but_width*2-but_width, but_height/2, but_width, but_height);
    [opacity setImage:[UIImage imageNamed:@"OPPASITE"] forState:UIControlStateNormal];
    [opacity addTarget:self action:@selector(opacity:) forControlEvents:UIControlEventTouchUpInside];
    [downvw addSubview:opacity];
    
    NSLog(@"textclicked");
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{     
    
   [self.view endEditing:YES];
    
    
    
    
}
- (IBAction)opacity :(id)sender
{
    [downscro removeFromSuperview];
    [applycolbt removeFromSuperview];
    [applyfontbt removeFromSuperview];
    [applysizebt removeFromSuperview];
    [opacityslider removeFromSuperview];

    
    opacityslider = [[UISlider alloc] init];
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        int buttonHeight=screenWidth*0.1;
        
        
        opacityslider.frame=CGRectMake(0, fullScreen.size.height-(1.2*Top_Strip)-2*Top_Strip, fullScreen.size.width, buttonHeight);
        
        

        
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        opacityslider.frame=CGRectMake(0, fullScreen.size.height-(3*Top_Strip)-Top_Strip*3/12, fullScreen.size.width, Top_Strip+Top_Strip/25);
        

        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        int buttonHeight=screenWidth*0.1;
        
        
        opacityslider.frame=CGRectMake(0, fullScreen.size.height-(2*Top_Strip)-Top_Strip, fullScreen.size.width, buttonHeight);
        
        
        
        
        
    }
    
    
    [opacityslider addTarget:self action:@selector(opacitysliderAction:) forControlEvents:UIControlEventValueChanged];
    [opacityslider setBackgroundColor:[UIColor clearColor]];
    opacityslider.minimumValue = 0.0;
    opacityslider.maximumValue = 1.0;
    opacityslider.continuous = YES;
    opacityslider.value = 1.0;
    [self.view addSubview:opacityslider];
    
    
}
- (IBAction)opacitysliderAction:(id)sender
{
    UISlider *slider = (UISlider *)sender;
    textdata.alpha = slider.value;
}
-(BOOL) textFieldShouldReturn:(UITextField *)textdata
{
    NSLog(@"cancel text");
    
    [textdata resignFirstResponder];
    
    return YES;
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


-(void)fontandsizeselecthere

{
    
    if (downscro!=nil)
    {
        [downscro removeFromSuperview];
        downscro=nil;
        
        [applyfontbt removeFromSuperview];
        applyfontbt=nil;
        
        [opacityslider removeFromSuperview];
        opacityslider=nil;

        
    }
        
    
    //----------------Down UIscrollview for frames--------//
    

    int xCoord=0;
    int yCoord=0;
    int buffer = 5;
    
    
    //----------------Down UIscrollview for frames--------//
    
    
    downscro=[[UIScrollView alloc]init];
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        int buttonHeight=screenWidth*0.1;
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(3.3*Top_Strip), fullScreen.size.width, buttonHeight);
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(3*Top_Strip)-Top_Strip*3/12, fullScreen.size.width, Top_Strip+Top_Strip/25);
        
    }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        int buttonHeight=screenWidth*0.1;
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(2*Top_Strip)-Top_Strip, fullScreen.size.width, buttonHeight);
        
    }
    
    downscro.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    
    downscro.contentSize=thirdimage.size;
    
    [downscro setUserInteractionEnabled:YES];
    
    [downscro setShowsHorizontalScrollIndicator:NO];
    
    [downscro setShowsVerticalScrollIndicator:NO];
    
    [downscro setUserInteractionEnabled:YES];
    
    [self.view addSubview:downscro];
    
    
    
    
    //------applying animation------------//
    
    CATransition *strip_transition=[CATransition animation];
    strip_transition.type=kCATransitionPush;
    strip_transition.subtype=kCATransitionFromTop;
    strip_transition.duration=0.50;
    [[downscro layer] addAnimation:strip_transition forKey:@"down-strip.jpg"];
    
    [applyfontbt addSubview:downscro];
    
    [self.view sendSubviewToBack:downscro];

    
    //-------------------Adding frames to Ui scrollview------------------//
    
     NSLog(@"family names are %@",[UIFont familyNames]);
    
    for (int b=0;b<[[UIFont familyNames] count];b++)
    {
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
        {
            
            int buttonHeight=screenWidth*0.09;
            int buttonWidth=screenWidth*0.2;
            
            
            
            applyfontbt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((75*buttonWidth)+(75*buffer), yCoord)];
            
            
            
            
        }
        else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
        {
            int buttonHeight=screenWidth*0.09;
            int buttonWidth=screenWidth*0.2;
            
            
            
            applyfontbt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((75*buttonWidth)+(75*buffer), yCoord)];
            
            
            
        }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            
            int buttonWidth=screenWidth*0.5;
            int buttonHeight=screenWidth*0.1;
            
            applyfontbt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((75*buttonWidth)+(75*buffer), yCoord)];
            
            
        }
        

        
        [applyfontbt setTag:b];
        [applyfontbt setTitle:[[UIFont familyNames] objectAtIndex:b] forState:UIControlStateNormal];
        
        
        applyfontbt.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];

        [applyfontbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [applyfontbt setSelected:true];
        [applyfontbt addTarget:self action:@selector(selectedfontapply:) forControlEvents:UIControlEventTouchUpInside];
        [downscro addSubview:applyfontbt];
        }
    
    }

-(void)selectedfontapply:(UIButton*)select
{
    
  fontindex = (int)select.tag;
    
    
    NSLog(@"selected font apply%@",textdata.font);
    
    if(value!=0)
    {
        textdata.font=[UIFont fontWithName:[[UIFont familyNames] objectAtIndex:fontindex]size:value];

    }
    else
    {
    textdata.font=[UIFont fontWithName:[[UIFont familyNames] objectAtIndex:fontindex]size:21];

    }
    
    
    
}

-(void)colorselecthere
{
    
      if (downscro!=nil)
    {
        [downscro removeFromSuperview];
        downscro=nil;
        
        [applycolbt removeFromSuperview];
        applycolbt=nil;
        
        [opacityslider removeFromSuperview];
        opacityslider=nil;

        
        
    }

    
    //----------------Down UIscrollview for frames--------//
    
    
    int xCoord=0;
    int yCoord=0;
    
    int buffer = 5;
    
    
    
    //----------------Down UIscrollview for frames--------//
    
    
    downscro=[[UIScrollView alloc]init];
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        int buttonHeight=screenWidth*0.1;
        
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(3.3*Top_Strip), fullScreen.size.width, buttonHeight);
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(3*Top_Strip)-Top_Strip*3/12, fullScreen.size.width, Top_Strip+Top_Strip/25);
        
        
        
    }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        int buttonHeight=screenWidth*0.1;
        
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(2*Top_Strip)-Top_Strip, fullScreen.size.width, buttonHeight);
        
        
    }
    
        downscro.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    
    
    downscro.contentSize=thirdimage.size;
    
    [downscro setUserInteractionEnabled:YES];
    
    [downscro setShowsHorizontalScrollIndicator:NO];
    
    [downscro setShowsVerticalScrollIndicator:NO];
    
    [downscro setUserInteractionEnabled:YES];
    
    
    [self.view addSubview:downscro];
    
    
    
     //------applying animation------------//
     
     CATransition *strip_transition=[CATransition animation];
     strip_transition.type=kCATransitionPush;
     strip_transition.subtype=kCATransitionFromTop;
     strip_transition.duration=0.50;
     [[downscro layer] addAnimation:strip_transition forKey:@"down-strip.jpg"];
     
     [applycolbt addSubview:downscro];
    
    [self.view sendSubviewToBack:downscro];

    
    colorarray=[[NSArray alloc]initWithObjects:[UIColor brownColor],[UIColor whiteColor],[UIColor redColor],[UIColor blueColor],[UIColor greenColor],[UIColor grayColor],[UIColor purpleColor],[UIColor orangeColor],[UIColor magentaColor],[UIColor cyanColor],[UIColor yellowColor],[UIColor blackColor], nil];
    
    
    
    for (int b=0;b<[colorarray count];b++)
    {

        applycolbt=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            
            int buttonWidth=screenWidth*0.1;
            int buttonHeight=screenWidth*0.1;
            
            applycolbt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((12*buttonWidth)+(12*buffer), yCoord)];
            
            
        }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
        {
            
            
            int buttonHeight=screenWidth*0.09;
            int buttonWidth=screenWidth*0.09;
            
            
            
            applycolbt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((12*buttonWidth)+(12*buffer), yCoord)];
            
            
            
        }
        

        
        [applycolbt setTag:b];
        
    
        [applycolbt setBackgroundColor:[colorarray objectAtIndex:b]];
        
        [applycolbt setSelected:true];
        
        NSLog(@"array of colors object at index%@",[colorarray objectAtIndex:b]);
        
        [applycolbt addTarget:self action:@selector(selectedcolorapply:) forControlEvents:UIControlEventTouchUpInside];
        
        [downscro addSubview:applycolbt];
        ;
        
        
    }
    
    

    
}

-(void)selectedcolorapply:(UIButton*)selectedcolor
{
    
    
    NSLog(@"button pressed here%ld",(long)selectedcolor.tag);
    
int index = (int)selectedcolor.tag;
    
     [textdata setTextColor:[colorarray objectAtIndex:index]];

    NSLog(@"textview fonts%@",[colorarray objectAtIndex:index]);
    

    
}
-(void)sizehere
{
    

    
    
    
    if (downscro!=nil)
    {
        [downscro removeFromSuperview];
        downscro=nil;
        
        [applysizebt removeFromSuperview];
        applysizebt=nil;
        [opacityslider removeFromSuperview];
        opacityslider=nil;
        
    }
    
    int xCoord=0;
    int yCoord=0;
    
    int buffer = 5;

    
    
    //----------------Down UIscrollview for frames--------//
    
    
    
    
    downscro=[[UIScrollView alloc]init];
    
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        int buttonHeight=screenWidth*0.1;
        
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(3.3*Top_Strip), fullScreen.size.width, buttonHeight);
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(3*Top_Strip)-Top_Strip*3/12, fullScreen.size.width, Top_Strip+Top_Strip/25);
        
        
        
    }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
        int buttonHeight=screenWidth*0.1;
        
        
        downscro.frame=CGRectMake(0, fullScreen.size.height-(2*Top_Strip)-Top_Strip, fullScreen.size.width, buttonHeight);
        
        
    }
    
        
    
    downscro.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];

    
    downscro.contentSize=thirdimage.size;
    
    [downscro setUserInteractionEnabled:YES];
    
    [downscro setShowsHorizontalScrollIndicator:NO];
    
    [downscro setShowsVerticalScrollIndicator:NO];
    
    [downscro setUserInteractionEnabled:YES];
    
    
    [self.view addSubview:downscro];
    
    
    
    //------applying animation------------//
    
    CATransition *strip_transition=[CATransition animation];
    strip_transition.type=kCATransitionPush;
    strip_transition.subtype=kCATransitionFromTop;
    strip_transition.duration=0.50;
    [[downscro layer] addAnimation:strip_transition forKey:@"down-strip.jpg"];
    
    [applysizebt addSubview:downscro];
    
    [self.view sendSubviewToBack:downscro];

    
    
    //--------Applying different sizes to text----------//
    
   
    NSInteger myIntegers[40];
    
    for (i = 0; i < 40; i++)
    {
        myIntegers[i] = i;
        
        
        applysizebt=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            
            int buttonWidth=screenWidth*0.1;
            int buttonHeight=screenWidth*0.1;
            
            applysizebt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((40*buttonWidth)+(40*buffer), yCoord)];
            
            
        }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
        {
            
            
            int buttonHeight=screenWidth*0.09;
            int buttonWidth=screenWidth*0.09;
            
            
            
            applysizebt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((40*buttonWidth)+(40*buffer), yCoord)];
            
            
            
        }
        
        
        [applysizebt setTag:i];
        
        NSString * title = [NSString stringWithFormat:@"%ld",(long)i+20];
        
        
        applysizebt.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
        [applysizebt setTitle:title forState:UIControlStateNormal];
                NSLog (@"The 4th integer is: %ld", (long)myIntegers[i]);
        [applysizebt setSelected:true];
        
         [applysizebt addTarget:self action:@selector(selectedsizeapply:) forControlEvents:UIControlEventTouchUpInside];
        
        [downscro addSubview:applysizebt];
        
        
        

    }
    
    
}
-(void)selectedsizeapply:(UIButton*)selectedsize
{
    
    NSLog(@"button pressed here%ld",(long)selectedsize.tag);
    
 int index = (int)selectedsize.tag;
    
    [textdata setUserInteractionEnabled:YES];
    
    value=index+20;

    
   
    
    if(value!=0)
    {
        
        
        
        textdata.font = [UIFont systemFontOfSize:value];

        textdata.font=[UIFont fontWithName:[[UIFont familyNames] objectAtIndex:fontindex]size:value];
        

        
    }
    else
    {
        textdata.font=nil;
        
        textdata.font = [UIFont systemFontOfSize:value];
        
        textdata.font = [UIFont fontWithName:@"Copperplate" size:def_fontsize];

        
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
        {
            textdata.font = [UIFont fontWithName:@"Copperplate" size:def_fontsize];
            
            
            
            
        }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
        {
            
            textdata.font = [UIFont fontWithName:@"Copperplate" size:def_fontsize];
            
            
            
        }
        else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            
            textdata.font = [UIFont fontWithName:@"Thonburi" size:def_fontsize];
            
            
        }
        
        
        
    }
    
    
    NSLog(@"textdatafontsizes are%@",textdata.font);
    
    
    
    
    
    
    
}

- (void)allocateResourcesForTopToolBar
{
    UIView *topToolBar = [[UIView alloc] init];
    topToolBar.backgroundColor=[UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    topToolBar . frame = CGRectMake(0, 0, fullScreen.size.width, Top_Strip);
    topToolBar . userInteractionEnabled = YES;
    [self.view addSubview:topToolBar];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, fullScreen.size.width, Top_Strip)];
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
    backButton . frame = CGRectMake(0, 0, Share_Strip, Share_Strip);
    [backButton setImage:[UIImage imageNamed:@"BACK"] forState:UIControlStateNormal];
    
    

    [backButton addTarget:self action:@selector(goBacktosecondpage) forControlEvents:UIControlEventTouchUpInside];
    [topToolBar addSubview:backButton];
    
    
}

-(void)goBacktosecondpage
{
   
    [self.navigationController popViewControllerAnimated:YES];
    
}


-(void)addstickerhere
{
    
    if (downscro!=nil)
    {
        
        [downscro removeFromSuperview];
        downscro=nil;
        
        [stickerapplybt removeFromSuperview];
        stickerapplybt=nil;
        
        [applysizebt removeFromSuperview];
        applysizebt=nil;
        
        [applycolbt removeFromSuperview];
        applycolbt=nil;
        
        [applyfontbt removeFromSuperview];
        applyfontbt=nil;
        
        [downvw removeFromSuperview];
        downvw=nil;
        
    }


    if (downvw!=nil)
    {
        [downvw removeFromSuperview];
        
        downvw=nil;
    }
    
    
    [opacityslider removeFromSuperview];
    opacityslider=nil;

    

    downscro=[[UIScrollView alloc]init];

    int xCoord=0;
    int yCoord=4;
    int buffer = 5;
    
    
    //----------------Down UIscrollview for frames--------//
    
    
    
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
        
        int buttonHeight=screenWidth*0.2;
        
        downscro.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+45);
        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
        
        
        int buttonHeight=screenWidth*0.09;
        
        downscro.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+28);
        
        
    }
    else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
        
       
        int buttonHeight=screenWidth*0.2;
        
        downscro.frame=CGRectMake(0,fullScreen.size.height-downstrip_height-buttonHeight-2*buffer,fullScreen.size.width ,downstrip_height+28);
        
    }
    
    downscro.backgroundColor = [UIColor colorWithRed:0.149 green:0.149 blue:0.149 alpha:1];
    
    downscro.delegate=self;
    
    downscro.contentSize=thirdimage.size;
    
    [downscro setUserInteractionEnabled:YES];
    
    [downscro setShowsHorizontalScrollIndicator:YES];
    
    [downscro setShowsVerticalScrollIndicator:NO];
    
    [downscro setUserInteractionEnabled:YES];
    
    [self.view addSubview:downscro];
    
    //------applying animation------------//
    
    CATransition *strip_transition=[CATransition animation];
    strip_transition.type=kCATransitionPush;
    strip_transition.subtype=kCATransitionFromTop;
    strip_transition.duration=0.50;
    [[downscro layer] addAnimation:strip_transition forKey:@"down-strip.jpg"];
    
    [stickerapplybt addSubview:downscro];
    
    [self.view sendSubviewToBack:downscro];

    
    //-------------------Adding Stickers to Ui scrollview------------------//
    
    stickers = [[NSArray alloc]initWithObjects:@"sticksmall01.png",@"sticksmall02.png",@"sticksmall03.png",@"sticksmall04.png",@"sticksmall05.png",@"sticksmall06.png",@"sticksmall07.png",@"sticksmall08.png",@"sticksmall09.png",@"sticksmall010.png",@"sticksmall011.png",@"sticksmall012.png",@"sticksmall013.png",@"sticksmall014.png",@"sticksmall015.png",@"sticksmall016.png",@"sticksmall017.png",@"sticksmall018.png",@"sticksmall019.png",@"sticksmall020.png",@"sticksmall021.png",@"sticksmall022.png",@"sticksmall023.png",@"sticksmall024.png",@"sticksmall025.png",@"sticksmall026.png",@"sticksmall027.png",@"sticksmall028.png",@"sticksmall029.png",@"sticksmall030.png",@"sticksmall031.png",nil];
    
    
    for (int b=0;b<[stickers count];b++)
    {
        if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
        {
            
            int buttonHeight=screenWidth*0.2;
            int buttonWidth=screenWidth*0.2;
            
            
            stickerapplybt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((31*screenWidth*0.2)+(31*buffer), yCoord)];
            
            
        }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
        {
            
            
            int buttonHeight=screenWidth*0.09;
            int buttonWidth=screenWidth*0.09;
            
            
            
            stickerapplybt = [[UIButton alloc]initWithFrame:CGRectMake(xCoord, yCoord, buttonWidth, buttonHeight)];
            
            xCoord += buttonWidth + buffer;
            
            [downscro setContentSize:CGSizeMake((31*screenWidth*0.09)+(31*buffer), yCoord)];
            
            
            
        }

        
        [stickerapplybt setTag:b];
        
        // buttonindex=b;
        
       // [stickerapplybt setBackgroundColor:[UIColor grayColor]];
        
        [stickerapplybt setBackgroundColor:[UIColor colorWithRed:0.227 green:0.227 blue:0.227 alpha:1]];

        
        [stickerapplybt setImage:[UIImage imageNamed:[stickers objectAtIndex:b]] forState:UIControlStateNormal];
        
        [stickerapplybt setSelected:true];
        
        NSLog(@"stickers object at index%@",[stickers objectAtIndex:b]);
        
        [stickerapplybt addTarget:self action:@selector(stickerbuttonpress:) forControlEvents:UIControlEventTouchUpInside];
        
        [downscro addSubview:stickerapplybt];
        
        
        // [self placeimagesonimagev:[menuItems objectAtIndex:b]];
        
    }
    
    
    //-------------------Adding Stickers to Ui Imageview------------------//
    
    stickerlargarr = [[NSArray alloc]initWithObjects:@"sticklarge01.png",@"sticklarge02.png",@"sticklarge03.png",@"sticklarge04.png",@"sticklarge05.png",@"sticklarge06.png",@"sticklarge07.png",@"sticklarge08.png",@"sticklarge09.png",@"sticklarge10.png",@"sticklarge11.png",@"sticklarge12.png",@"sticklarge13.png",@"sticklarge14.png",@"sticklarge15.png",@"sticklarge16.png",@"sticklarge17.png",@"sticklarge18.png",@"sticklarge19.png",@"sticklarge20.png",@"sticklarge21.png",@"sticklarge22.png",@"sticklarge23.png",@"sticklarge24.png",@"sticklarge25.png",@"sticklarge26.png",@"sticklarge27.png",@"sticklarge28.png",@"sticklarge29.png",@"sticklarge30.png",@"sticklarge31.png",nil];
    
    
  
}

-(void)stickerbuttonpress:(UIButton*)sender
{
    
    
    if (stickerimgv.image!=nil)
    {
        [stickerimgv removeFromSuperview];
        stickerimgv.image=nil;
    }
    
    
    //---------Sticker Imageview------------------//
    
    // stickerimgv=[[UIImageView alloc]initWithFrame:CGRectMake(500, 500, stickerview.frame.size.width-500, stickerview.frame.size.height-500)];
    
    stickerimgv=[[UIImageView alloc]initWithFrame:CGRectMake(50,150,100,100)];
    
    
    stickerimgv.center=CGPointMake(fullScreen.size.width/2, fullScreen.size.height/3);
    
    [stickerimgv setContentMode:UIViewContentModeScaleAspectFit];
    
    [stickerimgv setBackgroundColor:[UIColor clearColor]];
    [stickerimgv setUserInteractionEnabled:YES];
    [panscrollview addSubview:stickerimgv];
    
    
    //----------Ui Pan Gesture Recognizer-------------//
    
    panGestureforsticker = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(stickerpan:)];
    
    [panGestureforsticker setDelegate:self];
    
    [stickerimgv addGestureRecognizer:panGestureforsticker];
    
    
    //----------- UI Pinch Gesture Recognizer---------------//
    
    pinchforsticker = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(stickerpinch:)];
    
    [pinchforsticker setDelegate:self];
    
    [stickerimgv addGestureRecognizer:pinchforsticker];
    
    //------------Ui Rotattion Gesture Recognizer-----------//
    
    rotationforsticker = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(stickerrotate:)];
    
    [rotationforsticker setDelegate:self];
    
    [stickerimgv addGestureRecognizer:rotationforsticker];
    

    
    NSLog(@"Selected current button:%ld",(long)sender.tag);
    int index = (int)sender.tag;

     UIImage * sample;

     sample=[stickerlargarr objectAtIndex:index];
    
     NSLog(@"the sticker images are %@",sample);
    
     stickerimgv.image = [UIImage imageNamed:[stickerlargarr objectAtIndex:index]];
    
    NSLog(@"sticker images%@",stickerimgv.image);
    
    
}
- (void)stickerpan:(UIPanGestureRecognizer*) recognizer
{
    
    stickerimgv.userInteractionEnabled=YES;

    
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {

    
    NSLog(@"test");
        
        
    CGPoint translation = [recognizer translationInView:self.view];
        
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
        
    [recognizer setTranslation:CGPointZero inView:self.view];
        
    }
    
}
- (IBAction)stickerrotate:(UIRotationGestureRecognizer *)recognizer

{
    stickerimgv.userInteractionEnabled=YES;

    
    UIGestureRecognizerState state = [recognizer state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {

    
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
    }
    
}
- (IBAction)stickerpinch:(UIPinchGestureRecognizer *)recognizer
{
    
    stickerimgv.userInteractionEnabled=YES;

    UIGestureRecognizerState state = [recognizer state];

    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
    
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
    }
    
    
}


-(void)Movehere
{
    

    if (bottommenubar!=nil)
    {
        bottommenubar=nil;
    }
   
    
    if (downscro!=nil)
    {
        
        [downscro removeFromSuperview];
        downscro=nil;
        

        [applycolbt removeFromSuperview];
        applycolbt=nil;
        
        [applyfontbt removeFromSuperview];
        applyfontbt=nil;
        
        [applysizebt removeFromSuperview];
        applysizebt=nil;
        
    }
    
    if (opacityslider!=nil)
    {
        [opacityslider removeFromSuperview];
        opacityslider=nil;
    }
    
    
    if (screenshotimagev.image!=nil)
    {
        screenshotimagev.image=nil;
        
        [screenshotimagev removeFromSuperview];
        
        
        
    }
    
    if (downvw!=nil)
    {
        [downvw removeFromSuperview];
        downvw=nil;
        
        downscro=nil;
        
        [stickerapplybt removeFromSuperview];
        stickerapplybt=nil;
    }
    
    
    
    if (blurimgv!=nil)
    {
        blurimgv=nil;
    }
    
    
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    screenshotimagev . frame = CGRectMake((fullScreen.size.width - ImageView_Hieight),0, ImageView_Hieight, ImageView_Hieight);
    
    screenshotimagev.center = CGPointMake(screenWidth/2, screenHeight/2);
    
    [screenshotimagev setBackgroundColor:[UIColor clearColor]];
    
    [screenshotimagev.layer renderInContext:UIGraphicsGetCurrentContext()];
    
       CGSize size = CGSizeMake(blurimgv.frame.size.width, blurimgv.frame.size.width);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    CGRect rec;
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >640)
    {
         rec = CGRectMake(-0.9*downstrip_height, -2*downstrip_height,screenWidth+2.3*downstrip_height, screenHeight+3.5*downstrip_height);
        

        
        
    }else if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
    {
         rec = CGRectMake(-downstrip_height, -2.5*downstrip_height,screenWidth+2.3*downstrip_height, screenHeight+4*downstrip_height);
        
        
    }
    else  if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPhone && fullScreen.size.height >480)
    {
         rec = CGRectMake(-0.9*downstrip_height, -2*downstrip_height,screenWidth+2.3*downstrip_height, screenHeight+3.5*downstrip_height);
        

        
    }
    
    
    [self.view drawViewHierarchyInRect:rec afterScreenUpdates:YES];
    
        screenShot = UIGraphicsGetImageFromCurrentImageContext();
    
  //  squarscreenshot = [self squareImageWithImage:screenShot scaledToSize:blurimgv.frame.size];
    
    squarscreenshot=[self cropImage:screenShot inRect:rec];
    
    UIGraphicsEndImageContext();
    
    screenshotimagev.image=squarscreenshot;
    
    [self.view addSubview:screenshotimagev];
    
        
    ShareViewController *sharevc=[[ShareViewController alloc]init];
    
    [self.navigationController pushViewController:sharevc animated:YES];
    
    sharevc.finalscreenshot=squarscreenshot;
    
    
}
 - (UIImage *)cropImage:(UIImage *)image inRect:(CGRect)rect
 {
 CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
 UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
 CGImageRelease(imageRef);
 
 return resultImage;
 }


-(void)handlePan1:(UIPanGestureRecognizer*)sender

{
    textdata.userInteractionEnabled=YES;
    
    UIGestureRecognizerState state = [sender state];
    
    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
    
    CGPoint translation = [sender translationInView:self.view];
        
    sender.view.center = CGPointMake(sender.view.center.x + translation.x, sender.view.center.y + translation.y);
    [sender setTranslation:CGPointZero inView:self.view];
    }
    
    
    
    NSLog(@"panhere");
    
    
    
    
    
    
}

-(void)handleRotate1:(UIRotationGestureRecognizer*)sender
{
    
    textdata.userInteractionEnabled=YES;

    
    UIGestureRecognizerState state = [sender state];

    if (state == UIGestureRecognizerStateBegan || state == UIGestureRecognizerStateChanged)
    {
 
    textdata.userInteractionEnabled=YES;
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    sender.rotation = 0;
        
    }
    
    NSLog(@"rotatehere");

}
/*-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point;
    point = [touch locationInView:self.view];
    
    ball.center = point;
    
    if (CGRectIntersectsRect(ball.frame, maze.frame)) {
        //my stuff
    }
}*/

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

// Full screen adds


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 
 
 //http://www.rapidtables.com/web/color/RGB_Color.htm
 
 //http://www.touch-code-magazine.com/web-color-to-uicolor-convertor/

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

