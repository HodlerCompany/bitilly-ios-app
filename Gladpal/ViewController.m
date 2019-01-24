//
//  ViewController.m
//  Gladpal
//
//  Created by Ahmad on 05/06/2016.
//  Copyright © 2016 Ahmad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webViewsss;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webViewsss.delegate = self;
    NSURL *url = [NSURL URLWithString:@"https://bitilly.com"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webViewsss loadRequest:requestObj];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma  mark -- UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    [self.activityIndicator startAnimating];
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
//    NSString *js = @"var menus = document.getElementsByClassName('footer-bottom-wrap');"
//    "for (var i = 0; i < menus.length; i++) {"
//    "menus[i].style.display = 'none';"
//    "}";
//    [self->_webViewsss stringByEvaluatingJavaScriptFromString:js];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.activityIndicator stopAnimating];
    self.activityIndicator.hidden = YES;
}
- (IBAction)back:(id)sender {
    [_webViewsss goBack];
}
- (IBAction)home:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://unitedsuccessnetwork.com/members/"];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webViewsss loadRequest:requestObj];
}
- (IBAction)forward:(id)sender {
    [_webViewsss goForward];
}



@end
