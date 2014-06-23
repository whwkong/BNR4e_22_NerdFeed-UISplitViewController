//
//  BNRWebViewController.m
//  NerdFeed
//
//  Created by William Kong on 2014-06-20.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRWebViewController.h"

@implementation BNRWebViewController

#pragma mark - View lifecycle
- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    
    self.view = webView;
}

#pragma mark - Accessors
- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

#pragma mark - UISplitViewControllerDelegate methods
- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    // if bar button item does not have a title, it will not appear at all
    barButtonItem.title = @"Courses";
    
    // take this bar button item and put it on the left side of nav item
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // remove bar button item from navigation item
    // double check that it is the correct button (insanity check)
    if (barButtonItem == self.navigationItem.leftBarButtonItem) {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

@end
