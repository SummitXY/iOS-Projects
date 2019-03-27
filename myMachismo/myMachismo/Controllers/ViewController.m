//
//  ViewController.m
//  myMachismo
//
//  Created by apple on 2019/3/23.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

- (IBAction)clickBtn:(UIButton *)sender;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardBtns;
@property (strong, nonatomic) CardMatchingGame* game;
@property (strong,nonatomic) NSMutableArray* test;
@property (nonatomic,strong) Card* isFaceUpAndNotMatchedCard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
    //[self.game showCards];

}

//MARK:- ToolFunction

- (void) setFaceUpCardBtn:(UIButton*) cardBtn withCard:(Card*) card{
    [cardBtn setTitle:card.contents forState:UIControlStateNormal];
    [cardBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [cardBtn setBackgroundColor:[UIColor grayColor]];
    [cardBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void) setFaceDownCardBtn:(UIButton*) cardBtn{
    [cardBtn setTitle:@"" forState:UIControlStateNormal];
    [cardBtn setBackgroundImage:[UIImage imageNamed:@"Live"] forState:UIControlStateNormal];
    [cardBtn setBackgroundColor:nil];
}

- (void) updateUI{
    for(UIButton* cardbtn in self.cardBtns){
        NSInteger cardIdx = [self.cardBtns indexOfObject:cardbtn];
        Card* card = [self.game cardAtIndexOf:cardIdx];
        cardbtn.enabled = !(card.isMatched || card.isFaceUp);
        
        if (card.isFaceUp ) {
            [self setFaceUpCardBtn:cardbtn withCard:card];
        } else {
            [self setFaceDownCardBtn:cardbtn];
        }
        
    }
}

- (void) checkMatchingCard:(Card*) card{
    if (!self.isFaceUpAndNotMatchedCard) {
        card.isFaceUp = YES;
        self.isFaceUpAndNotMatchedCard = card;
    } else {
        if ([self.isFaceUpAndNotMatchedCard match:card]) {
            card.isFaceUp = YES;
            card.isMatched = YES;
            self.isFaceUpAndNotMatchedCard.isMatched = YES;
            
            self.isFaceUpAndNotMatchedCard = nil;
        } else {
            card.isFaceUp = YES;
            self.isFaceUpAndNotMatchedCard.isFaceUp = NO;
            self.isFaceUpAndNotMatchedCard = card;
        }
    }
}

//MARK:- Property
- (CardMatchingGame *)game{
    if (!_game) {
        NSLog(@"game init start");
        _game = [[CardMatchingGame alloc]initWithCount:[self.cardBtns count]];
        NSLog(@"game init end");
    }
    return _game;
}



//MARK:- IBAction
- (IBAction)clickBtn:(UIButton *)sender {
    NSInteger cardIdx = [self.cardBtns indexOfObject:sender];
    //NSLog(@"%ld",(long)cardIdx);
    Card* card = [self.game cardAtIndexOf:cardIdx];
    //NSLog(@"sucess");
    
    [self checkMatchingCard:card];
    [self updateUI];
    
}


@end
