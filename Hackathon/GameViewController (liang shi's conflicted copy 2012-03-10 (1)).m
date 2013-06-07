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

@synthesize leftImage, rightImage, centerImage;

@synthesize animating;
@dynamic animationFrameInterval;
@synthesize accel;
@synthesize accelx;
@synthesize test;

// MACROS
#define DEGREES_TO_RADIANS(__ANGLE__) ((__ANGLE__) / 180.0 * M_PI)

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        animating = FALSE;
        animationFrameInterval = 1;
		
		animationTimer = nil;
        accel = calloc(3, sizeof(UIAccelerationValue));
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - helper
- (IBAction)back:(id)sender{
//    [self.navigationController popViewControllerAnimated:YES];
    [self dismissModalViewControllerAnimated:YES];
}
- (void) startAnimation
{
	if (!animating)
	{

        animationTimer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)((1.0 / 60.0) * animationFrameInterval) target:self selector:@selector(drawView) userInfo:nil repeats:TRUE];
		
		animating = TRUE;
	}
}

- (void)stopAnimation
{
	if (animating)
	{
		
			[animationTimer invalidate];
			animationTimer = nil;
		
		
		animating = FALSE;
	}
}

// Updates the OpenGL view
- (void)drawView
{
	
    CALayer *layer = leftImage.layer.presentationLayer;
    CGRect layerFrame = layer.frame;
	GLfloat matrix[4][4], length;
    
   	//Make sure we have a big enough acceleration vector
    
    double oldx = [[[NSUserDefaults standardUserDefaults] valueForKey:@"oldx"] doubleValue];

    
    double oldy = [[[NSUserDefaults standardUserDefaults] valueForKey:@"oldy"] doubleValue];

    
    double oldz = [[[NSUserDefaults standardUserDefaults] valueForKey:@"oldz"] doubleValue];

    double xVal = [[[NSUserDefaults standardUserDefaults] valueForKey:@"x"] doubleValue];
    double yVal =[[[NSUserDefaults standardUserDefaults] valueForKey:@"y"] doubleValue];
    double zVal = [[[NSUserDefaults standardUserDefaults] valueForKey:@"z"] doubleValue];
    
    
    NSLog(@"accelx is %.20f, y is %.20f, z is %.20f", (xVal-oldx), (yVal-oldy), zVal);

    length = sqrtf(xVal*xVal + yVal*yVal +zVal*zVal);
	//length = accel[0] * accel[0] + accel[1] * accel[1] + accel[2] * accel[2];
    
    NSLog(@"length is %f", length);
    if(length >= 0.1)
	{
        if ((xVal-oldx)>0.01 && (yVal-oldy) >0.01){
		centerImage.center = CGPointMake(centerImage.center.x+xVal*10, centerImage.center.y+ (-yVal)*10);
        }
        else if((xVal-oldx) < -0.01 && (yVal-oldy) >0.01){
            centerImage.center = CGPointMake(centerImage.center.x+xVal*10, centerImage.center.y+ (-yVal)*10);
        }
        else if((xVal - oldx) < -0.01 && (yVal -oldy) < -0.01){
            centerImage.center = CGPointMake(centerImage.center.x+xVal*10, centerImage.center.y+ (-yVal)*10);
        }
        
        else if ((xVal - oldx) > 0.01 && (yVal - oldy) < -0.01 ){
            centerImage.center = CGPointMake(centerImage.center.x+xVal*10, centerImage.center.y+ (-yVal)*10);
        }
        NSLog(@"center image x is %f y is %f", centerImage.center.x, centerImage.center.y);
        if (centerImage.center.x > 280){
            centerImage.center= CGPointMake(centerImage.center.x - 10, centerImage.center.y);
        }
        if (centerImage.center.y > 400){
            centerImage.center = CGPointMake(centerImage.center.x, centerImage.center.y - 10);
        }
	}
	
}

- (IBAction)popoutLetterView:(id)sender{
    
    
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIView beginAnimations:@"leftImageMoving" context:NULL];
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:100];
    [leftImage setCenter:CGPointMake(30, 300)];
    [rightImage setCenter:CGPointMake(420, 10)];
    
    [UIView commitAnimations];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [self startAnimation];
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
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
