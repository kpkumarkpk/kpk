//
//  ImageToDrag.m
//  pipframes
//
//  Created by OUTTHINKING PVT LTD on 4/18/16.
//  Copyright © 2016 OUTTHINKING PVT LTD. All rights reserved.
//

#import "ImageToDrag.h"

@implementation ImageToDrag

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
 
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithImage:(UIImage *)image
{
    if (self = [super initWithImage:image])
        self.userInteractionEnabled = YES;
    return self;
}

@end
