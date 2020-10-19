//
//  ViewController.m
//  Calculator
//
//  Created by Mehrdad on 2020-10-08.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
// Private property
@property (nonatomic, strong) Calculator_Brain *calculator;

@end


@implementation ViewController

// MARK - Properties
BOOL isFirstDigit = YES;
NSString *operator;

// MARK - Synthesize
@synthesize Display, divisionButton, multiplyButton, subtractButton, addButton, equalButton, clearButton;
@synthesize zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton, nineButton;

@synthesize calculator = _calculator;
-(Calculator_Brain*)calculator {
    if (_calculator == nil) {
        _calculator = [[Calculator_Brain alloc]init];
    }
    return _calculator;
}



// MARK - ViewController LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Configure buttons
    [self configButtons];
}



// MARK - Methods

- (IBAction)DigitPressed:(id)sender {

    NSString *digit = ((UIButton*)sender).currentTitle;
    
    if (isFirstDigit) {
        Display.text = [NSString stringWithFormat:@"%@", digit];
        isFirstDigit = NO;
    } else {
        Display.text = [NSString stringWithFormat:@"%@%@", Display.text, digit];
    }
    
}


- (IBAction)Operator_Pressed:(id)sender {
    // Push the existing number in the array
    [self.calculator pushItem:[Display.text doubleValue]];
    isFirstDigit = YES;
    
    // NSString *operator = ((UIButton*)sender).currentTitle;
    
    switch ([sender tag]) {
        case 0:
            operator = @"/";
            break;
        case 1:
            operator = @"*";
            break;
        case 2:
            operator = @"-";
            break;
        case 3:
            operator = @"+";
            break;
        default:
            break;
    }
}


- (IBAction)equalPressed:(id)sender {
    [self.calculator pushItem:[Display.text doubleValue]];
    Display.text = [NSString stringWithFormat:@"%.2f", [self.calculator calculate:operator]];
    operator = @"";
    isFirstDigit = YES;
}


-(IBAction)clearScreen:(id)sender {
    [self.calculator clearNumbers];
    Display.text = @"0.0";
}


// Configure Buttons
- (void)configButtons {
    // operators configuration
    divisionButton.layer.cornerRadius = 10;
    multiplyButton.layer.cornerRadius = 10;
    subtractButton.layer.cornerRadius = 10;
    addButton.layer.cornerRadius = 10;
    equalButton.layer.cornerRadius = 10;
    clearButton.layer.cornerRadius = 10;
    
    // Digits configuration
    zeroButton.layer.cornerRadius = 5;
    oneButton.layer.cornerRadius = 5;
    twoButton.layer.cornerRadius = 5;
    threeButton.layer.cornerRadius = 5;
    fourButton.layer.cornerRadius = 5;
    fiveButton.layer.cornerRadius = 5;
    sixButton.layer.cornerRadius = 5;
    sevenButton.layer.cornerRadius = 5;
    eightButton.layer.cornerRadius = 5;
    nineButton.layer.cornerRadius = 5;
}



@end


