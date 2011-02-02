    //
//  MediaViewController.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MediaViewController.h"


@implementation MediaViewController

@synthesize webView,
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
	NSString* urlString = @"http://m.youtube.com/#/profile?desktop_uri=%2Fuser%2Fignitefc&sort=p&channel_id=0&ytsession=%7B%7D&user=ignitefc&start=0&gl=US&bmb=1";
	if(1 == self.typeSegmentedControl.selectedSegmentIndex) {
		urlString = @"http://m.flickr.com/#/search/advanced_QM_q_IS_ignite+fort+collins_AND_ss_IS_0_AND_mt_IS_all_AND_w_IS_all";
	}
	NSURL* url = [NSURL URLWithString:urlString];
	NSURLRequest* request = [NSURLRequest requestWithURL:url];
	[self.webView setAllowsInlineMediaPlayback:YES];
	[self.webView loadRequest:request];
	
}

#pragma mark -

-(IBAction)refreshWebView:(id)sender {
	[self.webView reload];
}

-(IBAction)openSafari:(id)sender{
	NSURL *actionUrl = [[self.webView request] URL];
	[[UIApplication sharedApplication] openURL:actionUrl];		
}

-(IBAction)goForward:(id)sender{
	[self.webView goForward];
}

-(IBAction)goBack:(id)sender{
	[self.webView goBack];
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
	dlog(@"enter");
	[self.activityIndicator stopAnimating];
	if(!self.webView.canGoBack) {
		[self.backButton setEnabled:NO];
	} else {
		[self.backButton setEnabled:YES];
	}
	
	if(!self.webView.canGoForward) {
		[self.forwardButton setEnabled:NO];
	} else {
		[self.forwardButton setEnabled:YES];
	}
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
