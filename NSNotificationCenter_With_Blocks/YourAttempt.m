//
//  YourAttempt.m
//  NSNotificationCenter_With_Blocks
//
//  Created by Drew Crawford on 10/24/13.
//  Copyright (c) 2013 DrewCrawfordApps. All rights reserved.
//

#import "YourAttempt.h"
#import "shared.h" //get counter, notificationName, etc.
@implementation YourAttempt {
    id _token;
}
- (instancetype)init
{
    self = [super init];
    if (!self) return nil;

    __weak typeof(self) weakSelf = self;
    _token = [[NSNotificationCenter defaultCenter]
              addObserverForName:notificationName object:nil
              queue:[NSOperationQueue mainQueue] usingBlock:
        ^(NSNotification * _Nonnull note) {
            typeof(self) self = weakSelf;
            if (!self) return;

            counter += 1;
            self.localCounter += 1;
        }];
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:_token];
}
@end
