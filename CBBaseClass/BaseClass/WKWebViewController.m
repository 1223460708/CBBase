//
//  WKWebViewController.m
//  Yunmafu
//
//  Created by 炳神 on 2017/2/16.
//  Copyright © 2017年 wanglele. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
@interface WKWebViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
{
    NSString *_url;
    NSString *_title;
}
@property (nonatomic,strong) WKWebView *wkWebView;

@end

@implementation WKWebViewController

- (void)dealloc{
    [NotificationCenter removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self createNav];
    if ([_title isEqualToString:@"二维码收款"]) {
        [NotificationCenter addObserver:self selector:@selector(noTakePhoto) name:UIApplicationUserDidTakeScreenshotNotification object:nil];
        
    }
}

- (void)noTakePhoto{
    WLGetWeakSelf(weak, self);
    [[YMFWalletHttpRequestManager shareYMFWalletHttpRequestManager] appPayCancelWith:@{@"orderNo":WLStringValue(weak.orderNo)} onSuccess:^(NSDictionary *resultDict) {} onFailed:^(NSString *errorMsg, NSInteger code) {}];
    [UIAlertController wl_showAlertViewWithActionsName:@[@"确定"] title:@"温馨提示" message:@"该码仅用于收款，请不要发给他人！！！" callBack:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [NotificationCenter removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createdWkWebView];
}

- (void)createNav{
    self.navigationController.navigationBar.wl_bgColor = self.navColor?:NaviColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_btn_Return_black"] style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.title = _title;
//    self.automaticallyAdjustsScrollViewInsets =

}

- (void)rightClick{
    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count>1) {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self) {
            //push方式
             [self popTheVC];
        }
    }
    else{
        //present方式
        [self dismissViewControllerAnimated:YES completion:^{
            
            
        }];
    }
}
- (void)createdWkWebView{
    
    _wkWebView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    _wkWebView.UIDelegate = self;
    _wkWebView.navigationDelegate = self;
    _wkWebView.scrollView.scrollEnabled = !self.noScroll;
    [self.view addSubview:_wkWebView];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_url]];
    [request setHTTPMethod:@"POST"];
    if ([YMFUserInfoModel shareYMFUserInfoModel].userId.length) {
        [request setValue:[YMFUserInfoModel shareYMFUserInfoModel].userId forHTTPHeaderField:@"userId"];
    }
    if ([YMFUserInfoModel shareYMFUserInfoModel].merId.length) {
        [request setValue:[YMFUserInfoModel shareYMFUserInfoModel].userId forHTTPHeaderField:@"merId"];
    }
    if ([YMFLoginModel shareYMFLoginModel].token.length) {
        [request setValue:[YMFLoginModel shareYMFLoginModel].token forHTTPHeaderField:@"token"];
        [request setValue:[[KeychainUUID alloc] readUUID] forHTTPHeaderField:@"device"];
    }
    [request setValue:@"ios" forHTTPHeaderField:@"deviceType"];
    [request setValue:WLCurrentAppVersion forHTTPHeaderField:@"currentVersion"];
    [request setValue:instId forHTTPHeaderField:@"instId"];
    [request setValue:agentNo forHTTPHeaderField:@"agentNo"];
    [request setValue:appleId forHTTPHeaderField:@"innerAppId"];

    [_wkWebView loadRequest:request];
}


/**
 *  页面开始加载时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
}

/**
 *  当内容开始返回时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
}

/**
 *  页面加载完成之后调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

/**
 *  加载失败时调用
 *
 *  @param webView    实现该代理的webview
 *  @param navigation 当前navigation
 *  @param error      错误
 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
}

/**
 *  接收到服务器跳转请求之后调用
 *
 *  @param webView      实现该代理的webview
 *  @param navigation   当前navigation
 */
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
}

/**
 *  在收到响应后，决定是否跳转
 *
 *  @param webView            实现该代理的webview
 *  @param navigationResponse 当前navigation
 *  @param decisionHandler    是否跳转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    // 允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
}

/**
 *  在发送请求之前，决定是否跳转
 *
 *  @param webView          实现该代理的webview
 *  @param navigationAction 当前navigation
 *  @param decisionHandler  是否调转block
 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
}


- (void)setWkWebTitle:(NSString *)wkWebTitle{
    _title = wkWebTitle;
}
- (void)setWkWebUrlStr:(NSString *)wkWebUrlStr{
    _url = wkWebUrlStr;
}

@end
