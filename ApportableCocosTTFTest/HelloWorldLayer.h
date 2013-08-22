//
//  HelloWorldLayer.h
//  ApportableCocosTTFTest
//
//  Created by Ironhide on 22/8/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <CCTargetedTouchDelegate>

@property (nonatomic, assign) NSObject* label;

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
