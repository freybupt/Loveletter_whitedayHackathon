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

        animationTimer = [NSTimer scheduledTimerWithTimeInterval:(NSTimeInterval)((1.0 / 100.0) * animationFrameInterval) target:self selector:@selector(drawView) userInfo:nil repeats:TRUE];
		
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
    
    double xVal = [[[NSUserDefaults standardUserDefaults] valueForKey:@"x"] doubleValue];
    double yVal =[[[NSUserDefaults standardUserDefaults] valueForKey:@"y"] doubleValue];
    double zVal = [[[NSUserDefaults standardUserDefaults] valueForKey:@"z"] doubleValue];
    
    
    NSLog(@"accelx is %.20f, y is %.20f, z is %.20f", xVal, yVal, zVal);

    length = xVal*xVal + yVal*yVal +zVal*zVal;
	//length = accel[0] * accel[0] + accel[1] * accel[1] + accel[2] * accel[2];
    
    NSLog(@"length is %f", length);
    if(length >= 0.1)
	{
		//Clear matrix to be used to rotate from the current referential to one based on the gravity vector
		bzero(matrix, sizeof(matrix));
		matrix[3][3] = 1.0;
		
		//Setup first matrix column as gravity vector
		matrix[0][0] = accel[0] / length;
		matrix[0][1] = accel[1] / length;
		matrix[0][2] = accel[2] / length;
        
		//Setup second matrix column as an arbitrary vector in the plane perpendicular to the gravity vector {Gx, Gy, Gz} defined by by the equation "Gx * x + Gy * y + Gz * z = 0" in which we arbitrarily set x=0 and y=1
		matrix[1][0] = 0.0;
		matrix[1][1] = 1.0;
		matrix[1][2] = -accel[1] / accel[2];
		length = sqrtf(matrix[1][0] * matrix[1][0] + matrix[1][1] * matrix[1][1] + matrix[1][2] * matrix[1][2]);
		matrix[1][0] /= length;
		matrix[1][1] /= length;
		matrix[1][2] /= length;
		
		//Setup third matrix column as the cross product of the first two
		matrix[2][0] = matrix[0][1] * matrix[1][2] - matrix[0][2] * matrix[1][1];
		matrix[2][1] = matrix[1][0] * matrix[0][2] - matrix[1][2] * matrix[0][0];
		matrix[2][2] = matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
		
		//Finally load matrix
		glMultMatrixf((GLfloat*)matrix);
		
		// Rotate a bit more so that its where we want it.
		glRotatef(90.0, 0.0, 0.0, 1.0);
	}
	// If we're in the simulator we'd like to do something more interesting than just sit there
	// But if we're on a device, we want to just let the accelerometer do the work for us without a fallback.
#if TARGET_IPHONE_SIMULATOR
	else
	{
		static GLfloat spinX = 0.0, spinY = 0.0;
		glRotatef(spinX, 0.0, 0.0, 1.0);
		glRotatef(spinY, 0.0, 1.0, 0.0);
		glRotatef(90.0, 1.0, 0.0, 0.0);
		spinX += 1.0;
		spinY += 0.25;
	}
#endif
    
//	// Draw teapot. The new_teapot_indicies array is an RLE (run-length encoded) version of the teapot_indices array in teapot.h
//	for(int i = 0; i < num_teapot_indices; i += new_teapot_indicies[i] + 1)
//	{
//		glDrawElements(GL_TRIANGLE_STRIP, new_teapot_indicies[i], GL_UNSIGNED_SHORT, &new_teapot_indicies[i+1]);
//	}
//    
//	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
//	[context presentRenderbuffer:GL_RENDERBUFFER_OES];
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
