//
//  SSAlphaPassView.m
//  SSAlphaPass
//
//  Created by Segev on 3/31/15.
//  Copyright (c) 2015 All rights reserved.
//

#import "SSAlphaPassView.h"

@implementation SSAlphaPassView

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    UIColor *pixelColor = [SSAlphaPass colorOfPoint:point withLayer:self.layer];
    if(CGColorGetAlpha(pixelColor.CGColor))
    {
        NSLog(@"customised view");
        return YES;
    }
    
    return NO;
}

@end
