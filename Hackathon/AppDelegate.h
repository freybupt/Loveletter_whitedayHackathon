//
//  AppDelegate.h
//  Hackathon
//
//  Created by Liang Shi on 12-03-10.
//  Copyright (c) 2012 University of Alberta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameViewController.h"

@class ViewController;


@interface AppDelegate  : NSObject <UIApplicationDelegate, UIAccelerometerDelegate> {
    UIWindow *window;
//    GameViewController *glView;
	UIAccelerationValue accel[3];
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

//@property (retain, nonatomic) GameViewController *glView;


@end
