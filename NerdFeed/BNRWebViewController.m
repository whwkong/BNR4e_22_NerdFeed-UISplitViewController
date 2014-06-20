//
//  BNRWebViewController.m
//  NerdFeed
//
//  Created by William Kong on 2014-06-20.
//  Copyright (c) 2014 William Kong. All rights reserved.
//

#import "BNRWebViewController.h"

@implementation BNRWebViewController

#pragma mark -
- (void)loadView
{
    UIWebView *webView = [[UIWebView alloc] init];
    webView.scalesPageToFit = YES;
    
    self.view = webView;
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if (_URL) {
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}

@end
