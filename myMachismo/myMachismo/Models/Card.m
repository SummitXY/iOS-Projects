//
//  Card.m
//  myMachismo
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Card()

@end

@implementation Card

- (NSString *)contents{
    if (!_contents) {
        _contents = @"no contents";
    }
    return _contents;
}

- (BOOL)isFaceUp{
    if (!_isFaceUp) {
        _isFaceUp = NO;
    }
    return _isFaceUp;
}

- (BOOL)isMatched{
    if (!_isMatched) {
        _isMatched = NO;
    }
    return _isMatched;
}

- (BOOL)match:(Card *)card{
    return [self.contents isEqualToString:card.contents];
}


@end
