//
//  ShowPDFViewController.m
//  TestPDFDemo
//
//  Created by chenzhipeng on 5/31/15.
//  Copyright (c) 2015 perry. All rights reserved.
//

#import "ShowPDFViewController.h"

@interface ShowPDFViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webViewShowPDF;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityLoad;

@end

@implementation ShowPDFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *targetURL = [NSURL URLWithString:self.strPDFlink];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [self.webViewShowPDF loadRequest:request];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.webViewShowPDF stopLoading];
    self.webViewShowPDF.delegate = nil;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.activityLoad startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.activityLoad stopAnimating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
