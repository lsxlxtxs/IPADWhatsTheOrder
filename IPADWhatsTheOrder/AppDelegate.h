//
//  AppDelegate.h
//  IPADWhatsTheOrder
//
//  Created by laura on 4/22/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;


@interface AppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow *window;
    ViewController *viewController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ViewController *viewController;


@end
