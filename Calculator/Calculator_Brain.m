//
//  Calculator_Brain.m
//  Calculator
//
//  Created by Mehrdad on 2020-10-02.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import "Calculator_Brain.h"

@interface Calculator_Brain()
@property (nonatomic, strong) NSMutableArray *numbers;
@end


@implementation Calculator_Brain

@synthesize numbers = _numbers;
-(NSMutableArray*)numbers {
    if (_numbers == nil) {
        _numbers = [[NSMutableArray alloc]init];
    }
    return _numbers;
}


// Method Implementations

-(void)pushItem: (double)number {
    [self.numbers addObject:[NSNumber numberWithDouble:number]];
}


-(double)calculate: (NSString*)opeartion {
    double result = 0.0, firstNumber, secondNumber;
    firstNumber = [self popItem];
    secondNumber = [self popItem];
    
    if ([opeartion isEqualToString:@"+"]) {
        result = firstNumber + secondNumber;
    } else if ([opeartion isEqualToString:@"-"]) {
        result = secondNumber - firstNumber;
    } else if ([opeartion isEqualToString:@"*"]) {
        result = firstNumber * secondNumber;
    } else if ([opeartion isEqualToString:@"/"]) {
        result = secondNumber / firstNumber;
    } else {
        NSLog(@"The operation is invalid!");
    }
    return result;
}

// Private method
-(double)popItem {
    double lastNumber;
    lastNumber = [[self.numbers lastObject]doubleValue];
    [self.numbers removeLastObject];
    return lastNumber;
}

-(void)clearNumbers {
    [self.numbers removeAllObjects];
}

@end
