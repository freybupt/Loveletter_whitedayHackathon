//
//  LetterViewController.m
//  Hackathon
//
//  Created by Liang Shi on 12-03-10.
//  Copyright (c) 2012 University of Alberta. All rights reserved.
//

#import "LetterViewController.h"

@implementation LetterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)updateView:(id)sender{
    if ([guessText.text isEqualToString:@"a"]) {
        [letterA setHidden:NO];
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void) textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"begin");
    if ([guessText.text isEqualToString:@"a"]) {
        [letterA setHidden:NO];
    }
}

- (void) textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"end");
    [self updateView:textField];
}

-(BOOL) textFieldShouldEndEditing:(UITextField *)textField{
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ([guessText.text isEqualToString:@"a"]) {
        [letterA setHidden:NO];
    }else if ([guessText.text isEqualToString:@"b"]) {
        [letterB setHidden:NO];
    }else if ([guessText.text isEqualToString:@"d"]) {
        [letterD setHidden:NO];
    }else if ([guessText.text isEqualToString:@"e"]) {
        [letterE setHidden:NO];
    }else if ([guessText.text isEqualToString:@"i"]) {
        [letterI setHidden:NO];
    }else if ([guessText.text isEqualToString:@"l"]) {
        [letterL setHidden:NO];
    }else if ([guessText.text isEqualToString:@"o"]) {
        [letterO setHidden:NO];
    }else if ([guessText.text isEqualToString:@"r"]) {
        [letterR setHidden:NO];
    }else if ([guessText.text isEqualToString:@"s"]) {
        [letterS setHidden:NO];
    }else if ([guessText.text isEqualToString:@"t"]) {
        [letterT setHidden:NO];
    }else if ([guessText.text isEqualToString:@"u"]) {
        [letterU setHidden:NO];
    }else if ([guessText.text isEqualToString:@"v"]) {
        [letterV setHidden:NO];
    }
    guessText.text = @"";
    if (!letterA.hidden && !letterB.hidden && !letterD.hidden && !letterE.hidden && !letterI.hidden && !letterL.hidden && !letterO.hidden && !letterR.hidden && !letterS.hidden && !letterT.hidden && !letterU.hidden && !letterV.hidden){
        
        [guessText resignFirstResponder];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Bckgrnd_Success.png"]];
        [self.view addSubview:imgView];
    }
    return YES;
}

#pragma mark - helper
- (IBAction)back:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    guessText.delegate = self;
    [letterA setHidden:YES];
    [letterB setHidden:YES];
    [letterD setHidden:YES];
    [letterE setHidden:YES];
    [letterI setHidden:YES];
    [letterL setHidden:YES];
    [letterO setHidden:YES];
    [letterR setHidden:YES];
    [letterS setHidden:YES];
    [letterT setHidden:YES];
    [letterU setHidden:YES];
    [letterV setHidden:YES];
    [guessText becomeFirstResponder];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
//    if ([guessText.text isEqualToString:@"a"]) {
//        [letterA setHidden:NO];
//    }
    
    
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end
