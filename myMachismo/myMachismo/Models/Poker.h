//
//  Poker.h
//  myMachismo
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Poker : Card

@property (nonatomic) NSString*         rank;
@property (nonatomic, strong) NSString* suit;

+(NSArray*) getValidPokerRanks;

+(NSArray*) getValidPokerSuits;


@end

NS_ASSUME_NONNULL_END
