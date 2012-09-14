//
//  ABCViewController.m
//  ABC
//
// yolaroo


#import "ABCViewController.h"

@interface ABCViewController ()

@end

@implementation ABCViewController

    //buttons
    @synthesize picturematchButton;

    //interface
    @synthesize dictionarychoice;
    @synthesize soundchoice;

- (void)viewDidLoad {
    [super viewDidLoad];

    //picturematch
    [picturematchButton setClipsToBounds:YES];
    [[picturematchButton layer] setBorderWidth:3.0f];
	[picturematchButton.layer setBorderColor:[[UIColor whiteColor]CGColor]];
 
    //device specific view
    if([[UIDevice currentDevice].model isEqualToString:@"iPhone"])
    {
        [[picturematchButton layer] setCornerRadius:10.0f];
    }
    else if([[UIDevice currentDevice].model isEqualToString:@"iPad"])
    {
        [[picturematchButton layer] setCornerRadius:20.0f];
    }
    
    //storage:view
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];    
    if ([defaults integerForKey:@"dictionary"] == 1)
    {
        dictionarychoice.selectedSegmentIndex = 1;
    }

    //storage:sound
    if ([defaults boolForKey:@"sound"] == TRUE)
    {
        [soundchoice setOn:NO animated:YES];    
    }

}//end load

//dictionary
    - (IBAction)dictionarySet:(UISegmentedControl *)sender {
        
        if (dictionarychoice.selectedSegmentIndex == 0)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:0 forKey:@"dictionary"];
            [defaults synchronize];  
        }
        else if (dictionarychoice.selectedSegmentIndex == 1)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:1 forKey:@"dictionary"];
            [defaults synchronize];  
        }
    }

//sound
    - (IBAction)soundset:(UISwitch *)sender {
        if (soundchoice.on)
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setBool:FALSE forKey:@"sound"];
            [defaults synchronize];  
        }
        else
        {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setBool:TRUE forKey:@"sound"];
            [defaults synchronize];  
        }
    }

    - (void)viewDidUnload
    {
        [self setDictionarychoice:nil];
        [self setSoundchoice:nil];
        [self setPicturematchButton:nil];
        [super viewDidUnload];
    }

    - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
    {
        return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;

    }

@end
