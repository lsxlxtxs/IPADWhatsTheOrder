//
//  ViewController.m
//  IPADWhatsTheOrder
//
//  Created by laura on 4/22/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

//@implementation ViewController
@implementation UINavigationController (Rotation_IOS6)

- (void)viewDidLoad 
{

   
    [super viewDidLoad];
}
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
@synthesize moviePlayer;
@synthesize moviePlayerReward;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {

    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initalization
    }
    return self;
    
    

}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidLoad 
{
    
    oneImg = [UIImage imageNamed:@"block1.png"];
    twoImg = [UIImage imageNamed:@"block2.png"];
    threeImg = [UIImage imageNamed:@"block3.png"];
    
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
        theImg = threeImg;
        blockSelected = 3;
    }
    // spot 3 - block 2
    if (CGRectContainsPoint([s6 frame], [touch locationInView:self.view])) {
        cellWasUsed = YES;
        theImg = twoImg;
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
    if (CGRectContainsPoint([s3 frame], [touch locationInView:self.view])&(blockSelected==3)&(roundNum==3)) 
    {
        cellWasUsed = YES;
        s5.image = NULL;
        s3.image = theImg;
        //you win
        roundNum=4;
        
        [self checkForWin];


    }
    
}



-(BOOL)checkForWin{
    
    // Check - WINS
    if((roundNum==4) && (s6.image == NULL) && (s5.image == NULL) && (s4.image == NULL))
    {
        //play the reward video if they win
        [self playRewardMovie];
    }
    //No Win
    return NO;
}




    

//block video
-(void)playMovie
{
    NSURL *url = [NSURL URLWithString:
                  @"http://londo.stetson.edu/cinf301.s2013/lseletos/blocks.mp4"];
    
    moviePlayer =  [[MPMoviePlayerController alloc]
                    initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayer];
    
    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    moviePlayer.shouldAutoplay = YES;
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
}

//reward video
-(void)playRewardMovie
{
    NSURL *url = [NSURL URLWithString:
                  @"http://londo.stetson.edu/cinf301.s2013/lseletos/reward.mp4"];
    
    moviePlayerReward =  [[MPMoviePlayerController alloc]
                    initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:moviePlayerReward];
    
    moviePlayerReward.controlStyle = MPMovieControlStyleDefault;
    [self.view addSubview:moviePlayerReward.view];
    [moviePlayerReward setFullscreen:YES animated:YES];
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter] 
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if ([player
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [player.view removeFromSuperview];
    }
    
}

@end
