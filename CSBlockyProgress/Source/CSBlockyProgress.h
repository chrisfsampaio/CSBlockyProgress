//
//  CSBlockyProgress.h
//  CSBlockyProgress
//
//  Created by Christian Sampaio on 2/10/14.
//  Copyright (c) 2014 Me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSBlockyProgress : NSProgress

@property (nonatomic, copy) void(^progressChangeHandler)(int64_t totalUnitCount, int64_t completedUnitCount);

- (void)observeAnotherProgress:(NSProgress *)progress;

@end
