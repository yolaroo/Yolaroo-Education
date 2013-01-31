//
//  ViewController.m
//  pishtest
//
//  Created by Pi on 1/31/13.
//  Copyright (c) 2013 Yolaroo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

        //5. keep class in memeory
        @synthesize mathstuff = _mathstuff;

- (void)viewDidLoad
{
    [super viewDidLoad];

        //6. start class
        self.mathstuff = [[mathstuff alloc] init];

}

- (IBAction)buttonpress:(id)sender {
   
    UIButton* mybutton = (UIButton*) sender;
    NSString* mybuttonpress;
    mybuttonpress = mybutton.currentTitle;

        //7. using the fuction in the imported class
        self.mylabel.text = [self.mathstuff myfunction:mybuttonpress];
    
    //example of same funciton but local
    //self.mylabel.text = [self myfunctionlocal:mybuttonpress];

}

-(NSString*) myfunctionlocal :(NSString*) inputstring
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
