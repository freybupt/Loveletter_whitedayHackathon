//
//  LetterViewController.h
//  Hackathon
//
//  Created by Liang Shi on 12-03-10.
//  Copyright (c) 2012 University of Alberta. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LetterViewController : UIViewController <UITextFieldDelegate>{
    IBOutlet UIImageView *letterA;
    IBOutlet UIImageView *letterB;
    IBOutlet UIImageView *letterD;
    IBOutlet UIImageView *letterE;
    IBOutlet UIImageView *letterI;
    IBOutlet UIImageView *letterL;
    IBOutlet UIImageView *letterO;
    IBOutlet UIImageView *letterR;
    IBOutlet UIImageView *letterS;
    IBOutlet UIImageView *letterT;
    IBOutlet UIImageView *letterU;
    IBOutlet UIImageView *letterV;
    
    IBOutlet UITextField *guessText;
    
}
- (IBAction)updateView:(id)sender;
- (IBAction)back:(id)sender;


@end
