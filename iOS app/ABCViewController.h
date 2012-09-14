//
//  ABCViewController.h
//  ABC
//
// yolaroo


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ABCViewController : UIViewController

//button


    @property (weak, nonatomic) IBOutlet UIButton *picturematchButton;


//options
    @property (weak, nonatomic) IBOutlet UISegmentedControl *dictionarychoice;
    @property (weak, nonatomic) IBOutlet UISwitch *soundchoice;

@end
