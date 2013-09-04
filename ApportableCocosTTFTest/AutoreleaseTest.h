//
//  AutoreleaseTest.h
//  ApportableCocosTTFTest
//
//  Created by Ironhide on 4/9/13.
//
//

#import <Foundation/Foundation.h>

@interface AutoreleaseTest : NSObject
@property (nonatomic, retain) NSString* tag;

- (id)initWithTag:(NSString*)tag;
@end
