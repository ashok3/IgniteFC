//
//  TwitterViewController.h
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TwitterViewController : UIViewController <UIWebViewDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UISegmentedControl *twitterTypeSegmentedControl;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (nonatomic, retain) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *forwardButton;

-(IBAction)loadSelectedPage;

-(IBAction)refreshWebView:(id)sender;
-(IBAction)openSafari:(id)sender;
-(IBAction)goForward:(id)sender;
-(IBAction)goBack:(id)sender;

@end
