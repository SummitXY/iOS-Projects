//
//  Deck.m
//  myMachismo
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (nonatomic, strong) NSMutableArray* deck;
@end

@implementation Deck

- (void)showDeck{
    if (![self.deck count]) {
        NSLog(@"deck is empty");
    } else {
        for(Card* card in self.deck) {
            NSLog(@"%@",card.contents);
        }
    }
}

- (NSMutableArray *)deck{
    if (!_deck) {
        _deck = [[NSMutableArray alloc]init];
    }
    return _deck;
}

- (void)addCardToDeck:(Card *)card inTop:(BOOL)isInTop{
    if (isInTop) {
        [self.deck addObject:card];
    } else{
        [self.deck insertObject:card atIndex:0];
    }
}

- (void)addCardToDeck:(Card *)card{
    [self addCardToDeck:card inTop:YES];
}

- (Card *)randomDrawOneCard{
    if ([self.deck count]) {
        NSUInteger randomIndex = arc4random()%([self.deck count]);
        Card* card = self.deck[randomIndex];
        [self.deck removeObjectAtIndex:randomIndex];
        return card;
    }
    return nil;
}



@end
