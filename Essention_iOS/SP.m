
//  Essention_iOS
//
//  Created by Oleksii on 10/29/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "SP.h"
#import "Parse.h"
#import "ParseXmlFromSP.h"
#import "welcome.h"


@implementation SP 
@synthesize listArray;
// soap  ...  requests to SP server

-(id) init{
    whatWeDoWithXml=@"non";
    
    return self;
}
-(NSMutableArray *)CheCkResult{
    return resultList;
}
-(SPFormList *)CheckSPResult{
    return sPresultList;
}

-(BOOL)FlagEnd{
    return flagEndConnection;
}

-(void)Get_AttaUrl:(NSInteger *)spidIt{
    NSMutableString *soapFormat = [NSMutableString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"> \n"
                                   "<soap:Body>\n"
                                   "<GetListItems xmlns=\"http://schemas.microsoft.com/sharepoint/soap/\">\n"
                                   "<listName>Monitoring Reports</listName>\n"
                                   "<viewFields><ViewFields>\n"
                                   "<FieldRef Name=\"LinkFilename\"/><FieldRef Name=\"ID\"/><FieldRef Name='Title'/>\n"
                                   "</ViewFields> </viewFields>\n"
                                   "<query><Query><Where><Eq>\n"
                                   "<FieldRef Name = \"ID\"/>\n"
                                   "<Value Type = \"Counter\">%ld</Value>\n"
                                   "</Eq></Where></Query></query>\n"
                                   "</GetListItems>\n"
                                   "</soap:Body>\n"
                                   "</soap:Envelope>\n",(long)spidIt];
    NSString *url=[NSString stringWithFormat:@"%@",@"https://www.conservationtrack.org/co/home/_vti_bin/lists.asmx"];
    NSString *soapUrl=[NSString stringWithFormat:@"%@",@"http://schemas.microsoft.com/sharepoint/soap/GetListItems"];
    [self RequestSoap:soapFormat urlSP:url soapUrl:soapUrl];
    
}
-(void) TryLoadFile : (NSString *)nameFileReport{
    whatWeDoWithXml=@"LoadFile";
    flagEndConnection=false;
    NSString *authenticationURL =[NSString stringWithFormat:@"%@%@",@"https://www.conservationtrack.org/co/home/monitoringreports/",nameFileReport];

    //barniconservation_monitoringrpt_2014-09-12t11_26_36.xml";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:authenticationURL]];

    
    [request setHTTPMethod: @"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"content-type"];
   // [request setHTTPBody:[[NSString stringWithFormat:@"username=%@&password=%@", escUsername, escPassword] dataUsingEncoding:NSUTF8StringEncoding]];
    
   NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
 //   [NSString stringWithContentsOfURL:[NSURL URLWithString:@"https://www.conservationtrack.org/co/home/monitoringreports/barniconservation_monitoringrpt_2014-09-12t11_26_36.xml"] encoding:NSUTF8StringEncoding error:nil];
}
-(void) Get_GetList_Items{
    NSMutableString *soapFormat = [NSMutableString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"> \n"
                                   "<soap:Body>\n"
                                   "<GetListItems xmlns=\"http://schemas.microsoft.com/sharepoint/soap/\">\n"
                                   "<listName>Monitoring Reports</listName>\n"
                                   "<viewFields>  <ViewFields><FieldRef Name='Title'/></ViewFields> </viewFields>\n"
                                   "</GetListItems>\n"
                                   "</soap:Body>\n"
                                   "</soap:Envelope>\n"];
    NSString *url=[NSString stringWithFormat:@"%@",@"https://www.conservationtrack.org/co/home/_vti_bin/lists.asmx"];
    NSString *soapUrl=[NSString stringWithFormat:@"%@",@"http://schemas.microsoft.com/sharepoint/soap/GetListItems"];
    [self RequestSoap:soapFormat urlSP:url soapUrl:soapUrl];
}

- (NSString *)toBase64String:(NSString *)string {
    NSData *data = [string dataUsingEncoding: NSUTF8StringEncoding];//NSUnicodeStringEncoding
    
    NSString *ret = [NSString base64StringFromData:data length:[data length]];
    
    return ret;
}


-(void) Save_xml_In_spFormList:(NSString *)theXml fileName:(NSString *)nameF{
    whatWeDoWithXml=@"saveXmlFileToformList";
    flagEndConnection=false;
    
    NSMutableString *soapFormat = [NSMutableString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"> \n"
                                   "<soap:Body>\n"
                                   "<CopyIntoItems xmlns=\"http://schemas.microsoft.com/sharepoint/soap/\">\n"
                                   "<SourceUrl>02.xml</SourceUrl>\n"
                                   "<DestinationUrls>\n"
                                   "<string>https://www.conservationtrack.org/co/home/MonitoringReports/%@</string>\n" //1 param
                                   "</DestinationUrls>\n"
                                   "<Fields></Fields>\n"
                                   "<Stream>%@</Stream>\n"  //  2 param
                                   "</CopyIntoItems>\n"
                                   "</soap:Body>\n"
                                   "</soap:Envelope>\n",nameF,[self toBase64String:theXml]];
    NSString *url=[NSString stringWithFormat:@"%@",@"https://www.conservationtrack.org/co/home/_vti_bin/copy.asmx"];
    NSString *soapUrl=[NSString stringWithFormat:@"%@",@"http://schemas.microsoft.com/sharepoint/soap/CopyIntoItems"];
    [self RequestSoap:soapFormat urlSP:url soapUrl:soapUrl];
}


-(void) RequestSoap:(NSMutableString *)requestSP   urlSP:(NSString *)urlSP  soapUrl:(NSString *)soapUrl{
    flagEndConnection=false;
    resultList =[[NSMutableArray alloc] init];
    nodeContent = [[NSMutableString alloc]init];
    
    NSMutableString *soapFormat =  requestSP;
    
  //  [soapFormat replaceCharactersInRange:[ soapFormat rangeOfString: @"----"] withString:stringImage];
  //  [soapFormat replaceCharactersInRange:[ soapFormat rangeOfString: @"++++"] withString:[image_ accessibilityIdentifier]];
    
    NSLog(@"The request format is %@",soapFormat);
    
    NSURL *locationOfWebService = [NSURL URLWithString:urlSP];
    
    NSLog(@"web url = %@",locationOfWebService);
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc]initWithURL:locationOfWebService];
    
    NSString *msgLength = [NSString stringWithFormat:@"%lu",(unsigned long)[soapFormat length]];
    
    [theRequest addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:soapUrl forHTTPHeaderField:@"SOAPAction"];
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
  //  NSString *responseText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  //  NSLog(@"%@", responseText);
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
    NSString *login =[[NSUserDefaults standardUserDefaults]stringForKey:@"username"];
    NSString *pass =[[NSUserDefaults standardUserDefaults]stringForKey:@"password"];
    
    NSURLCredential *credential = [NSURLCredential credentialWithUser:login password:pass persistence:NSURLCredentialPersistenceForSession];//@"Kevin" password:@"N1keDym0"
    [[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
}


-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %lu", (unsigned long)[webData length]);
    NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"Respones-> %@",theXML);
    
    
    _response=[[NSString alloc]init];
    _response=theXML;
    
    // switch -- -what we do with xml data
    [self switchXml :_response];
    
}
-(void) switchXml:(NSString *)xml{
    if ([whatWeDoWithXml isEqual: @"LoadFile"]) {
        NSXMLParser *xmlParser=[[NSXMLParser alloc] initWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
        ParseXmlFromSP *theParse=[[ParseXmlFromSP alloc] initParse];
        [xmlParser setDelegate:theParse];
        [xmlParser parse];
        
        sPresultList=[theParse getArrayList];
        flagEndConnection=true;
        
    }
    else if ([whatWeDoWithXml isEqual: @"getOnlyXml"]){
        
    }
    else if ([whatWeDoWithXml isEqual:@"saveXmlFileToformList"]){
    
    }
    else {
        NSXMLParser *xmlParser=[[NSXMLParser alloc] initWithData:[xml dataUsingEncoding:NSUTF8StringEncoding]];
        Parse *theParse=[[Parse alloc] initParse];
        [xmlParser setDelegate:theParse];
        [xmlParser parse];
        
        resultList=[theParse getArrayList];
        flagEndConnection=true;
    }
    
}

@end



