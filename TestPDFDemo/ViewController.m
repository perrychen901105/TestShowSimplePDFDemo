//
//  ViewController.m
//  TestPDFDemo
//
//  Created by chenzhipeng on 5/31/15.
//  Copyright (c) 2015 perry. All rights reserved.
//

#import "ViewController.h"
#import "ShowPDFViewController.h"
@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webViewContent;
@property (nonatomic, strong) NSString *strPDFlink;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSURL *targetURL = [NSURL URLWithString:@"http://m.earthwerks.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [self.webViewContent loadRequest:request];
    
    
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
//    NSURL *targetURL = [NSURL fileURLWithPath:path];
//    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
//    [self.webViewContent loadRequest:request];

    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.earthwerks.com//media/Rapid-AccuClic_Install_Long.pdf"]];
 
  
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.relativeString hasSuffix:@".pdf"]) {
        self.strPDFlink = request.URL.relativeString;
//        [self performSegueWithIdentifier:@"segueShowPDF" sender:nil];
        [[UIApplication sharedApplication] openURL:request.URL];
        return NO;
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"segueShowPDF"]) {
        ShowPDFViewController *vcShowPDF = segue.destinationViewController;
        vcShowPDF.strPDFlink = self.strPDFlink;
    }
}

@end
