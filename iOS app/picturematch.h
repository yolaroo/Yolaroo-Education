//
//  picturematch.h
//  ABC
//
//  Created by littlered on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>

@interface picturematch : UIViewController


////////
//view
////////

    //mainpiture
    @property (weak, nonatomic) IBOutlet UIButton *mainpicture;
    @property (weak, nonatomic) IBOutlet UILabel *mainword;
    @property (weak, nonatomic) IBOutlet UILabel *mainwordbg;

    //buttons
    @property (weak, nonatomic) IBOutlet UIButton *firstbutton;
    @property (weak, nonatomic) IBOutlet UIButton *secondbutton;
    @property (weak, nonatomic) IBOutlet UIButton *thirdbutton;
    @property (weak, nonatomic) IBOutlet UIButton *fourthbutton;
    
    //animation
    @property (weak, nonatomic) IBOutlet UIImageView *myswipe;
    
    //score
    @property (weak, nonatomic) IBOutlet UIButton *scoreButton;

///////
//data
//////
    
    @property NSDate * startTime;
    @property NSTimer * myTimer;

    @property NSArray *myDictionary;
    @property NSString * theCorrectWord;
    @property NSMutableArray *myMutableNumberArray;

////////
//sound
////////

    @property NSString * soundTitle;
    @property SystemSoundID ssIDPictureMatchWord;

//////////
//methods
//////////

    //data
    - (NSArray*)shuffleArray:(NSArray*)array;
    
    //write
    - (void) bottomButtonWriter;
    - (void) topPictureWriter;
 
    //swipe
    - (void)oneFingerSwipeRight:(UISwipeGestureRecognizer *)recognizer;
    - (void)oneFingerSwipeLeft:(UISwipeGestureRecognizer *)recognizer;
    - (void)twoFingerSwiperight:(UISwipeGestureRecognizer *)recognizer;
    - (void)twoFingerSwipeLeft:(UISwipeGestureRecognizer *)recognizer;

    //nav
    - (void) previousAction;
    - (void) nextAction;
    - (void) navCore;

    //time and score
    - (void) timeWrite;
    - (NSTimeInterval) timeSet;

    //animation
    - (void) mySwipeAnimation;

    //sound
    - (void) soundActionWord;





@end
