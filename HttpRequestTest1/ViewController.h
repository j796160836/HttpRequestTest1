//
//  ViewController.h
//  HttpRequestTest1
//
//  Created by Johnny on 12/3/8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// http://www.01-labor.com/2011/07/nsurlconnectionhttp.html
// http://stm237.iteye.com/blog/1005752
//在iPhone上建立HTTP連線(GET/POST)

@interface ViewController : UIViewController
{
    NSMutableData *responseData;
}

// 開始接收資料，會呼叫此方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
// 接收新的資料時，會呼叫此方法
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
// 下載完畢時，會呼叫此方法
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;
// 連線錯誤時，會呼叫此方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

- (IBAction)request_btn_onclick:(id)sender;
- (IBAction)request2_btn_onclick:(id)sender;

@property (retain, nonatomic) IBOutlet UILabel *label;


@end
