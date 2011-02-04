//
//  EventsViewController.h
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PresentorTableViewCell.h"

@interface EventsViewController : UIViewController <UITableViewDelegate> {

}

@property (nonatomic, retain) NSArray *igniteEventTitles;
@property (nonatomic, retain) NSDictionary *igniteEventSparks;

@property (nonatomic, retain) NSArray *tableArrayOfDicts;
//@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) IBOutlet UITableView *eventsTableView;
@property (nonatomic, retain) IBOutlet PresentorTableViewCell *tblCell;

@end
