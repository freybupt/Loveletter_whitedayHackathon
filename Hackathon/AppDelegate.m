//
//  AppDelegate.m
//  Hackathon
//
//  Created by Liang Shi on 12-03-10.
//  Copyright (c) 2012 University of Alberta. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "GameViewController.h"

@implementation AppDelegate
// CONSTANTS
//#define kAccelerometerFrequency		100.0 // Hz
//#define kFilteringFactor			0.1

@synthesize window = _window;
@synthesize viewController = _viewController;
//@synthesize glView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
     //Configure and start accelerometer
//	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / kAccelerometerFrequency)];
//	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
//    [glView startAnimation];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
//    [glView stopAnimation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
//    [glView startAnimation];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
//    [glView stopAnimation];
}

//- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
//{
//	//Use a basic low-pass filter to only keep the gravity in the accelerometer values
////	accel[0] = acceleration.x * kFilteringFactor + accel[0] * (1.0 - kFilteringFactor);
////	accel[1] = acceleration.y * kFilteringFactor + accel[1] * (1.0 - kFilteringFactor);
////	accel[2] = acceleration.z * kFilteringFactor + accel[2] * (1.0 - kFilteringFactor);
//	
//    
//    accel[0] = acceleration.x;
//    accel[1] = acceleration.y;
//    accel[2] = acceleration.z;
//     NSLog(@"accel x is %.20f", acceleration.x);
// 	//Update the accelerometer values for the view
//    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"x"] &&  [[NSUserDefaults standardUserDefaults] valueForKey:@"y"] && [[NSUserDefaults standardUserDefaults] valueForKey:@"z"]){
//        
//        double oldx = [[[NSUserDefaults standardUserDefaults] valueForKey:@"x"]  doubleValue];
//       
//         double oldy = [[[NSUserDefaults standardUserDefaults] valueForKey:@"y"]  doubleValue];
//        
//         double oldz = [[[NSUserDefaults standardUserDefaults] valueForKey:@"z"]  doubleValue];
//        [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithDouble:oldx] forKey:@"oldx" ];
//        [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithDouble:oldy] forKey:@"oldy" ];
//        [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithDouble:oldz] forKey:@"oldz" ];
//        
//        NSLog(@"old is %.20f, y is %.20f, z is %.20f",oldx, oldy, oldz);
//    }
//
//    ;
//    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithDouble:acceleration.x] forKey:@"x" ];
//    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithDouble:acceleration.y] forKey:@"y" ];
//    [[NSUserDefaults standardUserDefaults] setValue:[NSNumber numberWithDouble:acceleration.x] forKey:@"z" ];
//    
//    double x = [[[NSUserDefaults standardUserDefaults] valueForKey:@"x"]  doubleValue];
//    
//    double y = [[[NSUserDefaults standardUserDefaults] valueForKey:@"y"]  doubleValue];
//    
//    double z = [[[NSUserDefaults standardUserDefaults] valueForKey:@"z"]  doubleValue];
//   
//     NSLog(@"new is %.20f, y is %.20f, z is %.20f",x, y, z);
//    
////	[glView setAccel:accel];
////     NSLog(@"accelx is %0.20f", accel[0]);
////    glView.accelx = 1.2;//acceleration.x;
////    glView.test = @"dfafd";
////    NSLog(@"accelx is %0.20f", glView.accelx);
////    NSLog(@"test is %@", glView.test);
// //   [glView setAccelx:acceleration.x];
//}

@end
