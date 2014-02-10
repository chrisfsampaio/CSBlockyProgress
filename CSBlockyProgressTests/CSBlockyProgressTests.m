//
//  CSBlockyProgressTests.m
//  CSBlockyProgressTests
//
//  Created by Christian Sampaio on 2/10/14.
//  Copyright (c) 2014 Me. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CSBlockyProgress.h"

@interface CSBlockyProgressTests : XCTestCase

@end

@implementation CSBlockyProgressTests

- (void)testThatTheBlockIsProperlyCalled
{
    CSBlockyProgress *progress = [CSBlockyProgress new];
    
    __block int64_t finalCompletedUnit = 0;
    [progress setProgressChangeHandler:^(int64_t total, int64_t completed) {
        finalCompletedUnit++;
    }];
    
    progress.totalUnitCount = 100;
    for (NSUInteger index = 0; index < progress.totalUnitCount; index++)
    {
        [progress setCompletedUnitCount:(int64_t)(index + 1)];
    }
    
    XCTAssertEqual(finalCompletedUnit, progress.totalUnitCount, @"Something went wrong on calling the progress change block 👎");
}

@end
