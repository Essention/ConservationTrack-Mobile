//
//  SecondViewController.h
//  Essention_iOS
//
//  Created by Oleksii on 10/8/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,NSXMLParserDelegate>
{
    UIImagePickerController *picker2;
    UIImage *image_;
    IBOutlet UIImageView *imageview_;
    
    NSMutableData *webData;
    NSMutableString *nodeContent;

}


@end

