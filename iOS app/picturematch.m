//
//  picturematch.m
//  ABC
//
//  Created by littlered on 5/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "picturematch.h"

@interface picturematch ()

@end

@implementation picturematch
{
    int aCounter;
    int numberForRoundAnswered;

    int myModular;
    
    int errors;
    int answered;
    int mytime;
    
    BOOL soundSet;
    
    BOOL firstBool;
    BOOL secondBool;
    BOOL thirdBool;
    BOOL fourthBool;
}

//view
    @synthesize mainpicture;
    @synthesize mainword;
    @synthesize mainwordbg;
    @synthesize firstbutton;
    @synthesize secondbutton;
    @synthesize thirdbutton;
    @synthesize fourthbutton;
    @synthesize myswipe;
    @synthesize scoreButton;

//data
    @synthesize myDictionary = _mydictionary;

    @synthesize theCorrectWord = _theCorrectWord;
    @synthesize myMutableNumberArray = _myMutableNumberArray;

    @synthesize startTime = _startTime;
    @synthesize myTimer = _myTimer;

//sound
    @synthesize ssIDPictureMatchWord;
    @synthesize soundTitle = _soundTitle;

/////
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/////

- (void)viewDidLoad
{

    [super viewDidLoad];

////////
//view
////////
       
    [mainpicture setClipsToBounds:YES];
    [[mainpicture layer] setBorderColor:[[UIColor lightGrayColor] CGColor]];
    [[mainpicture layer] setBorderWidth:2.0];
    [[mainpicture layer] setCornerRadius:10];
    
////////
//data
////////

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];    
    if ([defaults integerForKey:@"dictionary"] == 1){
        self.myDictionary = [NSArray arrayWithObjects:@"ant",@"ax",@"ankle",@"apple",@"bear",@"ball",@"banana",@"bed",@"cat",@"cut",@"cake",@"car",@"dog",@"dig",@"doll",@"door",@"elephant",@"egg",@"eggcup",@"empty",@"fish",@"fin",@"fan",@"four",@"goose",@"gate",@"girl",@"goat",@"hen",@"hat",@"hair",@"hand",@"insect",@"ill",@"in",@"ink",@"jellyfish",@"jump",@"jam",@"juice",@"kangaroo",@"kick",@"key",@"kite",@"lion",@"leg",@"leaf",@"lemon",@"monkey",@"mouth",@"mango",@"milk",@"nannygoat",@"nose",@"neck",@"nest",@"octopus",@"on",@"ostrich",@"ox",@"panda",@"pen",@"pear",@"pig",@"quail",@"quiet",@"queen",@"quilt",@"rabbit",@"read",@"rain",@"rose",@"seal",@"sun",@"sand",@"sea",@"tiger",@"teeth",@"tea",@"tie",@"uncle",@"under",@"umbrella",@"up",@"viper",@"victory",@"van",@"vase",@"worm",@"wet",@"water",@"window",@"fox",@"box",@"six",@"wax",@"yak",@"yes",@"yogurt",@"yoyo",@"zebra",@"zipper",@"zigzag",@"zoo",nil];
    }
    else{
        self.myDictionary = [NSArray arrayWithObjects:@"apple",@"ant",@"acorn",@"alligator",@"ball",@"banana",@"bat",@"bear",@"cake",@"cat",@"corn",@"cow",@"duck",@"dog",@"door",@"dinosaur",@"earth",@"egg",@"elephant",@"eraser",@"fish",@"fly",@"fox",@"frog",@"giraffe",@"girl",@"goat",@"goose",@"hand",@"hen",@"hippo",@"house",@"ice",@"igloo",@"ink",@"insect",@"jam",@"jet",@"jewel",@"juice",@"kangaroo",@"key",@"kite",@"kiwi",@"leaf",@"leg",@"lemon",@"lion",@"mango",@"milk",@"monkey",@"music",@"nail",@"net",@"nose",@"nurse",@"octopus",@"orange",@"ostrich",@"owl",@"pig",@"pear",@"pencil",@"panda",@"queen",@"quail",@"qiling",@"quilt",@"rabbit",@"rain",@"rainbow",@"robot",@"sea",@"star",@"seal",@"sun",@"tea",@"tiger",@"tomato",@"train",@"ufo",@"umbrella",@"unicorn",@"up",@"vampire",@"van",@"vase",@"violin",@"water",@"window",@"wolf",@"worm",@"xenops",@"xiphias",@"xray",@"xylophone",@"yacht",@"yak",@"yogurt",@"yoyo",@"zebra",@"zipper",@"zombie",@"zoo",nil];        
    }
    
    aCounter = 0;
    myModular = 4;
    
    /////////////////
    //sound volume
    /////////////////
    
    soundSet = FALSE;
    if ([defaults boolForKey:@"sound"] == TRUE)
    {
        soundSet = TRUE;
    }
    
    //sets time
    self.startTime = [NSDate date];
    
    firstBool = TRUE;
    secondBool = TRUE;
    thirdBool = TRUE;
    fourthBool = TRUE;
    
////////////////
//swipe control
////////////////

    //swipe
    UISwipeGestureRecognizer *oneFingerSwipeRight = 
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeRight:)];
    [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [[self view] addGestureRecognizer:oneFingerSwipeRight];
    
    UISwipeGestureRecognizer *oneFingerSwipeLeft = 
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeLeft:)];
    [oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:oneFingerSwipeLeft];
    
    UISwipeGestureRecognizer *twoFingerSwipeRight = 
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerSwiperight:)];
    [twoFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    twoFingerSwipeRight.numberOfTouchesRequired = 2;
    [[self view] addGestureRecognizer:twoFingerSwipeRight];
    
    UISwipeGestureRecognizer *twoFingerSwipeLeft = 
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerSwipeLeft:)];
    [twoFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    twoFingerSwipeLeft.numberOfTouchesRequired = 2;
    [[self view] addGestureRecognizer:twoFingerSwipeLeft];


    //timer
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                    target:self
                                                  selector:@selector(timeWrite)
                                                  userInfo:nil
                                                   repeats:YES];
    
    
    
    [self bottomButtonWriter];
    [self topPictureWriter];
    
}//end load


//////////////////////
//data manipulation
//////////////////////


    //randomizer
    - (NSArray*)shuffleArray:(NSArray*)array {
        NSMutableArray *temp = [[NSMutableArray alloc] initWithArray:array];
        for(NSUInteger i = [array count]; i > 1; i--) {
            NSUInteger j = arc4random_uniform(i);
            [temp exchangeObjectAtIndex:i-1 withObjectAtIndex:j];
        }
        return [NSArray arrayWithArray:temp];
    }

    //array quality switcher
    - (NSMutableArray *)unMutableToMutable:(NSArray *)array {
        return [NSMutableArray arrayWithArray:array];
    }


////////////////
//writer
////////////////

    -(void) bottomButtonWriter {
      
        NSArray * numberArray = [NSArray arrayWithObjects:@"0",@"1",@"2",@"3",nil];
        
        self.myMutableNumberArray = [NSMutableArray arrayWithCapacity:4];

        self.myMutableNumberArray = [self unMutableToMutable:[self shuffleArray:numberArray]];
        
        [firstbutton setTitle:[self.myDictionary objectAtIndex:(aCounter+[[self.myMutableNumberArray objectAtIndex:0] integerValue])] forState:UIControlStateNormal];
        [secondbutton setTitle:[self.myDictionary objectAtIndex:(aCounter+[[self.myMutableNumberArray objectAtIndex:1] integerValue])] forState:UIControlStateNormal];
        [thirdbutton setTitle:[self.myDictionary objectAtIndex:(aCounter)+[[self.myMutableNumberArray objectAtIndex:2] integerValue]] forState:UIControlStateNormal];
        [fourthbutton setTitle:[self.myDictionary objectAtIndex:(aCounter)+[[self.myMutableNumberArray objectAtIndex:3] integerValue]] forState:UIControlStateNormal];

    }

    -(void) topPictureWriter {

        self.theCorrectWord = [self.myDictionary objectAtIndex:aCounter+ [[self.myMutableNumberArray objectAtIndex:[[self.myMutableNumberArray objectAtIndex:numberForRoundAnswered] integerValue]] integerValue]];
   
          [mainpicture setImage:[UIImage imageNamed:[NSString stringWithFormat:@"pic/%@.jpg", self.theCorrectWord]] forState:UIControlStateNormal];
        
        mainword.text = self.theCorrectWord;
        mainword.hidden = YES;
        mainwordbg.hidden = YES;
    }

////////////////
//swipe control
////////////////

    //swipe
    - (void)twoFingerSwiperight:(UISwipeGestureRecognizer *)recognizer {
        if (aCounter == 0)
        {
            aCounter = [self.myDictionary count] -8;
        }
        else if (aCounter < 8)
        {
            aCounter = 0;
        }
        else {
            aCounter = aCounter - 8;
        }
        [self previousAction];
    }

    - (void)twoFingerSwipeLeft:(UISwipeGestureRecognizer *)recognizer {
        if (aCounter > [self.myDictionary count] - 8)
        {
            aCounter = 0;
        }
        else {
            aCounter = aCounter + 8;
        }
        [self nextAction];
    }

    - (void)oneFingerSwipeRight:(UISwipeGestureRecognizer *)recognizer { 
        [self previousAction];
    }

    - (void)oneFingerSwipeLeft:(UISwipeGestureRecognizer *)recognizer { 
        [self nextAction];    
    }

////////////////
//nav
////////////////

    //previous
    -(void) previousAction {
        if (aCounter <= 0)
        {
            aCounter = [self.myDictionary count]-4;   
        }    
        else {
            aCounter = aCounter - 4;
        }
        
        [self navCore];
    }

    //next action
    - (void) nextAction {
        aCounter = aCounter +4;
        if (aCounter >([self.myDictionary count])-4)
        {
            aCounter = 0;   
        }
        [self navCore];
    }

    //nav
    -(void) navCore {
        firstBool = TRUE;
        secondBool = TRUE;
        thirdBool = TRUE;
        fourthBool = TRUE;
        
        firstbutton.alpha= 1;
        secondbutton.alpha= 1;
        thirdbutton.alpha= 1;
        fourthbutton.alpha= 1;

        numberForRoundAnswered = 0;
        
        [self bottomButtonWriter];
        [self topPictureWriter];    
    }

//////////////////
//Time and Score
//////////////////

    -(void) timeWrite {
        int myint = round([self timeSet]);
        
        // NSString *a = [NSString stringWithFormat:@"Score %d", answered];
        // NSString *b = [NSString stringWithFormat:@" Errors %d", errors];
        // NSString *c = [NSString stringWithFormat:@" Time %d", myint];
        
        NSString* buttonWrite = [[[NSString stringWithFormat:@"Score: %d", answered] stringByAppendingString:[NSString stringWithFormat:@" Errors: %d", errors]] stringByAppendingString:[NSString stringWithFormat:@" Time: %d", (myint*-1)]];
        
        [scoreButton setTitle:buttonWrite forState:UIControlStateNormal];
    }

    -(NSTimeInterval) timeSet {
        return [self.startTime timeIntervalSinceNow];
    }

////////////////
//button action
////////////////

    - (IBAction)firstbutton:(UIButton *)sender {
            
        self.soundTitle = firstbutton.currentTitle;
        [self soundActionWord];
        
        if(self.theCorrectWord == firstbutton.currentTitle) {
            
            if (firstBool == TRUE){
                
                //data
                numberForRoundAnswered ++;
                answered++;
                firstBool = FALSE;
                firstbutton.alpha = .4;
                if(numberForRoundAnswered ==4){
                    [self mySwipeAnimation];
                    [self navCore];
                }
                else{
                [self topPictureWriter];
                }
            }
            else {}
        }
        else{
            errors++;
        }
    }

    - (IBAction)secondbutton:(UIButton *)sender {
        
        self.soundTitle = secondbutton.currentTitle;
        [self soundActionWord];
        
        if(self.theCorrectWord == secondbutton.currentTitle) {
            
            if (secondBool == TRUE){
                
                //data
                numberForRoundAnswered ++;
                answered++;
                secondBool = FALSE;
                secondbutton.alpha= .4;

                if(numberForRoundAnswered ==4){
                    [self mySwipeAnimation];
                    [self navCore];
                    
                }
                else{
                    [self topPictureWriter];
                }                
            }
            else {}
        }
        else{
            errors++;
        }
    }

    - (IBAction)thirdbutton:(UIButton *)sender {
        
        self.soundTitle = thirdbutton.currentTitle;
        [self soundActionWord];
        
        if(self.theCorrectWord == thirdbutton.currentTitle) {
            
            if (thirdBool == TRUE){
                
                //data
                numberForRoundAnswered ++;
                answered++;
                thirdBool = FALSE;
                thirdbutton.alpha= .4;
                if(numberForRoundAnswered ==4){
                    [self mySwipeAnimation];
                    [self navCore];
                }
                else{
                    [self topPictureWriter];
                }                
            }
            else {}
        }
        else{
            errors++;
        }
    }

    - (IBAction)fourthbutton:(UIButton *)sender {
       
        self.soundTitle = fourthbutton.currentTitle;
        [self soundActionWord];
        
        if(self.theCorrectWord == fourthbutton.currentTitle) {
            
            if (fourthBool == TRUE){
                
                //data
                numberForRoundAnswered ++;
                answered++;
                fourthBool = FALSE;
                fourthbutton.alpha= .4;
                if(numberForRoundAnswered ==4){
                    [self mySwipeAnimation];
                    [self navCore];
                }
                else{
                    [self topPictureWriter];
                }                
            }
            else {}
        }
        else{
            errors++;
        }
    }

    - (IBAction)mainpicbutton:(UIButton *)sender {

        self.soundTitle = self.theCorrectWord;
        mainword.hidden = NO;
        mainwordbg.hidden = NO;

        [self soundActionWord];
    }

/////////////
//animation
/////////////

    -(void)mySwipeAnimation {
        myswipe.animationImages = [NSArray arrayWithObjects:
                                   [UIImage imageNamed:@"hand/hand01.png"],
                                   [UIImage imageNamed:@"hand/hand02.png"],
                                   [UIImage imageNamed:@"hand/hand03.png"],
                                   [UIImage imageNamed:@"hand/hand04.png"],
                                   [UIImage imageNamed:@"hand/hand05.png"],
                                   [UIImage imageNamed:@"hand/hand06.png"],
                                   [UIImage imageNamed:@"hand/hand07.png"],
                                   [UIImage imageNamed:@"hand/hand08.png"],
                                   [UIImage imageNamed:@"hand/hand09.png"],
                                   [UIImage imageNamed:@"hand/hand10.png"],
                                   [UIImage imageNamed:@"hand/hand11.png"],
                                   [UIImage imageNamed:@"hand/hand12.png"],
                                   [UIImage imageNamed:@"hand/hand13.png"],
                                   [UIImage imageNamed:@"hand/hand14.png"],
                                   [UIImage imageNamed:@"hand/hand15.png"],
                                   [UIImage imageNamed:@"hand/hand16.png"],
                                   [UIImage imageNamed:@"hand/hand17.png"],
                                   [UIImage imageNamed:@"hand/hand18.png"],
                                   [UIImage imageNamed:@"hand/hand19.png"],
                                   [UIImage imageNamed:@"hand/hand20.png"],
                                   [UIImage imageNamed:@"hand/hand21.png"],
                                   [UIImage imageNamed:@"hand/hand22.png"],
                                   [UIImage imageNamed:@"hand/hand23.png"],
                                   [UIImage imageNamed:@"hand/hand24.png"],
                                   [UIImage imageNamed:@"hand/hand25.png"],
                                   [UIImage imageNamed:@"hand/hand26.png"],
                                   [UIImage imageNamed:@"hand/hand27.png"],
                                   [UIImage imageNamed:@"hand/hand28.png"],
                                   [UIImage imageNamed:@"hand/hand29.png"],
                                   [UIImage imageNamed:@"hand/hand39.png"],
                                   [UIImage imageNamed:@"hand/hand11.png"],nil];
        myswipe.animationDuration = 1.0;
        [myswipe setAnimationRepeatCount: 1];
        [myswipe startAnimating];
    }

/////////
//sound
////////

void MyPictureMatchAudioServicesSystemSoundCompletionProc (SystemSoundID ssIDPictureMatchWord,void* clientData){
    AudioServicesDisposeSystemSoundID(ssIDPictureMatchWord);
}

- (void) soundActionWord{
    
    if (soundSet == FALSE)
    {
        
        id SOUNDPATH = [[NSBundle mainBundle] 
                        pathForResource:self.soundTitle 
                        ofType:@"m4a" 
                        inDirectory:@"audio/"];
        CFURLRef baseURL = (__bridge_retained CFURLRef)  [[NSURL alloc] initFileURLWithPath:SOUNDPATH];
        AudioServicesCreateSystemSoundID (baseURL, &ssIDPictureMatchWord);
        AudioServicesPlaySystemSound(ssIDPictureMatchWord);	
        CFRelease(baseURL);
        AudioServicesAddSystemSoundCompletion (ssIDPictureMatchWord,NULL,NULL,MyPictureMatchAudioServicesSystemSoundCompletionProc,(__bridge void*)self);
    }
    else{}
}

////////
//xcode
////////

                - (void)viewDidUnload
                {
                    [self setMainpicture:nil];
                    [self setFirstbutton:nil];
                    [self setSecondbutton:nil];
                    [self setThirdbutton:nil];
                    [self setFourthbutton:nil];
                    [self setScoreButton:nil];
                    [self setMyswipe:nil];
                    [self setMainword:nil];
                    [self setMainwordbg:nil];
                    [super viewDidUnload];
                    // Release any retained subviews of the main view.
                }

                - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
                    return interfaceOrientation == UIInterfaceOrientationLandscapeLeft;
                }

@end
