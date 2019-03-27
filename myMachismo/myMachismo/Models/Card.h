//
//  Card.h
//  myMachismo
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#ifndef Card_h
#define Card_h

@interface Card : NSObject

@property (nonatomic,strong) NSString* contents;
@property (nonatomic) BOOL isMatched;
@property (nonatomic) BOOL isFaceUp;

- (BOOL) match:(Card*)card;

@end

#endif /* Card_h */
