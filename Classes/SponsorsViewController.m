//
//  SponsorsViewController.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SponsorsViewController.h"
#import "CJSONDeserializer.h"
#import "UIImage-Extensions.h"
#import "UIImageView+WebCache.h"

@implementation SponsorsViewController

@synthesize premierSponsorsDict,
majorSponsorsDict,
associateSponsorsDict,
inkindSponsorsDict,
beerSponsorsDict,
myTableView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	dlog(@"enter");
	@try {
		NSString *urlString = @"http://stevetranby.com/ignitefc/sponsors.json";
		dlog(@"urlString = %@", urlString);
		NSURL *url = [NSURL URLWithString:urlString];
		dlog(@"url = %@", url);
		NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
		dlog(@"jsonstring = %@", jsonString);
		NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
		NSDictionary *jsonDict = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:nil];
		
		self.premierSponsorsDict = [jsonDict objectForKey:@"premier-sponsors"];
		self.majorSponsorsDict = [jsonDict objectForKey:@"major-sponsors"];
		self.associateSponsorsDict = [jsonDict objectForKey:@"associate-sponsors"];
		self.inkindSponsorsDict = [jsonDict objectForKey:@"inkind-sponsors"];
		self.beerSponsorsDict = [jsonDict objectForKey:@"beer-sponsors"];
		
	} @catch (NSException *e) {
		
	}
}

#pragma mark -
#pragma mark Table View Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	dlog(@"enter");
	return kNumSections;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *t = 0;
	switch (section) {
		case kPremierSection:
			t = @"Premier Sponsor(s)";
			break;
		case kMajorSection:
			t = @"Major Sponsor(s)";
			break;
		case kAssociateSection:
			t = @"Associate Sponsor(s)";
			break;
		case kInkindSection:
			t = @"In-Kind Sponsor(s)";
			break;
		case kBeerSection:
			t = @"Beer Sponsor(s)";
			break;
		default:
			break;
	}
	return t;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	return @"";
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    dlog(@"enter");
	NSInteger rows = 0;
	switch (section) {
		case kPremierSection:
			rows = [self.premierSponsorsDict count];
			break;
		case kMajorSection:
			rows = [self.majorSponsorsDict count];
			break;
		case kAssociateSection:
			rows = [self.associateSponsorsDict count];
			break;
		case kInkindSection:
			rows = [self.inkindSponsorsDict count];
			break;
		case kBeerSection:
			rows = [self.beerSponsorsDict count];
			break;
		default:
			break;
	}
	return rows;
}



// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    dlog(@"enter");
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell.
	NSDictionary *dict;
	switch (indexPath.section) {
		case kPremierSection:
			dict = [self.premierSponsorsDict objectAtIndex:indexPath.row];
			break;
		case kMajorSection:
			dict = [self.majorSponsorsDict objectAtIndex:indexPath.row];
			break;
		case kAssociateSection:
			dict = [self.associateSponsorsDict objectAtIndex:indexPath.row];
			break;
		case kInkindSection:
			dict = [self.inkindSponsorsDict objectAtIndex:indexPath.row];
			break;
		case kBeerSection:
			dict = [self.beerSponsorsDict objectAtIndex:indexPath.row];
			break;
		default:
			break;
	}
	
	cell.textLabel.text = [dict objectForKey:@"name"];
	//cell.textLabel.frame = CGRectMake(50, 0, 200, 30);
	cell.detailTextLabel.text =[dict objectForKey:@"website"];
	//cell.detailTextLabel.frame = CGRectMake(50, 0, 200, 20);
	
	NSString *logoUrl = [dict objectForKey:@"logo"];
	[cell.imageView setImageWithURL:[NSURL URLWithString:logoUrl]
				   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
	
	/*
	 dlog(@"logo: %@", logoUrl);
	NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:logoUrl]];
	UIImage *theImage = [UIImage imageWithData:data];
	cell.imageView.image = [theImage imageByScalingProportionallyToSize:CGSizeMake(40, 40)];
	*/
	
	//cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Configure the cell.
	NSDictionary *dict;
	switch (indexPath.section) {
		case kPremierSection:
			dict = [self.premierSponsorsDict objectAtIndex:indexPath.row];
			break;
		case kMajorSection:
			dict = [self.majorSponsorsDict objectAtIndex:indexPath.row];
			break;
		case kAssociateSection:
			dict = [self.associateSponsorsDict objectAtIndex:indexPath.row];
			break;
		case kInkindSection:
			dict = [self.inkindSponsorsDict objectAtIndex:indexPath.row];
			break;
		case kBeerSection:
			dict = [self.beerSponsorsDict objectAtIndex:indexPath.row];
			break;
		default:
			break;
	}
	
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[dict objectForKey:@"website"]]];
}



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
