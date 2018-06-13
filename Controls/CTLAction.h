//
//  CTLAction.h
//  Controls
//
//  Created by Dan Kalinin on 6/14/18.
//

#import <UIKit/UIKit.h>
#import <Helpers/Helpers.h>

@class CTLAction;



@protocol CTLActionDelegate <HLPOperationDelegate>

@optional
- (void)CTLActionDidEnd:(CTLAction *)action;

@end



@interface CTLAction : HLPOperation <CTLActionDelegate>

@property (readonly) SurrogateArray<CTLActionDelegate> *delegates;
@property (readonly) NSString *identifier;

- (instancetype)initWithIdentifier:(NSString *)identifier delegate:(id<CTLActionDelegate>)delegate;

@end
