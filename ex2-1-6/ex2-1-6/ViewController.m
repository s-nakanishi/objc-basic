//
//  ViewController.m
//  ex2-1-6
//
//  Created by ITユーザー on 2016/12/21.
//  Copyright © 2016年 ITユーザー. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property UIAlertController *alert;
@property UIAlertController *actionSheet;
@property (weak, nonatomic) IBOutlet UIWebView *webV;
- (IBAction)onTap:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  // アラートダイアログの作成
  self.alert = [UIAlertController alertControllerWithTitle:@"ネットワークエラー"
                                                   message:@"ネットワークに接続できません。"
                                            preferredStyle:UIAlertControllerStyleAlert];
  
  UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                               style:UIAlertActionStyleDefault
                                             handler:^(UIAlertAction *action) {
                                               NSLog(@"clicked OK Button");
                                             }];
  [self.alert addAction:ok];

  // アクションシートの作成
  self.actionSheet = [UIAlertController alertControllerWithTitle:@"メニュー"
                                                         message:@""
                                                  preferredStyle:UIAlertControllerStyleActionSheet];
  
  UIAlertAction *goBack = [UIAlertAction actionWithTitle:@"GoBack"
                                                   style:UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction *action) {
                                                   NSLog(@"selected GoBack");
                                                   [self.webV goBack];
                                                 }];
  [self.actionSheet addAction:goBack];
  
  UIAlertAction *goForward= [UIAlertAction actionWithTitle:@"GoForward"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction *action) {
                                                     NSLog(@"selected GoForward");
                                                     [self.webV goForward];
                                                   }];
  [self.actionSheet addAction:goForward];
  
  UIAlertAction *reload = [UIAlertAction actionWithTitle:@"Reload"
                                                   style:UIAlertActionStyleDefault
                                                 handler:^(UIAlertAction *action) {
                                                   NSLog(@"selected Reload");
                                                   [self.webV reload];
                                                 }];
  [self.actionSheet addAction:reload];

  // Webの初期ロード
  NSString* urlString = @"https://google.com";
  NSURL* googleURL = [NSURL URLWithString: urlString];
  NSURLRequest* request = [NSURLRequest requestWithURL: googleURL];
  [self.webV loadRequest:request];
  self.webV.delegate = self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
  [self presentViewController:self.actionSheet
                     animated:YES
                   completion:^{
                   }];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
  if ([error code] != NSURLErrorCancelled) {
    [self presentViewController:self.alert
                       animated:YES
                     completion:^{
                       NSLog(@"show Alert");
                     }];
  }
}
@end
