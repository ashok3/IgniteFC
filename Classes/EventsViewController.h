//
//  EventsViewController.h
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EventsViewController : UIViewController <UITableViewDelegate> {

}

@property (nonatomic, retain) NSArray *igniteEvents;

@property (nonatomic, retain) IBOutlet UITableView *eventsTableView;

@end
