//
//  Parse.h
//  Essention_iOS
//
//  Created by Oleksii on 10/30/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "AppDelegate.h"
//#import "SP.h"
#import "List.h"

@interface Parse : NSObject<NSXMLParserDelegate>{
    
    //SP *app;
    List *theList;
    NSMutableString *correntElementValue;
    BOOL flagEndParse;
}
@property(strong,nonatomic)      NSMutableArray *parselistArray;
-(id)initParse;
-(NSMutableArray *)getArrayList;
//-(BOOL)GetFlag;

@end
