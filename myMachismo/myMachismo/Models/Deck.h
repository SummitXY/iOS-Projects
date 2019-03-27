//
//  Deck.h
//  myMachismo
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

-(void) showDeck;

-(void) addCardToDeck:(Card*) card inTop:(BOOL)isInTop;
-(void) addCardToDeck:(Card*) card;
-(Card*) randomDrawOneCard;

@end

NS_ASSUME_NONNULL_END
