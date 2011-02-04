//
//  SparksViewController.m
//  IgniteFC
//
//  Created by Steve Tranby on 2/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutViewController.h"
#import "IgniteUsAppDelegate.h"

@implementation AboutViewController

@synthesize myWebView;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSString*	version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
	NSString *urlString = [[NSBundle mainBundle] pathForResource:@"about" ofType:@"html"];
	NSURL *url = [NSURL fileURLWithPath:urlString isDirectory:NO];
	NSString *html= [NSString stringWithContentsOfURL:url encoding:NSASCIIStringEncoding error:nil];
	[self.myWebView loadHTMLString:[NSString stringWithFormat:html, version] baseURL:nil];
	
}

#pragma mark -

-(IBAction)close:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

#pragma mark -

-(BOOL)webView:(UIWebView *)inWeb shouldStartLoadWithRequest:(NSURLRequest *)inRequest navigationType:(UIWebViewNavigationType)inType {
	dlog(@"%@", [[inRequest URL] absoluteString]);
    if([[[inRequest URL] absoluteString] isEqual:@"http://stevetranby.com/ignitefc/"]) {
		[[UIApplication sharedApplication] openURL:[inRequest URL]];
		return NO;
	}
	return YES;
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
