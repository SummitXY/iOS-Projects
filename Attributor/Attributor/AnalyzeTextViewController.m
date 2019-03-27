//
//  AnalyzeTextViewController.m
//  Attributor
//
//  Created by apple on 2019/3/25.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "AnalyzeTextViewController.h"

@interface AnalyzeTextViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharactersLabel;

@end

@implementation AnalyzeTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) {
        [self updateUI];
    }
    
}

- (NSAttributedString*) charactersWithAttribute:(NSString*)attributeName{
    NSMutableAttributedString* characters = [[NSMutableAttributedString alloc]init];
    
    
    int index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if(value){
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = range.location + range.length;
            
        } else {
            index ++;
        }
    }
    
    
    
    return characters;
}

- (void) updateUI {
    self.colorfulCharactorsLabel.text = [NSString stringWithFormat:@"%d colourful characters!", [[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    self.outlineCharactersLabel.text = [NSString stringWithFormat:@"%d outlined characters!", [[self charactersWithAttribute:NSStrokeWidthAttributeName] length]];
}


@end
