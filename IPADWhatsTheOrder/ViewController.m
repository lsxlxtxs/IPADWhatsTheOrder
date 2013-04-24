//
//  ViewController.m
//  IPADWhatsTheOrder
//
//  Created by laura on 4/22/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

//@implementation ViewController
@implementation UINavigationController (Rotation_IOS6)

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

// Rotate solution provided by: http://stackoverflow.com/questions/7263985/manually-set-interface-orientation

-(BOOL)shouldAutorotate
{
return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}

@end

@implementation ViewController

//since we created somethings in the header we need to synthesize them here.
//just to keep things clean and in order I broke up the synthesizing but you could
//have very well put them all on one line, or put everyone on its own @synthesize
@synthesize s1,s2,s3,s4,s5,s6;
@synthesize theImg,board,oneImg,twoImg,threeImg;
@synthesize myAlertView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initalization
    }
    return self;
}

- (void)viewDidLoad {
    
    oneImg = [UIImage imageNamed:@"block1.png"];
    twoImg = [UIImage imageNamed:@"block3.png"];
    threeImg = [UIImage imageNamed:@"block2.png"];
    
    blockSelected=0;
    roundNum=1;
    
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    UITouch *touch = [[event allTouches]anyObject];
    cellWasUsed = NO;
    
    //Selection
    // spot 1 - block 1
    if (CGRectContainsPoint([s4 frame], [touch locationInView:self.view])) {
        cellWasUsed = YES;
        theImg = oneImg;
        blockSelected = 1;
    }
    // spot 2 - block 3
    if (CGRectContainsPoint([s5 frame], [touch locationInView:self.view])) {
        cellWasUsed = YES;
        theImg = twoImg;
        blockSelected = 3;
    }
    // spot 3 - block 2
    if (CGRectContainsPoint([s6 frame], [touch locationInView:self.view])) {
        cellWasUsed = YES;
        theImg = threeImg;
        blockSelected = 2;
        
    }
    
    //Placement:
    //touching frame 1
    if (CGRectContainsPoint([s1 frame], [touch locationInView:self.view])&(blockSelected==1)&(roundNum==1)) {
        cellWasUsed = YES;
        s4.image = NULL;
        s1.image = theImg;
        roundNum=2;
    }
    //touching frame 2
    if (CGRectContainsPoint([s2 frame], [touch locationInView:self.view])&(blockSelected==2)&(roundNum==2)) {
        cellWasUsed = YES;
        s6.image = NULL;
        s2.image = theImg;
        roundNum=3;
    }
    //touching frame 3
    if (CGRectContainsPoint([s3 frame], [touch locationInView:self.view])&(blockSelected==3)&(roundNum==3)) {
        cellWasUsed = YES;
        s5.image = NULL;
        s3.image = theImg;
        //you win
        roundNum=4;
    }
    
}



-(BOOL)checkForWin{
    
    // HORIZONTAL WINS
    if((roundNum==4) & (s6.image == NULL) & (s5.image == NULL) & (s4.image == NULL))
    {
        return YES;
    }
    //No Win
    return NO;
}

-(void)displayWinner{
    if([self checkForWin]==YES)
    {
        //make a popup maybe? or just go into reward screen?
        myAlertView = [[UIAlertView alloc] initWithTitle:@"Winner!" message:@"Good Job!" delegate:self
                                       cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [myAlertView show];
    }
    
}




@end 

