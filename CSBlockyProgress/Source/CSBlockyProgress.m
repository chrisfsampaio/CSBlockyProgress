//
//  CSBlockyProgress.m
//  CSBlockyProgress
//
//  Created by Christian Sampaio on 2/10/14.
//  Copyright (c) 2014 Me. All rights reserved.
//

#import "CSBlockyProgress.h"

@implementation CSBlockyProgress

- (void)setCompletedUnitCount:(int64_t)completedUnitCount
{
    if (self.progressChangeHandler)
    {
        self.progressChangeHandler(self.totalUnitCount, completedUnitCount);
    }
    [super setCompletedUnitCount:completedUnitCount];
}

@end
