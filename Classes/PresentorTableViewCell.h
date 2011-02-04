//
//  PresentorTableViewCell.h
//  IgniteFC
//
//  Created by Steve Tranby on 2/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PresentorTableViewCell : UITableViewCell {

}

@property (nonatomic, retain) NSString *websiteUrlString;
@property (nonatomic, retain) NSString *twitterHandle;
@property (nonatomic, retain) IBOutlet UILabel *authorNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UIButton *websiteLinkButton;
@property (nonatomic, retain) IBOutlet UIButton *twitterLinkButton;

@property (nonatomic, retain) IBOutlet UIImageView *imageView;

-(IBAction)gotoWebsite:(id)sender;
-(IBAction)gotoTwitter:(id)sender;

@end
