//
//  PokerDeck.m
//  myMachismo
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "PokerDeck.h"

@implementation PokerDeck

- (instancetype)init
{
    self = [super init];
    if (self) {
        for(NSString* rank in [Poker getValidPokerRanks]){
            for(NSString* suit in [Poker getValidPokerSuits]){
                Poker* poker = [[Poker alloc]init];
                poker.rank = rank;
                poker.suit = suit;
                
                [self addCardToDeck:poker];
                
            }
        }
    }
    return self;
}

@end
