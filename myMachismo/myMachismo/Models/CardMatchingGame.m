//
//  CardMatchingGame.m
//  myMachismo
//
//  Created by apple on 2019/3/24.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic,strong) NSMutableArray* cards;
@property (nonatomic,strong) PokerDeck* pokerDeck;

@end

@implementation CardMatchingGame

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    if (self) {
        for(NSUInteger i = 0;i<count;i++){
            NSLog(@"The %d randomDrawOneCard");
            Card* card = [self.pokerDeck randomDrawOneCard];
            if (card) {
                [self.cards addObject:card];
                NSLog(@"The %d randomDrawOneCard End");
            } else {
                [self.cards addObject:[[Poker alloc]init]];
            }
            
            
        }
        
    }
    return self;
}

- (void)showCards{
    
    for(Card* card in self.cards){
        NSLog(@"%@",card.contents);
    }
    
}

- (NSMutableArray *)cards{
    if (!_cards) {
        NSLog(@"cardMatching init start");
        _cards = [[NSMutableArray alloc]init];
        NSLog(@"cardMatching init end");
        
    }
    return _cards;
}

- (PokerDeck *)pokerDeck{
    if (!_pokerDeck) {
        NSLog(@"cardMatching pokerDeck init start");
        _pokerDeck = [[PokerDeck alloc]init];
        NSLog(@"cardMatching pokerDeck init end");
    }
    return _pokerDeck;
}

- (Card *)cardAtIndexOf:(NSUInteger)index{
    return self.cards[index];
}




@end





















