//
//  FirstViewController.h
//  IgniteUs
//
//  Created by Steve Tranby on 1/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GData.h"

@interface VideoListViewController : UIViewController {
}

@property (nonatomic, retain) GDataFeedYouTubeVideo *feed;
@property (nonatomic, retain) IBOutlet UITableView *entriesTableView;

@end
