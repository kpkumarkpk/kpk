//
//  touch.m
//  frameimage
//
//  Created by Manohar on 3/25/16.
//  Copyright © 2016 Outthinking Mac. All rights reserved.
//

#import "touch.h"
#import "ViewController.h"

@implementation touch
@synthesize subViewRect;
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    for (UIView *view in self.subviews)
    {
        
        NSLog(@"dfngdjn");
        if (!view.hidden && view.alpha > 0 && view.userInteractionEnabled && [view pointInside:[self convertPoint:point toView:view] withEvent:event])
            return YES;
    }
    return NO;
 }



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"nfgdjkgndjkg2");
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    // here you can get your touch
    NSLog(@"Touched view  %@ ,%@ ,%@",[touch.view class] ,NSStringFromCGPoint(touchLocation),NSStringFromCGRect(touch.view.frame));
    [[self nextResponder] touchesBegan:touches withEvent:event];
}



@end
