
//  Essention_iOS
//
//  Created by Oleksii on 10/29/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SPFormList.h"
#import <Foundation/NSString.h>
#import "NSStringUtil.h"

@interface SP : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSXMLParserDelegate>
{
    NSMutableData *webData;
    NSMutableString *nodeContent;
    NSMutableArray *resultList;
    SPFormList *sPresultList;
    ////////////
    BOOL flagEndConnection;
    NSString *whatWeDoWithXml;
    
}
@property (nonatomic, readwrite)    NSString *response;
@property(strong,nonatomic)      NSMutableArray *listArray;

-(void)Get_GetList_Items  ;
-(void)Get_AttaUrl:(NSInteger *)spidIt;
-(void) TryLoadFile: (NSString *)nameFileReport;
-(void) Save_xml_In_spFormList: (NSString *)theXml fileName:(NSString *)nameF;

-(NSMutableArray *) CheCkResult;
-(SPFormList *) CheckSPResult;

-(BOOL)FlagEnd;

@end
