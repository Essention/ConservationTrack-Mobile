
//  Essention_iOS
//
//  Created by Oleksii on 10/29/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "SP.h"
#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "Parse.h"
#import "welcome.h"


@implementation SP 
@synthesize listArray;
// soap  ...  requests to SP server
-(NSMutableArray *)CheCkResult
{
   // while (!flagEndConnection) {
    //   [NSThread sleepForTimeInterval:0.06];
   // }
 //   AGWW_WAIT_WHILE(flagEndConnection,5);
    return resultList;
}
-(BOOL)FlagEnd{
    return flagEndConnection;
}
-(void) Get_GetList_Items{
    flagEndConnection=false;
    resultList =[[NSMutableArray alloc] init];
    nodeContent = [[NSMutableString alloc]init];
    
    NSMutableString *soapFormat = [NSMutableString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"> \n"
                                   "<soap:Body>\n"
                                   "<GetListItems xmlns=\"http://schemas.microsoft.com/sharepoint/soap/\">\n"
                                   "<listName>ios</listName>\n"
                                   "<viewFields>  <ViewFields><FieldRef Name='Title'/></ViewFields> </viewFields>\n"
                                   "</GetListItems>\n"
                                   "</soap:Body>\n"
                                   "</soap:Envelope>\n"];
    
  //  [soapFormat replaceCharactersInRange:[ soapFormat rangeOfString: @"----"] withString:stringImage];
  //  [soapFormat replaceCharactersInRange:[ soapFormat rangeOfString: @"++++"] withString:[image_ accessibilityIdentifier]];
    
    NSLog(@"The request format is %@",soapFormat);
    
    NSURL *locationOfWebService = [NSURL URLWithString:@"https://share.essentionware.com/_vti_bin/lists.asmx"];
    
    NSLog(@"web url = %@",locationOfWebService);
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc]initWithURL:locationOfWebService];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d",[soapFormat length]];
    
    [theRequest addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"http://schemas.microsoft.com/sharepoint/soap/GetListItems" forHTTPHeaderField:@"SOAPAction"];
    [theRequest addValue:msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    //the below encoding is used to send data over the net
    [theRequest setHTTPBody:[soapFormat dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *connect = [[NSURLConnection alloc]initWithRequest:theRequest delegate:self];
    
    if (connect) {
        webData = [[NSMutableData alloc]init];
    }
    else {
        NSLog(@"No Connection established");
    }
   
}
//NSURLConnection delegate method

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    flagEndConnection=true;
    NSLog(@"ERROR with theConenction");
    //[connection release];
    // [webData release];
}

-(BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return YES;
}

-(void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSURLCredential *credential = [NSURLCredential credentialWithUser:@"Kevin" password:@"N1keDym0" persistence:NSURLCredentialPersistenceForSession];
    [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [webData length]);
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"Respones-> %@",theXML);
    
    _response=[[NSString alloc]init];
    _response=theXML;
    
    NSXMLParser *xmlParser=[[NSXMLParser alloc] initWithData:[theXML dataUsingEncoding:NSUTF8StringEncoding]];
    Parse *theParse=[[Parse alloc] initParse];
    [xmlParser setDelegate:theParse];
    [xmlParser parse];
    
   // while (![theParse GetFlag]) {
        
   // }
    
    resultList=[theParse getArrayList];
    flagEndConnection=true;
    // NSString *convertToStringData = [[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding];
    
    //output.numberOfLines = 0;
    //output.text = convertToStringData;
    //[output sizeToFit];
    
    //[connection release];
 //   welcome *wl=[[welcome alloc] init];
 //   [wl tableViewMy];
}

@end

//"<viewName></viewName>\n"
//"<query><Query><OrderBy><FieldRef Name=\"Title\"/></OrderBy></Query></query>\n"
//"<viewFields>  <ViewFields><FieldRef Name=\"Title\"/></ViewFields> </viewFields>\n"
//"<rowLimit></rowLimit>\n"
//"<queryOptions></queryOptions>\n"


