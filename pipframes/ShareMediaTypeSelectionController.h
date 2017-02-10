//
//  ShareMediaTypeSelectionController.h
//  Instapicframes
//
//  Created by Vijay Doddavala on 10/28/15.
//
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>


#define notification_generate_image_forshare  @"notification_generate_image_forshare"
#define notification_generate_video_forshare  @"notification_generate_video_forshare"
#define notification_image_forshare_generated @"notification_image_forshare_generated"
#define notification_video_forshare_generated @"notification_video_forshare_generated"

#define key_notification_generated_image      @"key_notification_generated_image"
#define key_output_image_url                  @"key_output_image_url"

#define tag_imagepreview_forshare  1025
#define tag_imageoption_forshare   1027
#define tag_videooption_forshare   1028
#define kPLDefaultsAvatarUrl


@interface ShareMediaTypeSelectionController : UIViewController


@property(nonatomic,assign)id delegateController;

@end
