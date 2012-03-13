//
//  ViewController.m
//  HttpRequestTest1
//
//  Created by Johnny on 12/3/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize label;



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}



#pragma mark - Connection delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // 開始下載，重置responseData資料
    NSLog(@"didReceiveResponse");
    [responseData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // 下載中，附加資料
    [responseData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 下載完成，釋放responseData
    [connection release];
    NSLog (@"succeeded  %d byte received", [responseData length]); 
    // 轉譯編碼文字
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    [responseData release];
    
    label.text =  responseString;
    [responseString release];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // 下載錯誤
    label.text = [NSString stringWithFormat:@"Connection failed: %@",[error description]];
    NSLog(@"Connection failed! Error - %@ %@", 
          [error localizedDescription], 
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (IBAction)request_btn_onclick:(id)sender {
    
    responseData = [[NSMutableData data] retain];
    NSString *url = [NSString stringWithFormat:@"http://127.0.0.1/httptest/t.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url ]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
}

- (IBAction)request2_btn_onclick:(id)sender {
    responseData = [[NSMutableData data] retain];
    NSString *url = [NSString stringWithFormat:@"http://127.0.0.1/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url ]];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
}




#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    //    
    //    NSString *str = @"http://my_server/get.php?name=brian&gender=male";
    //    //網址編碼
    //    NSString *str_enc = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //    // 使用NSURL物件
    //    NSURL *url = [[NSURL URLWithString:str_enc] retain];
    //    
    //    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    //    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    //    
	// Do any additional setup after loading the view, typically from a nib.
}








- (void)viewDidUnload
{
    [self setLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [label release];
    [super dealloc];
}
@end
