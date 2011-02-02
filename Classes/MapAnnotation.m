//
//  MapAnnotation.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapAnnotation.h"


@implementation MapAnnotation

-(id)initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString*)title {
	if(self = [super init]) {
		_coordinate = coordinate;
		_title = title;
		_subtitle = @"sub";
	}
	return self;
}

-(CLLocationCoordinate2D)coordinate {
	return _coordinate;
}

-(NSString *)title {
	return _title;
}

-(NSString *)subtitle {
	return @"";//_subtitle;
}

@end
