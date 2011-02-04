//
//  MediaViewController.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MediaViewController.h"


@implementation MediaViewController

@synthesize myWebView,
activityIndicator,
typeSegmentedControl;

@synthesize backButton, forwardButton;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[self loadSelectedPage];
    [super viewDidLoad];
}
//*/

-(IBAction)loadSelectedPage {
	NSString* urlString = @"http://m.youtube.com/profile?gl=US&hl=en&user=IgniteFC&view=playlists";
	if(1 == self.typeSegmentedControl.selectedSegmentIndex) {
		urlString = @"http://m.flickr.com/#/search/advanced_QM_q_IS_ignitefc+OR+%22ignite+fort+collins%22_AND_ss_IS_1_AND_prefs_photos_IS_1_AND_mt_IS_all_AND_w_IS_all";
	}
	NSURL* url = [NSURL URLWithString:urlString];
	NSURLRequest* request = [NSURLRequest requestWithURL:url];
	[self.myWebView loadRequest:request];
}

#pragma mark -

-(IBAction)refreshWebView:(id)sender {
	[self.myWebView reload];
}

-(IBAction)openSafari:(id)sender{
	NSURL *actionUrl = [[self.myWebView request] URL];
	[[UIApplication sharedApplication] openURL:actionUrl];		
}

-(IBAction)goForward:(id)sender{
	[self.myWebView goForward];
}

-(IBAction)goBack:(id)sender{
	[self.myWebView goBack];
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	dlog(@"enter");
	return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	dlog(@"enter");
	[self.activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	dlog(@"enter b=%d, f=%d", webView.canGoBack, webView.canGoForward);
	[self.activityIndicator stopAnimating];
	/*
	 if(!webView.canGoBack) {
		[self.backButton setEnabled:NO];
	} else {
		[self.backButton setEnabled:YES];
	}
	
	if(!webView.canGoForward) {
		[self.forwardButton setEnabled:NO];
	} else {
		[self.forwardButton setEnabled:YES];
	}
*/
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	dlog(@"enter");
}


#pragma mark -


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

@end
