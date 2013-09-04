//
//  AutoreleaseTest.m
//  ApportableCocosTTFTest
//
//  Created by Ironhide on 4/9/13.
//
//

#import "AutoreleaseTest.h"

@implementation AutoreleaseTest

- (id)initWithTag:(NSString*)tag
{
    self = [super init];
    if (self) {
        self.tag = tag;
        NSLog(@"AUTORELEASE: INIT (tag:%@)",self.tag);
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"AUTORELEASE: DEALLOC (tag:%@)",self.tag);
    [_tag release];
    [super dealloc];
}

@end
