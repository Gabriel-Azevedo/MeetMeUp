//
//  WebViewController.m
//  MeetMeUp
//
//  Created by Gabriel Borri de Azevedo on 1/19/15.
//  Copyright (c) 2015 Gabriel Enterprises. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
}




@end
