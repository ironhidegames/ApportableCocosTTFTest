//
//  HelloWorldLayer.m
//  ApportableCocosTTFTest
//
//  Created by Ironhide on 22/8/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF* label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
        
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        if (size.width < size.height) {
            float realHeight = size.width;
            size.width = size.height;
            size.height = realHeight;
        }
        
        //CCLabelTTF * label = [CCLabelTTF labelWithString:@"Hello World" dimensions:CGSizeMake(size.width, size.height) alignment:UITextAlignmentLeft lineBreakMode:UILineBreakModeWordWrap fontName:@"Comic_Book" fontSize:64];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
        NSLog(@"LabelCoords: %@", NSStringFromCGPoint(label.position));
        NSLog(@"WindowsSize: %@", NSStringFromCGSize(size));
		
		// add the label as a child to this Layer
		[self addChild: label];
        self.label = label;
        
        
        CCSprite* sprite = [CCSprite node];
        [sprite setTextureRect:CGRectMake(0, 0, 50, 50)];
        sprite.position = ccp(0,100);
        [sprite runAction:[CCRepeatForever actionWithAction:[CCSequence actions:
                                                                [CCMoveBy actionWithDuration:5 position:ccp(size.width,0)],
                                                                [CCMoveBy actionWithDuration:5 position:ccp(-size.width,0)],
                                                            nil
                                                            ]
                          ]
         ];
        
        [self addChild:sprite];
	}
	return self;
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    
    [self.label setString:[NSString stringWithFormat:@"Hello World: %i",arc4random() ]];
    
    return YES;
}

- (void)onEnter
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:-1000 swallowsTouches:NO];
	[super onEnter];
}

- (void)onExit
{
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
