//
//  ViewController.m
//  Hackathon
//
//  Created by Liang Shi on 12-03-10.
//  Copyright (c) 2012 University of Alberta. All rights reserved.
//

#import "ViewController.h"
#import "InstructionViewController.h"
#import "GameViewController.h"
#import "LetterViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - load

- (IBAction)loadInstruction:(id)sender{
    InstructionViewController *viewController = [[InstructionViewController alloc] initWithNibName:@"InstructionViewController" bundle:nil];
    [self presentModalViewController:viewController animated:YES];

}

- (IBAction)loadGame:(id)sender{
    GameViewController *viewController = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    [self presentModalViewController:viewController animated:YES];
    
}

- (IBAction)loadLetterView:(id)sender{
    LetterViewController *viewController= [[LetterViewController alloc] initWithNibName:@"LetterViewController" bundle:nil];
    [self presentModalViewController:viewController animated:YES];
//    [viewController.view setFrame:CGRectMake(0, 0, viewController.view.frame.size.width, viewController.view.frame.size.height)];
//    [self.view addSubview:viewController.view];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeLeft];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft); //|| interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
