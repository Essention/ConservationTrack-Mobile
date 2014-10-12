//
//  FirstViewController.h
//  Essention_iOS
//
//  Created by Oleksii on 10/8/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface FirstViewController : UIViewController{
    IBOutlet UILabel *logGps;
    IBOutlet UIButton *gpsButton;
    
    IBOutlet UILabel *longitude;
    IBOutlet UILabel *latitude;
    IBOutlet UILabel *address;
    
    IBOutlet UITextView *scrollText;
    
}
-(IBAction)actionGPS:(id)sender;

@end

