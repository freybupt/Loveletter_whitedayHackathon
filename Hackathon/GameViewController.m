//
//  GameViewController.m
//  Hackathon
//
//  Created by Liang Shi on 12-03-10.
//  Copyright (c) 2012 University of Alberta. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>
#import "GameViewController.h"
#import "LetterViewController.h"

@implementation GameViewController

@synthesize leftImage, rightImage, centerImage, accelerometer;

//@synthesize animating;
//@dynamic animationFrameInterval;
//@synthesize accel;
//@synthesize accelx;
//@synthesize test;

// MACROS
//#define DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) / 180.0 * M_PI)
//
//#define factor 200;
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//        animating = FALSE;
//        animationFrameInterval = 1;
//		
//		animationTimer = nil;
//        accel = calloc(3, sizeof(UIAccelerationValue));
//    }
//    return self;
//}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - helper
- (IBAction)back:(id)sender{
    self.accelerometer.delegate = nil;
    [self.view.layer removeAllAnimations];
    [self dismissModalViewControllerAnimated:NO];
}

//#pragma mark - helper
//- (IBAction)back:(id)sender{
////    [self.navigationController popViewControllerAnimated:YES];
//    [self dismissModalViewControllerAnimated:YES];
//}
//- (void) startAnimation
//{
//	if (!animating)
//	{
//
//        animationTimer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)((1.0 / 100.0) * animationFrameInterval) target:self selector:@selector(drawView) userInfo:nil repeats:TRUE];
//		
//		animating = TRUE;
//	}
//}
//
//- (void)stopAnimation
//{
//	if (animating)
//	{
//		
//			[animationTimer invalidate];
//			animationTimer = nil;
//		
//		
//		animating = FALSE;
//	}
//}
//
//// Updates the OpenGL view
//- (void)drawView
//{
//	
//	GLfloat matrix[4][4], length;
//    
//   	//Make sure we have a big enough acceleration vector
//    
//    double oldx = [[[NSUserDefaults standardUserDefaults] valueForKey:@"oldx"] doubleValue];
//
//    
//    double oldy = [[[NSUserDefaults standardUserDefaults] valueForKey:@"oldy"] doubleValue];
//
//    
////    double oldz = [[[NSUserDefaults standardUserDefaults] valueForKey:@"oldz"] doubleValue];
//
//    double xVal = [[[NSUserDefaults standardUserDefaults] valueForKey:@"x"] doubleValue];
//    double yVal =[[[NSUserDefaults standardUserDefaults] valueForKey:@"y"] doubleValue];
//    double zVal = [[[NSUserDefaults standardUserDefaults] valueForKey:@"z"] doubleValue];
//    
//    
//    NSLog(@"accelx is %.20f, y is %.20f, z is %.20f", xVal, yVal, zVal);
//
//    length = sqrtf(xVal*xVal + yVal*yVal +zVal*zVal);
//	//length = accel[0] * accel[0] + accel[1] * accel[1] + accel[2] * accel[2];
//    
//    NSLog(@"length is %f", length);
//    if(length >= 0.1)
//	{
//        if ((xVal-oldx)>0.001 && (yVal-oldy) >0.001){
//		centerImage.center = CGPointMake(centerImage.center.x+(xVal-oldx)*200, centerImage.center.y+ (-yVal+oldy)*200);
//        }
//        else if((xVal-oldx) < -0.001 && (yVal-oldy) >0.001){
//            centerImage.center = CGPointMake(centerImage.center.x+(xVal-oldx)*200, centerImage.center.y+ (-(yVal-oldy))*200);
//        }
//        else if((xVal - oldx) < -0.001 && (yVal -oldy) < -0.001){
//            centerImage.center = CGPointMake(centerImage.center.x+(xVal-oldx)*200, centerImage.center.y+ ((-yVal+oldy))*200);
//        }
//        
//        else if ((xVal - oldx) > 0.001 && (yVal - oldy) < -0.001 ){
//            centerImage.center = CGPointMake(centerImage.center.x+(xVal-oldx)*200, centerImage.center.y+ (-(yVal-oldy))*200);
//        }
//        NSLog(@"center image x is %f y is %f", centerImage.center.x, centerImage.center.y);
//        if (centerImage.center.x > 280){
//            centerImage.center= CGPointMake(centerImage.center.x - 10, centerImage.center.y);
//        }
//        if (centerImage.center.y > 400){
//            centerImage.center = CGPointMake(centerImage.center.x, centerImage.center.y - 10);
//        }
//	}
//	
//}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
        
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.updateInterval = .1;
    self.accelerometer.delegate = self;


    // Do any additional setup after loading the view from its nib.
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    old_accelx = accelx;
    old_accely = accely;
    
    accelx = acceleration.x;
    accely = acceleration.y;
    
//    double varx = accelx - old_accelx;
//    double vary = accely - old_accely;

    centerImage.center = CGPointMake(centerImage.center.x+(accely - old_accely)*200, centerImage.center.y+ (accelx-old_accelx)*200);
    
    labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
    labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
//    labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
    
    CALayer *layer = leftImage.layer.presentationLayer;
    CGRect layerFrame = layer.frame;
    
    CGPoint leftCenter = CGPointMake(layerFrame.origin.x+layerFrame.size.width/2, layerFrame.origin.y+layerFrame.size.height/2);
    
    if (ABS(leftCenter.x - centerImage.center.x) < 40 && ABS(leftCenter.y - centerImage.center.y) < 40) {
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationBeginsFromCurrentState:YES];
//        [UIView setAnimationDuration:0.1];
//        [UIView setAnimationCurve: UIViewAnimationCurveLinear];
        labelZ.text = @"Left!";
        [centerImage setImage:[UIImage imageNamed:@"Pink_lkleft.png"]];
        [leftImage setImage:[UIImage imageNamed:@"Blue_lkright.png"]];
        [self performSelector:@selector(loadLetterView) withObject:self afterDelay:1];
        [self playBeep:@"kiss" :@"wav"];
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationBeginsFromCurrentState:YES];
//        [UIView setAnimationDuration:0.1];
//        [UIView setAnimationCurve: UIViewAnimationCurveLinear];
        // other animation properties
        
        // set view properties
        
//        [UIView commitAnimations];
    }
//    else{
//        labelZ.text = @"";
//    }
    
    CALayer *layerRight = rightImage.layer.presentationLayer;
    CGRect layerFrameRight = layerRight.frame;
    
    CGPoint rightCenter = CGPointMake(layerFrameRight.origin.x+layerFrameRight.size.width/2, layerFrameRight.origin.y+layerFrameRight.size.height/2);
    
    if (ABS(rightCenter.x - centerImage.center.x) < 40 && ABS(rightCenter.y - centerImage.center.y) < 40) {
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationBeginsFromCurrentState:YES];
//        [UIView setAnimationDuration:0.1];
//        [UIView setAnimationCurve: UIViewAnimationCurveLinear];
        labelZ.text = @"Right!";
        [centerImage setImage:[UIImage imageNamed:@"Pink_lkright.png"]];
        [rightImage setImage:[UIImage imageNamed:@"Yellow_lkleft.png"]];
        [self performSelector:@selector(loadLetterView) withObject:self afterDelay:1];
        [self playBeep:@"kiss" :@"wav"];
        // other animation properties
        
        // set view properties
        
//        [UIView commitAnimations];
    }
//    else{
//        labelZ.text = @"";
//    }

}

- (void) initAudio:(NSString *)audioName: (NSString *)audioType {
    if(beep)
        return;
    NSError *error = nil;
    beep = [[AVAudioPlayer alloc]
            initWithContentsOfURL:
            [[NSBundle mainBundle]
             URLForResource: audioName
             withExtension: audioType]
            error: &error];
    if(!beep)
        NSLog(@"ERROR loading sound: %@: %@",
              [error localizedDescription],
              [error localizedFailureReason]);
    else {
        beep.volume = .5f;
        [beep prepareToPlay];
    }
}

- (void) playBeep:(NSString *)audioName: (NSString *)audioType {
    if(!beep)
        [self initAudio:audioName:audioType];
    [beep play];
}



- (IBAction)loadLetterView{
    LetterViewController *viewController= [[LetterViewController alloc] initWithNibName:@"LetterViewController" bundle:nil];
    [self presentModalViewController:viewController animated:YES];
    //    [viewController.view setFrame:CGRectMake(0, 0, viewController.view.frame.size.width, viewController.view.frame.size.height)];
    //    [self.view addSubview:viewController.view];
}


- (void)viewWillAppear:(BOOL)animated{
//    [self startAnimation];
    [leftImage setCenter:CGPointMake(30, 10)];
    [rightImage setCenter:CGPointMake(420, 300)];
    [UIView setAnimationsEnabled:YES];
    [UIView beginAnimations:@"leftImageMoving" context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:100];
    [leftImage setCenter:CGPointMake(30, 300)];
    [rightImage setCenter:CGPointMake(420, 10)];
    
    [UIView commitAnimations];

    
    [centerImage setImage:[UIImage imageNamed:@"Fuzzball_pink.png"]];
    [rightImage setImage:[UIImage imageNamed:@"Fuzzball_yellow.png"]];
    [leftImage setImage:[UIImage imageNamed:@"Fuzzball_blue.png"]];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
//    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
    
}

@end
