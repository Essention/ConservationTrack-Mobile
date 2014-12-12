//
//  SecondViewController.m
//  Essention_iOS
//
//  Created by Oleksii on 10/8/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "SecondViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface SecondViewController ()
- (IBAction)SelectPhoto:(id)sender;
- (IBAction)MAkePhoto:(id)sender;
- (IBAction)SendPhoto:(id)sender;
- (IBAction)getAllImages:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;



@end

@implementation SecondViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)viewDidUnload {
    [super viewDidUnload];
}
- (void)dealloc {
    //[output release];
    //[convertToStringData release];
    //[super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

///////// photo
- (IBAction)SelectPhoto:(id)sender {
    NSLog(@"ChooseExisting");
    
    
    picker2=[[UIImagePickerController alloc] init];
    picker2.delegate =self;
    
    NSString *tt=[NSHomeDirectory()   stringByAppendingPathComponent:@"Documents"];
    [picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //[picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker2 animated:YES completion:NULL];
  //  [picker2 release];
    NSLog(@"TChooseExisting end %@",picker2.nibName);
}

- (IBAction)MAkePhoto:(id)sender {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    else{
        picker2=[[UIImagePickerController alloc] init];
    picker2.delegate =self;
    [picker2 setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker2 animated:YES completion:NULL];

    }
    
       // [picker2 release];
}


-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    NSLog(@"imagePickerController");
    image_ =[info objectForKey:UIImagePickerControllerOriginalImage];
    [imageview_ setImage:image_];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    NSURL *refURL =[info valueForKey:UIImagePickerControllerReferenceURL];
    [image_ setAccessibilityIdentifier:
     [refURL.relativePath substringFromIndex:1]
     
     ] ;
    NSString *file_name = [image_ accessibilityIdentifier] ;
    
    NSLog(@"imagePickerController end-----. %@",file_name);
    
    
    
    ///////
   //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
   // NSString *documentsDirectory = [paths objectAtIndex:0];
    //NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:@"savedImage.png"];
    
    NSString *documentsDirectory = [NSHomeDirectory()
                                    stringByAppendingPathComponent:@"Documents"];
    NSString *savedImagePath = [documentsDirectory
                          stringByAppendingPathComponent:@"sav234234wrqwge.png"];
    
    UIImage *image = imageview_.image; // imageView is my image from camera
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:savedImagePath atomically:YES];
    
}
-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    NSLog(@"imagePickerControllerDidCancel");
    [self dismissViewControllerAnimated:YES completion:NULL];
    NSLog(@"imagePickerControllerDidCancel end.");
}
// soap  ...  requests to SP server
-(IBAction) SendPhoto:(id)sender
    {
        [self Soap_Send_photo];
    }


-(void) Soap_Send_photo{
    //NSMutableData *webData;
    
    NSData *dataImage = [[NSData alloc] init];
    dataImage = UIImagePNGRepresentation(imageview_.image);
    NSString *stringImage = [dataImage base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    nodeContent = [[NSMutableString alloc]init];
    
    NSMutableString *soapFormat = [NSMutableString stringWithFormat:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"> \n"
                                   "<soap:Body>\n"
                                   "<CopyIntoItems xmlns=\"http://schemas.microsoft.com/sharepoint/soap/\">\n"
                                   "<SourceUrl>imgad.jpeg</SourceUrl>\n"
                                   "<DestinationUrls>\n"
                                   "<string>https://share.essentionware.com/iosImage/++++</string>\n"
                                   "</DestinationUrls>\n"
                                   "<Fields></Fields>\n"
                                   "<Stream>----</Stream>\n"
                                   "</CopyIntoItems>\n"
                                   "</soap:Body>\n"
                                   "</soap:Envelope>\n"];
    
    [soapFormat replaceCharactersInRange:[ soapFormat rangeOfString: @"----"] withString:stringImage];
    [soapFormat replaceCharactersInRange:[ soapFormat rangeOfString: @"++++"] withString:[image_ accessibilityIdentifier]];
    
    NSLog(@"The request format is %@",soapFormat);
    
    NSURL *locationOfWebService = [NSURL URLWithString:@"https://share.essentionware.com/_vti_bin/copy.asmx"];
    
    NSLog(@"web url = %@",locationOfWebService);
    
    NSMutableURLRequest *theRequest = [[NSMutableURLRequest alloc]initWithURL:locationOfWebService];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d",[soapFormat length]];
    
    [theRequest addValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    [theRequest addValue:@"http://schemas.microsoft.com/sharepoint/soap/CopyIntoItems" forHTTPHeaderField:@"SOAPAction"];
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
    NSLog(@"%@",theXML);
    
   // NSString *convertToStringData = [[NSString alloc] initWithData:webData encoding:NSUTF8StringEncoding];
    
    //output.numberOfLines = 0;
    //output.text = convertToStringData;
    //[output sizeToFit];
    
    //[connection release];
}



@end
