//
//  ViewController.h
//  pishtest
//
//  Created by Pi on 1/31/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import <UIKit/UIKit.h>

    //1. import
    #import "mathstuff.h"

    //2. create class
    @class mathstuff;


@interface ViewController : UIViewController
{
    //3. create name for class
    mathstuff*mathstuff;
}

@property (strong, nonatomic) IBOutlet UILabel *mylabel;

    //4. keep class in memory
    @property (nonatomic, retain) mathstuff*mathstuff;

@end
