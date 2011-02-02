    //
//  SparksViewController.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SparksViewController.h"


@implementation SparksViewController

@synthesize igniteSparks;
@synthesize sparksTableView;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.igniteSparks = [NSArray arrayWithObjects:
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
						 nil];
}

#pragma mark -
#pragma mark Table View Methods


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return @"Sparks";
}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 70;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	dlog(@"enter");
	return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    dlog(@"enter");
    return [self.igniteSparks count];
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
	cell.textLabel.text = [self.igniteSparks objectAtIndex:indexPath.row];
	cell.textLabel.font = [UIFont systemFontOfSize:12];
	cell.textLabel.numberOfLines = 3;
	cell.textLabel.lineBreakMode = UILineBreakModeWordWrap;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
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
