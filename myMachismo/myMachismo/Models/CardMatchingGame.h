//
//  CardMatchingGame.h
//  myMachismo
//
//  Created by apple on 2019/3/24.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PokerDeck.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardMatchingGame : NSObject

- (instancetype)initWithCount:(NSUInteger)count ;
- (Card*) cardAtIndexOf:(NSUInteger) index;
- (void) showCards;

@end

NS_ASSUME_NONNULL_END
