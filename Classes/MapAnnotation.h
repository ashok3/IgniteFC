//
//  MapAnnotation.h
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D _coordinate;
	NSString *_title;
	NSString *_subtitle;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title;

@end
