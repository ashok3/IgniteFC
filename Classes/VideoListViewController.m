//
//  FirstViewController.m
//  IgniteUs
//
//  Created by Steve Tranby on 1/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "VideoListViewController.h"

@interface VideoListViewController (PrivateMethods)
- (GDataServiceGoogleYouTube *)youTubeService;
@end


@implementation VideoListViewController

@synthesize feed,
entriesTableView;

- (void)viewDidLoad {
	NSLog(@"loading");
	
	GDataServiceGoogleYouTube *service = [self youTubeService];
	
	NSString *uploadsID = kGDataYouTubeUserFeedIDUploads;
	NSURL *feedURL = [GDataServiceGoogleYouTube youTubeURLForUserID:@"ignitefc"
														 userFeedID:uploadsID];
	
	[service fetchFeedWithURL:feedURL
					 delegate:self
			didFinishSelector:@selector(request:finishedWithFeed:error:)];
	
    [super viewDidLoad];	
}

- (void)request:(GDataServiceTicket *)ticket finishedWithFeed:(GDataFeedBase *)aFeed
		  error:(NSError *)error {
	
	self.feed = (GDataFeedYouTubeVideo *)aFeed;
	[self.entriesTableView reloadData];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[feed entries] count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	GDataEntryBase *entry = [[feed entries] objectAtIndex:indexPath.row];
	cell.textLabel.text = [[entry title] stringValue];
	
	NSLog(@"%@", [entry XMLElement]);
	
	if ([entry isKindOfClass: [GDataEntryYouTubeVideo class]]) { 
		GDataEntryYouTubeVideo *video = (GDataEntryYouTubeVideo *)entry;
		if ([video respondsToSelector: @selector(mediaGroup)]) { 
			GDataYouTubeMediaGroup *mgroup = (GDataYouTubeMediaGroup *)[video mediaGroup];
			GDataMediaThumbnail *thumbnail = [mgroup highQualityThumbnail];			
			
			NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[thumbnail URLString]]];
			cell.imageView.image = [UIImage imageWithData:data];
		} 
	} 
	
    return cell;
}


- (void)dealloc {
    [super dealloc];
}


- (GDataServiceGoogleYouTube *)youTubeService {
	static GDataServiceGoogleYouTube* _service = nil;
	
	if (!_service) {
		_service = [[GDataServiceGoogleYouTube alloc] init];
		
		[_service setUserAgent:@"AppWhirl-UserApp-1.0"];
		[_service setShouldCacheDatedData:YES];
		[_service setServiceShouldFollowNextLinks:YES];
	}
	
	// fetch unauthenticated
	[_service setUserCredentialsWithUsername:nil
									password:nil];
	
	return _service;
}


@end
