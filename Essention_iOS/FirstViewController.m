//
//  FirstViewController.m
//  Essention_iOS
//
//  Created by Oleksii on 10/8/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import "FirstViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController()<CLLocationManagerDelegate>
//@property (weak, nonatomic) IBOutlet UILabel *longitude;
//@property (weak, nonatomic) IBOutlet UILabel *latitude;
//@property (weak, nonatomic) IBOutlet UILabel *address;
-(IBAction)actionGPS:(id)sender;
//-(NSString*)readStringFromFile;
- (IBAction)ShowLog:(id)sender;
- (IBAction)ClearLog:(id)sender;

@end

@implementation FirstViewController{

    CLLocationManager *manager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}
    void AddToLog(NSString* log,bool new){

        // NSLog(@"Documents Directory: %@", [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);
        NSError *error;
        
        // Create file manager
     //   NSFileManager *fileMgr = [NSFileManager defaultManager];
        
        // Point to Document directory
        NSString *documentsDirectory = [NSHomeDirectory()
                                        stringByAppendingPathComponent:@"Documents"];
        NSString *filePath = [documentsDirectory
                              stringByAppendingPathComponent:@"logGPS.txt"];
        
        // String to write
        NSString *allLog=[NSString alloc];
        if (!new) {
            allLog=[[NSString alloc] initWithData:[NSData dataWithContentsOfFile:filePath] encoding:NSUTF8StringEncoding];
        }else{
            allLog=@"";
        }

        NSString *str =[NSString stringWithFormat:@"%@\n%@",
                        log,allLog     ];
        // Write the file
        [str writeToFile:filePath atomically:YES
                encoding:NSUTF8StringEncoding error:&error];
    }
    NSString* GetLog(){
    //NSError *error;
    //NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *documentsDirectory = [NSHomeDirectory()
                                    stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [documentsDirectory
                          stringByAppendingPathComponent:@"logGPS.txt"];
    NSString *log=[[NSString alloc] initWithData:[NSData dataWithContentsOfFile:filePath] encoding:NSUTF8StringEncoding];
    return log;
}

-(IBAction)actionGPS:(id)sender
{

    // Show contents of Documents directory
 //   NSLog(@"Documents directory: %@",
   //       [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
    
    
    // The main act...
 //  NSLog(@"---: %@", [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:filePath] encoding:NSUTF8StringEncoding] );
    
  
    ///////////////////////

    
    UIButton *btn = (UIButton *)sender;
    NSString *title=btn.titleLabel.text;
    manager.delegate =self;
    manager.desiredAccuracy=kCLLocationAccuracyBest;
    if (![title isEqualToString:@"Stop GPS Loging"])
    {
        
        [manager startUpdatingLocation];
        [manager requestWhenInUseAuthorization];
        [gpsButton setTitle:@"Stop GPS Loging" forState:UIControlStateNormal];
        
    }else
    {
        
        [manager stopUpdatingLocation];
        [manager requestWhenInUseAuthorization];
        [gpsButton setTitle:@"Start GPS" forState:UIControlStateNormal];
    }
    
    
}
//#pragma mark CLLocationManagerDelegate Methods
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error: %@",error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    
  //  NSLog(@"Location %@", newLocation);
    CLLocation *currentLocation = newLocation;
    if (currentLocation!=nil) {
        latitude.text=[NSString stringWithFormat:@"%.8f",currentLocation.coordinate.latitude];
        longitude.text=[NSString stringWithFormat:@"%.8f",currentLocation.coordinate.longitude];
        AddToLog([NSString stringWithFormat:@"%@:%@",latitude.text,longitude.text],false);
    }
    
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error==nil && [placemarks count]>0) {
            placemark=[placemarks lastObject];
            address.text=[NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                               placemark.subThoroughfare, placemark.thoroughfare,
                               placemark.postalCode, placemark.locality,
                               placemark.administrativeArea,
                               placemark.country];
            
        } else {
            NSLog(@"%@",error.debugDescription);
        }
    }];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    manager =[[CLLocationManager alloc] init];
    geocoder =[[CLGeocoder alloc] init];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ShowLog:(id)sender {

    [scrollText setText:GetLog()];
   //NSLog(@"---: %@",  );
}

- (IBAction)ClearLog:(id)sender {
    AddToLog(@"--New--",true);
    [scrollText setText:GetLog()];
}
@end
