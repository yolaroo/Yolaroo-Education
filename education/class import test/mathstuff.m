//
//  mathstuff.m
//  pishtest
//
//  Created by Pi on 1/31/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import "mathstuff.h"

@implementation mathstuff

    -(NSString*) myfunction :(NSString*) inputstring
    {
        NSString* mytempString;
        
        if ([inputstring isEqualToString: @"1"])
        {
            mytempString = @"cat";
        }
        else if ([inputstring isEqualToString:@"2"])
        {
            mytempString = @"dog";
        }
        else if ([inputstring isEqualToString:@"3"])
        {
            mytempString = @"monkey";
        }
        return mytempString;
    }


@end

