//
//  CSBlockyProgress.m
//  CSBlockyProgress
//
//  Created by Christian Sampaio on 2/10/14.
//  Copyright (c) 2014 Me. All rights reserved.
//

#import "CSBlockyProgress.h"

@interface CSBlockyProgress()

@property (nonatomic, weak) NSProgress *observedProgress;

@end

@implementation CSBlockyProgress

- (void)setCompletedUnitCount:(int64_t)completedUnitCount
{
    if (self.progressChangeHandler)
    {
        self.progressChangeHandler(self.totalUnitCount, completedUnitCount);
    }
    [super setCompletedUnitCount:completedUnitCount];
}

- (void)observeAnotherProgress:(NSProgress *)progress
{
    if (self.observedProgress)
    {
        [self.observedProgress removeObserver:self
                                   forKeyPath:NSStringFromSelector(@selector(completedUnitCount))];
    }
    self.observedProgress = progress;
    self.totalUnitCount = progress.totalUnitCount;
    self.completedUnitCount = progress.completedUnitCount;
    
    [progress addObserver:self
               forKeyPath:NSStringFromSelector(@selector(completedUnitCount))
                  options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                  context:nil];
}

- (void)dealloc
{
    [self.observedProgress removeObserver:self
                               forKeyPath:NSStringFromSelector(@selector(completedUnitCount))];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    BOOL observedProgressChange = ([keyPath isEqualToString:NSStringFromSelector(@selector(completedUnitCount))]
                                   && object == self.observedProgress
                                   );
    
    if (observedProgressChange)
    {
        self.totalUnitCount = self.observedProgress.totalUnitCount;
        self.completedUnitCount = self.observedProgress.completedUnitCount;
    }
}

@end
