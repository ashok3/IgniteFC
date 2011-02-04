//
//  EventsViewController.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EventsViewController.h"
#import "PresentorTableViewCell.h"
#import "CJSONDeserializer.h"
#import "UIImage-Extensions.h"
#import "UIImageView+WebCache.h"

@implementation EventsViewController

@synthesize igniteEventSparks;
@synthesize eventsTableView;
@synthesize igniteEventTitles;
@synthesize tableArrayOfDicts,
tblCell;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	@try {
		NSString *urlString = @"http://stevetranby.com/ignitefc/events.json";
		dlog(@"urlString = %@", urlString);
		NSURL *url = [NSURL URLWithString:urlString];
		dlog(@"url = %@", url);
		NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
		dlog(@"jsonstring = %@", jsonString);
		NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
		NSDictionary *jsonDict = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:nil];
		NSArray *jsonArrayOfDicts = [jsonDict objectForKey:@"sparks"];
		dlog(@"%@", jsonArrayOfDicts);
		for(NSDictionary *dict in jsonArrayOfDicts) {
			dlog(@"dict object = %@, %@, %@", [dict objectForKey:@"name"], [dict objectForKey:@"website"], [dict objectForKey:@"logo"]);
		}
		self.tableArrayOfDicts = jsonArrayOfDicts;
	} @catch (NSException *e) {
		
	}
	
	self.igniteEventTitles = [NSArray arrayWithObjects:
							  @"Ignite Fort Collins #7",
							  @"Ignite Fort Collins #6",
							  @"Ignite Fort Collins #5",
							  @"Ignite Fort Collins #4",
							  @"Ignite Fort Collins #3",
							  @"Ignite Fort Collins #2",
							  @"Ignite Fort Collins #1",
							  nil];
	
	self.igniteEventSparks = [NSDictionary dictionaryWithObjectsAndKeys:
							  [NSArray arrayWithObjects:
							   @"What I Learned About Leadership by Climbing Rocks",
							   @"We Can Do This the Easy Way, or the Hard Way ...",
							   @"Horrible Negotiation Tips: How To Get Anything You Want By Playing Dirty Pool",
							   @"Zen and the Art of Race Car Driving",
							   @"The Privacy Myth",
							   @"Create More, Consume Less",
							   @"Avoiding Design Disaster (aka don't leave it up to a programmer!)",
							   @"The Calendar Conspiracy to seperate us from Natures cycle",
							   @"Are You A Highly Sensitive Person?",
							   @"Change - Making it Happen",
							   @"Nick Armstrong's Almanac: Amazing Semi-True Facts About Reality",
							   @"xperience+Knowledge=Wisdom",
							   @"Going Yard: Insiders guide to hosting FtC Foxes Baseball Players from the Alpha Mom's Perspective.",
							   @"Financial education and eaching the historical events that has lead to the current economic crisis",
							   nil],
							  @"Ignite Fort Collins #7",
							  [NSArray arrayWithObjects:
							   nil],
							  @"Ignite Fort Collins #6",
							  [NSArray arrayWithObjects:
							   nil],
							  @"Ignite Fort Collins #5",
							  [NSArray arrayWithObjects:
							   nil],
							  @"Ignite Fort Collins #4",
							  [NSArray arrayWithObjects:
							   nil],
							  @"Ignite Fort Collins #3",
							  [NSArray arrayWithObjects:
							   nil],
							  @"Ignite Fort Collins #2",
							  [NSArray arrayWithObjects:
							   nil],
							  @"Ignite Fort Collins #1",
							  nil];
}

#pragma mark -
#pragma mark Table View Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 80;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	dlog(@"enter");
	return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    dlog(@"enter");
	return [self.tableArrayOfDicts count];
}



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    dlog(@"enter");
    static NSString *CellIdentifier = @"Cell";
    
    PresentorTableViewCell *cell = (PresentorTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		[[NSBundle mainBundle] loadNibNamed:@"PresentorTableViewCell" owner:self options:nil];
		cell = self.tblCell;
    }
    
	// Configure the cell.
	NSDictionary *dict = [self.tableArrayOfDicts objectAtIndex:indexPath.row];
	NSString *theTitle =  [dict objectForKey:@"title"];
	//NSString *description =  [dict objectForKey:@"description"];
	NSString *author =  [dict objectForKey:@"author"];
	NSString *gravatarHash =  [dict objectForKey:@"gravatar"];
	NSString *twitterHandle = [dict objectForKey:@"twitter"];
	
	NSString *website =  [dict objectForKey:@"website"];
	
	if(author != nil) {
		cell.websiteUrlString = website;
		[cell.websiteLinkButton setTitle:author forState:UIControlStateNormal];
	}
	
	if(twitterHandle != nil) {
		cell.twitterHandle = twitterHandle;
		NSString *twitterName =  [NSString stringWithFormat:@"@%@", twitterHandle];
		[cell.twitterLinkButton setTitle:twitterName forState:UIControlStateNormal];
	}
	
	if(theTitle != nil) {
		cell.titleLabel.text = theTitle;
		cell.titleLabel.numberOfLines = 0;
		CGRect r = cell.titleLabel.frame;
		cell.titleLabel.frame = CGRectMake(r.origin.x, r.origin.y, r.size.width, 800);
		[cell.titleLabel sizeToFit];
	}
	
	if(gravatarHash != nil) {
		/*
		NSString *imgUrl = [NSString stringWithFormat:@"http://gravatar.com/avatar/%@", gravatarHash];
		dlog(@"gravatar: %@", imgUrl);
		NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgUrl]];
		if(data != nil) {
			UIImage *theImage = [UIImage imageWithData:data];
			cell.imageView.image = [theImage imageByScalingProportionallyToSize:CGSizeMake(40, 40)];
		}
		 */
		
		// CACHED Image Get
		NSString *imgUrl = [NSString stringWithFormat:@"http://gravatar.com/avatar/%@", gravatarHash];
		[cell.imageView setImageWithURL:[NSURL URLWithString:imgUrl]
					   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
	}
    return cell;
}



/*
 #pragma mark -
 #pragma mark Table View Methods
 
 - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 dlog(@"enter");
 return [self.igniteEventTitles count];
 }
 
 
 // Customize the number of rows in the table view.
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 dlog(@"enter");
 NSString *key = [self.igniteEventTitles objectAtIndex:section];
 dlog(@"key = %@", key);
 NSArray *sparks = (NSArray *)[self.igniteEventSparks objectForKey:key];
 return [sparks count];
 }
 
 - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
 dlog(@"");
 return [self.igniteEventTitles objectAtIndex:section];
 }
 
 
 // Customize the appearance of table view cells.
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 dlog(@"enter");
 static NSString *CellIdentifier = @"Cell";
 
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 if (cell == nil) {
 cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
 }
 
 // Configure the cell.
 NSString *key = [self.igniteEventTitles objectAtIndex:indexPath.section];
 dlog(@"key = %@", key);
 NSArray *sparks = (NSArray *)[self.igniteEventSparks objectForKey:key];
 cell.textLabel.text = (NSString *)[sparks objectAtIndex:indexPath.row];
 cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
 return cell;
 }
 */


#pragma mark -

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	[super viewDidUnload];
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[super dealloc];
}


@end
