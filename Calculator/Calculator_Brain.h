//
//  Calculator_Brain.h
//  Calculator
//
//  Created by Mehrdad on 2020-10-02.
//  Copyright © 2020 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator_Brain : NSObject

// Custom Initialization
//-(instancetype)initWithArray: (NSMutableArray*)newNumbers;

// Public methods declaration
-(void)pushItem: (double)number;
-(double)calculate: (NSString*)opeartion;
-(void)clearNumbers;

@end

NS_ASSUME_NONNULL_END
