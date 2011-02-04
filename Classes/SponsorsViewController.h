//
//  SponsorsViewController.h
//  IgniteFC
//
//  Created by Steve Tranby on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	kPremierSection,
	kMajorSection,
	kAssociateSection,
	kInkindSection,
	kBeerSection,
	kNumSections
} SponsorTableSections;

@interface SponsorsViewController : UIViewController {

}

@property (nonatomic, retain) NSArray *premierSponsorsDict;
@property (nonatomic, retain) NSArray *majorSponsorsDict;
@property (nonatomic, retain) NSArray *associateSponsorsDict;
@property (nonatomic, retain) NSArray *inkindSponsorsDict;
@property (nonatomic, retain) NSArray *beerSponsorsDict;
@property (nonatomic, retain) IBOutlet UITableView *myTableView;

@end
