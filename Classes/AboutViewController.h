//
//  SparksViewController.h
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AboutViewController : UIViewController <UIWebViewDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWebView *myWebView;

-(IBAction)close:(id)sender;

@end
