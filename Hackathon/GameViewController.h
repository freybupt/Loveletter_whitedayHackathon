//
//  GameViewController.h
//  Hackathon
//
//  Created by Liang Shi on 12-03-10.
//  Copyright (c) 2012 University of Alberta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface GameViewController : UIViewController <UIAccelerometerDelegate>{
    UIImageView *leftImage;
    UIImageView *rightImage;
    UIImageView *centerImage;
    
//    UIAccelerationValue	*accel;
//    BOOL animating;
//     NSTimer *animationTimer;
//    NSInteger animationFrameInterval;
    
    double accelx;
    double accely;
    double accelz;
    
    double old_accelx;
    double old_accely;
    double old_accelz;
    
    IBOutlet UILabel *labelX;
    IBOutlet UILabel *labelY;
    IBOutlet UILabel *labelZ;
    
//    NSString *test;
    UIAccelerometer *accelerometer;
    
    AVAudioPlayer *beep;
}

//@property (readonly, nonatomic, getter=isAnimating) BOOL animating;
//@property (assign, nonatomic) double accelx;
//@property (retain, nonatomic) NSString *test;

//@property (nonatomic) NSInteger animationFrameInterval;


@property (nonatomic, retain) IBOutlet UIImageView *leftImage;
@property (nonatomic, retain) IBOutlet UIImageView *rightImage;
@property (nonatomic, retain) IBOutlet UIImageView *centerImage;
//@property (nonatomic) UIAccelerationValue *accel;

@property (nonatomic, retain) UIAccelerometer *accelerometer;

- (IBAction)back:(id)sender;
- (IBAction)loadLetterView;

//-(void)startAnimation;
//-(void)stopAnimation;
//-(void)drawView;
//- (IBAction)popoutLetterView:(id)sender;
- (void) playBeep:(NSString *)audioName: (NSString *)audioType;

@end
