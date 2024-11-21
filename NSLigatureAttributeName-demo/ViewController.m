//
//  ViewController.m
//  NSLigatureAttributeName-demo
//
//  Created by Coston Perkins on 11/20/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSString *text = @"キロ, メートル coston";

    // Create labels to test different ligature settings
    [self createLabelWithText:text ligatureSetting:@0 yOffset:100 title:@"Ligature Disabled (0)"];
    [self createLabelWithText:text ligatureSetting:@1 yOffset:200 title:@"Standard Ligature (1)"];
    [self createLabelWithText:text ligatureSetting:@2 yOffset:300 title:@"All Ligatures (2)"];
}

- (void)createLabelWithText:(NSString *)text ligatureSetting:(NSNumber *)ligatureSetting yOffset:(CGFloat)yOffset title:(NSString *)title {
    CGFloat labelHeight = 50.0;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, yOffset - 30, self.view.frame.size.width - 40, 20)];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    [self.view addSubview:titleLabel];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, yOffset, self.view.frame.size.width - 40, labelHeight)];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;

    UIFont *robotoFont = [UIFont fontWithName:@"Roboto-Regular" size:16];
    if (!robotoFont) {
        NSLog(@"Roboto font not loaded. Check your font integration.");
        robotoFont = [UIFont systemFontOfSize:16];
    }

    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedText addAttribute:NSFontAttributeName value:robotoFont range:NSMakeRange(0, text.length)];
    [attributedText addAttribute:NSLigatureAttributeName value:ligatureSetting range:NSMakeRange(0, text.length)];

    label.attributedText = attributedText;
    [self.view addSubview:label];
}

@end
