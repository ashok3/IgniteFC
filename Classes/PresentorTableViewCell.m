//
//  PresentorTableViewCell.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PresentorTableViewCell.h"


@implementation PresentorTableViewCell

@synthesize authorNameLabel;
@synthesize titleLabel;
@synthesize websiteLinkButton;
@synthesize twitterLinkButton;
@synthesize imageView,
websiteUrlString,
twitterHandle;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}

#pragma mark -

-(IBAction)gotoWebsite:(id)sender {
	dlog(@"enter");
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.websiteUrlString]];	
}

-(IBAction)gotoTwitter:(id)sender {
	dlog(@"enter");
	NSString *url = [NSString stringWithFormat:@"http://m.twitter.com/%@", self.twitterHandle];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}


#pragma mark -

- (void)dealloc {
    [super dealloc];
}


@end
