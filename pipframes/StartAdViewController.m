//
//  StartAdViewController.m
//  FaceBookNativeAdTest
//
//  Created by Deepti's Mac on 11/23/15.
//  Copyright © 2015 D.Yoganjulu  Reddy. All rights reserved.
//

#import "StartAdViewController.h"
#import "XMLReader.h"
@interface StartAdViewController ()<NSXMLParserDelegate>
{
NSXMLParser *xmlParser;


}
@property(nonatomic,retain)NSDictionary *adDictionary;
@end

@implementation StartAdViewController
@synthesize adDictionary;

-(void)addStartAd
{

   // NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];

    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.applycs.com/BadgeAd/Android/getstartad.php?id=1136130593"]];//http://www.applycs.com/BadgeAd/Android/getstartad.php?id=1046439431
    [req setHTTPMethod:@"GET"];
    NSHTTPURLResponse *response = nil;
    NSError *err = nil;
    NSData *responsedata = [NSURLConnection sendSynchronousRequest:req returningResponse:&response error:&err];


    adDictionary = [XMLReader dictionaryForXMLData:responsedata
                                                 options:XMLReaderOptionsProcessNamespaces
                                                   error:&err];

    [self getDictionaryOfImages];

}
-(NSArray *)getDictionaryOfImages
{
  //  NSMutableArray *imageArray = [[NSMutableArray alloc] init];

    NSDictionary *elementDict = (NSDictionary *)[adDictionary valueForKey:@"startads"];

    NSArray *elemntArray = [elementDict valueForKey:@"startad"];

    NSLog(@"%@",elemntArray[0]);
    return  elemntArray;

//NSString *imageUrl = [dict valueForKey:@""]


}


@end
