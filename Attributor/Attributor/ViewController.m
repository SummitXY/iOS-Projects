//
//  ViewController.m
//  Attributor
//
//  Created by apple on 2019/3/25.
//  Copyright © 2019 Chauncey Qu. All rights reserved.
//

#import "ViewController.h"
#import "AnalyzeTextViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;

@end

@implementation ViewController
- (IBAction)changeBodySelectionColorToMatchBackgroundOfButton:(UIButton *)sender {
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName value:sender.backgroundColor range:self.body.selectedRange];
}


- (IBAction)outLine:(UIButton *)sender {
    
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-3,
                                          NSStrokeColorAttributeName : [UIColor blackColor]
                                          }  range:self.body.selectedRange];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString* title = [[NSMutableAttributedString alloc]initWithString: self.outlineButton.currentTitle];
    
    [title setAttributes:@{NSStrokeWidthAttributeName:@5,
                           NSStrokeColorAttributeName:self.outlineButton.tintColor
                           } range:NSMakeRange(0, [title length])];
    
    [self.outlineButton setAttributedTitle:title forState:UIControlStateNormal];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"analyze"] ) {
        if ([segue.destinationViewController isKindOfClass:[AnalyzeTextViewController class]]) {
            AnalyzeTextViewController* analyzeTextViewController = (AnalyzeTextViewController*) segue.destinationViewController;
            analyzeTextViewController.textToAnalyze = self.body.textStorage;
        }
    }
}


@end
