//
//  InfoViewController.h
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface InfoViewController : UIViewController {

}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(IBAction)showAbout:(id)sender;

@end
