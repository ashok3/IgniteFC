//
//  InfoViewController.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "InfoViewController.h"
#import "AboutViewController.h"
#import "MapAnnotation.h"

@implementation InfoViewController

@synthesize mapView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	MKCoordinateRegion region = { {40.553909, -105.091411 }, { 0.003, 0.003 } };
	[self.mapView setCenterCoordinate:region.center animated:NO];
	[self.mapView setRegion:region animated:NO];
	
	MapAnnotation *annotation = [[[MapAnnotation alloc] initWithCoordinate:region.center title:@"View In Google Maps"] autorelease];
	[self.mapView addAnnotation:annotation];
}
//*/

#pragma mark -

-(IBAction)showAbout:(id)sender {
	AboutViewController *vc = [[AboutViewController alloc] initWithNibName:@"AboutView" bundle:nil];
	[self presentModalViewController:vc animated:YES];
	[vc release];
}

#pragma mark -

-(void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

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

#pragma mark -
#pragma mark MKMapViewDelegate

- (void)showDetails:(id)sender {
	dlog(@"enter");
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://maps.google.com/maps?f=q&q=40.553867,-105.091413+(814+W+Drake+Rd,+Fort+Collins,+CO+80526,+USA)&ie=UTF8&t=h&z=14"]]
	;
}

- (MKAnnotationView *)mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>)annotation {
	
    // if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    // handle our two custom annotations
    if ([annotation isKindOfClass:[MapAnnotation class]])
    {
        // try to dequeue an existing pin view first
        static NSString* MapAnnotationIdentifier = @"mapAnnotationIdentifier";
        MKPinAnnotationView* pinView = (MKPinAnnotationView *)
		[mapView dequeueReusableAnnotationViewWithIdentifier:MapAnnotationIdentifier];
		
        if (!pinView)
        {
            // if an existing pin view was not available, create one
            MKPinAnnotationView* customPinView = [[[MKPinAnnotationView alloc]
												   initWithAnnotation:annotation reuseIdentifier:MapAnnotationIdentifier] autorelease];
            customPinView.pinColor = MKPinAnnotationColorPurple;
            customPinView.animatesDrop = YES;
            customPinView.canShowCallout = YES;
            
            // add a detail disclosure button to the callout which will open a new view controller page
            //
            // note: you can assign a specific call out accessory view, or as MKMapViewDelegate you can implement:
            //  - (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
            //
            UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            [rightButton addTarget:self
                            action:@selector(showDetails:)
                  forControlEvents:UIControlEventTouchUpInside];
            customPinView.rightCalloutAccessoryView = rightButton;
			
            return customPinView;
        }
        else
        {
            pinView.annotation = annotation;
        }
        return pinView;
    }
	
	return nil;
}

@end
