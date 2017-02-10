//
//  DEMOMenuViewController.m
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "DEMOMenuViewController.h"
#import "ViewController.h"
//#import "DEMOSecondViewController.h"
#import "DEMONavigationController.h"
#import "UIViewController+REFrostedViewController.h"
#import "AppConfig.h"

@implementation DEMOMenuViewController

static NSString *const iOSAppStoreURLFormat = @"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:appIconName];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = applicationName;
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
    label.text = @"Others";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [view addSubview:label];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     NSURL *url = [[NSURL alloc] init];

    if (indexPath.section == 0 && indexPath.row == 0) {
        
        url = [NSURL URLWithString:[NSString stringWithFormat:iOSAppStoreURLFormat,applicationId]];
    }
    else if (indexPath.section==0 && indexPath.row==1)
    {
        url=[NSURL URLWithString:[NSString stringWithFormat:instagramUrl]];
    }
    else if (indexPath.section==0 && indexPath.row==2)
    {
        //facebook
        url = [NSURL URLWithString:[NSString stringWithFormat:facebookUrl,facebookId]];

    }
    else if (indexPath.section==1 && indexPath.row==0)
    {
        // open website
        url = [NSURL URLWithString:websiteUrl];
    }
    else if (indexPath.section==1 && indexPath.row==1)
    {
        // more apps
        url = [NSURL URLWithString:moreAppsUrl];
    }
    if ([[UIApplication sharedApplication] canOpenURL:url]) {

        [[UIApplication sharedApplication] openURL:url];
    }

    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    if (sectionIndex==1) {
        return 2;
    }
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    int indexNumber = (int)indexPath.row;
    NSString *voidString = @"         ";
    if (indexPath.section == 0)
    {

        NSArray *titles = @[[NSString stringWithFormat:@"%@Write Review",voidString],[NSString stringWithFormat:@"%@Instagram",voidString],[NSString stringWithFormat:@"%@Facebook",voidString]];
        cell.textLabel.text = titles[indexPath.row];
    }
    else
    {
        indexNumber= indexNumber+3;
        NSArray *titles = @[[NSString stringWithFormat:@"%@Website",voidString], [NSString stringWithFormat:@"%@More Apps",voidString]];
        cell.textLabel.text = titles[indexPath.row];
    }
    NSString *imageName = [NSString stringWithFormat:@"optionIcon_%d.png",indexNumber];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    imgView.image = [UIImage imageNamed:imageName];
    imgView.center = CGPointMake(imgView.frame.size.width/2+5, 27);
    [cell addSubview:imgView];
    //cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}

@end
