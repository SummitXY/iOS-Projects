//
//  Poker.m
//  myMachismo
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "Poker.h"

@interface Poker()

@end

@implementation Poker
@synthesize suit = _suit, rank = _rank;


- (BOOL)match:(Card *)card{
    Poker* poker = (Poker*) card;
    return [self.suit isEqualToString:poker.suit];
}

- (NSString *)contents{
    return [NSString stringWithFormat:@"%@%@",self.rank,self.suit];
}

+(NSArray*) getValidPokerRanks{
    return @[@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    //return @[@"A",@"2",@"3"];
}

+(NSArray*) getValidPokerSuits{
    return @[@"♥️",@"♠️",@"♦️",@"♣️"];
    //return @[@"♥️"];
    
}

- (void)setRank:(NSString *)rank{
    if ([[Poker getValidPokerRanks] containsObject:rank]) {
        _rank = rank;
    }
}

- (NSString *)rank{
    if (!_rank) {
        _rank = @"?";
    }
    return _rank;
}


- (void)setSuit:(NSString *)suit{
    if ([[Poker getValidPokerSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit{
    if (!_suit) {
        _suit = @"?";
    }
    return _suit;
}


@end
