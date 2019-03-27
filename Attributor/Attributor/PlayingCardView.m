//
//  PlayingCardView.m
//  Attributor
//
//  Created by apple on 2019/3/26.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (void)setRank:(NSUInteger)rank{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setSuit:(NSString *)suit{
    _suit = suit;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

#define CORNER_STANDARD_HEGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat) cornerScaleFactor{
    return self.bounds.size.height/CORNER_STANDARD_HEGHT;
}

- (CGFloat) cornerRadius{
    return CORNER_RADIUS*[self cornerScaleFactor];
}

- (void)drawRect:(CGRect)rect{
    UIBezierPath* roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    
    [roundedRect addClip];
    
    [[UIColor whiteColor]setFill];
    UIRectFill(self.bounds);
}

@end









