//
//  ParseXmlFromSP.h
//  Essention_iOS
//
//  Created by Oleksii on 11/27/14.
//  Copyright (c) 2014 Oleksii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SPFormList.h"

@interface ParseXmlFromSP : NSObject<NSXMLParserDelegate>{


//SP *app;
SPFormList *theList;
NSMutableString *correntElementValue;
BOOL flagEndParse;
}
@property(strong,nonatomic)      NSMutableArray *parselistArray;
-(id)initParse;
-(SPFormList *)getArrayList;




@end
