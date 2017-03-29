//
//  HZHttpRequest.m
//  Copyright (c) 2014年 ShangchaoGao. All rights reserved.
//

#import "HZHttpRequest.h"
#import "UIUtils.h"




@implementation HZHttpRequest

#pragma mar
- (void)requestWithJSONString:(NSDictionary *)dic URLClass:(NSString*)urlClass Method:(NSString *)method HUDAddToView:(UIView *)toView HUDLabelText:(NSString *)text  FinishCallbackBlock:(void (^)(NSString *))block;
{
    
    _methodStr = method;
    
    _keyArr = [[NSMutableArray alloc]initWithArray:dic.allKeys];
    _valueArr = [[NSMutableArray alloc ]initWithArray:dic.allValues];
     self.finishCallbackBlock = block;
    //判断网络
    BOOL isExistNetWork  = [UIUtils isConnectionAvailable];
    if(!isExistNetWork)
    {
        
       
        if(self.failedBlock){
            self.failedBlock(@"1");
        }
        [self returnBackBlock];
        return;
    }
    if (toView != nil) {
        self.HUDAddToView = toView;
        self.HUDLabelText = text;
    }

    
    
    
    NSString*forepartsoap = [NSString stringWithFormat:@"<v:Envelope xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\" xmlns:c=\"http://www.w3.org/2003/05/soap-encoding\" xmlns:v=\"http://www.w3.org/2003/05/soap-envelope\"><v:Header /><v:Body><%@ xmlns=\"http://IP/haiergc/Service/\" id=\"o0\" c:root=\"1\">",method];
    NSString*betweensoap =@"";
    for (int i = 0; i< _keyArr.count; i++) {
    NSString*soap=[NSString stringWithFormat:@"<%@ i:type=\"d:string\">%@</%@>",_keyArr[i],_valueArr[i],_keyArr[i]];
        betweensoap = [betweensoap stringByAppendingString:soap];
    }
 
  NSString*backendsoap=[NSString stringWithFormat:@"</%@></v:Body></v:Envelope>",method];
//    NSString *soapMessage = [NSString stringWithFormat:
//                             @"<v:Envelope xmlns:i=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:d=\"http://www.w3.org/2001/XMLSchema\" xmlns:c=\"http://www.w3.org/2003/05/soap-encoding\" xmlns:v=\"http://www.w3.org/2003/05/soap-envelope\"><v:Header /><v:Body><getModuleFunList xmlns=\"http://IP/haiergc/Service/\" id=\"o0\" c:root=\"1\"><username i:type=\"d:string\">01072541</username><password i:type=\"d:string\">haier!123</password></getModuleFunList></v:Body></v:Envelope>"];
//    
 NSString *soapMessage = [NSString stringWithFormat:@"%@%@%@",forepartsoap,betweensoap,backendsoap];
    
    NSURL *url;
    
    if ([urlClass isEqualToString:@"WGG"]) {
//       url  = [NSURL URLWithString:TheHouseEstateWebService];
    }
else if ([urlClass isEqualToString:@"IU"])
{

//  url = [NSURL URLWithString:TheHouseEstateWebServiceelse];
}
    else
    {
        NSLog(@"网址类型错误");
    
    }
     // 接口
    // 生成Request请求对象（并设置它的缓存协议、网络请求超时配置）
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"]; // 设置为post请求
    [request addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//    [request addValue: @"image/jpeg; charset=binary" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; // 设置请求参数
    // 执行请求连接
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    NSLog(connection ? @"连接创建成功" : @"连接创建失败");
    if (connection) {
        [connection start];
        // 活动指示器
        if (self.HUDAddToView != nil) {
            _progressHUD = [MBProgressHUD showHUDAddedTo:self.HUDAddToView animated:YES];
            _progressHUD.labelText = self.HUDLabelText;
        }
    }else {
        [connection cancel];
    }
}








#pragma mark NSURLConnectionDeleagte
/**
 * 接收到服务器回应的时回调
 */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // 初始化NSMutableData对象（用于保存执行结果）
    if(!_resultData){
        _resultData = [[NSMutableData alloc] init];
    }else{
        [_resultData setLength:0];
    }
}
/*
 * 接收到服务器传输数据的时候调用，此方法根据数据大小执行若干次
 */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_resultData appendData:data]; // 追加结果
}
/**
 * 数据传完之后调用此方法
 */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //开始解析xml
    [_progressHUD hide:YES];
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData: _resultData];
    

   // NSLog(@"kakan=%@",[[NSString alloc]initWithData:_resultData encoding:NSUTF8StringEncoding]);


    
    [xmlParser setDelegate:self];
    [xmlParser setShouldResolveExternalEntities: YES];
    [xmlParser parse];
    xmlParser = nil;
}
/**
 * 网络请求过程中，出现任何错误（断网，连接超时等）会进入此方法
 */
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
   // NSLog(@"KKKKKKKKKKKKKK%@",error);
    if (self.HUDAddToView) {
        [_progressHUD removeFromSuperview];
        [MBProgressHUD hideHUDForView:self.HUDAddToView animated:YES]; //隐藏活动指示图
//        NSLog(@"network error: %@\n", [error localizedDescription]);
        [UIUtils addRemindInformationWithText:@"网络请求中断" FontSize:14 ToView:self.HUDAddToView];
        //        //3秒后会返回block
        [self performSelector:@selector(returnBackBlock) withObject:nil afterDelay:3.0f];
        if(self.failedBlock){
            
            self.failedBlock(@"1");
        }
    }
}

- (void)returnBackBlock
{
    if (self.finishCallbackBlock) { // 如果设置了回调的block，直接调用
        self.finishCallbackBlock(nil);
    }
}

#pragma mark -
#pragma mark xml解析

//遇到一个开始标签时触发
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:[NSString stringWithFormat:@"%@Result",_methodStr]]) {
        _backContent = nil;
        _backContent = [NSMutableString string];
    }
}

//文档出错时触发
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"parseErrorOccurred %@\n",parseError);
}

//遇到字符串时触发
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (_backContent) {
        [_backContent appendString:string];
    }
}

//遇到结束标签时触发
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:[NSString stringWithFormat:@"%@Result",_methodStr]]) {
        if (self.finishCallbackBlock) { // 如果设置了回调的block，直接调用
            self.finishCallbackBlock(_backContent);
        }
        if (self.HUDAddToView) {
            [_progressHUD removeFromSuperview];
            [MBProgressHUD hideHUDForView:self.HUDAddToView animated:YES]; //隐藏活动指示图
        }
    }
}
//遇到文档结束时触发
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    _backContent = nil;
}

@end




