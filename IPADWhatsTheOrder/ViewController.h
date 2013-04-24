//
//  ViewController.h
//  IPADWhatsTheOrder
//
//  Created by laura on 4/22/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h> 

@interface ViewController : UIViewController

{
    
    IBOutlet UIImage * oneImg;
    IBOutlet UIImage * twoImg;
    IBOutlet UIImage * threeImg;
    
    
    IBOutlet UIImageView *s1;
    IBOutlet UIImageView *s2;
    IBOutlet UIImageView *s3;
    IBOutlet UIImageView *s4;
    IBOutlet UIImageView *s5;
    IBOutlet UIImageView *s6;
    
    UIImage * theImg;
    
    
    
    IBOutlet UIImageView * board;
    
    
    
    NSInteger playerToken;
    
    
    NSInteger blockSelected;
    
    
    BOOL cellWasUsed;
    
    
    NSInteger numberOfPlays;
    
    
    NSInteger roundNum;
    
    
    UIAlertView *myAlertView;
}


@property (nonatomic,retain) UIImage *oneImg;
@property (nonatomic,retain) UIImage *twoImg;
@property (nonatomic,retain) UIImage *threeImg;

@property (nonatomic,retain) UIImage *theImg;

@property (nonatomic,retain) UIImageView *board;

@property (nonatomic,retain) UIImageView *s1;
@property (nonatomic,retain) UIImageView *s2;
@property (nonatomic,retain) UIImageView *s3;
@property (nonatomic,retain) UIImageView *s4;
@property (nonatomic,retain) UIImageView *s5;
@property (nonatomic,retain) UIImageView *s6;


@property (nonatomic,retain) UIAlertView *myAlertView;

-(BOOL) checkForWin;




@end
