//
//  SHUViewController.m
//  SHULineBreakMode
//
//  Created by 酒井 秀平 on 2013/05/17.
//  Copyright (c) 2013年 shuketa. All rights reserved.
//

//http://stackoverflow.com/questions/15113461/decrease-the-width-of-the-last-line-in-multiline-uilabel

//


//
#import "SHUViewController.h"


@interface SHUViewController ()

@end

@implementation SHUViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //- (NSString*)stringByTruncatingStringWithFont:(UIFont *)font forWidth:(CGFloat)width lineBreakMode:(UILineBreakMode)lineBreakMode;
    
    NSString *test = @"sakai test desu bbb ccasdadafasfafasfasfasfafasfasfasfafaasfafac ddd eee fff ggg hhh iii jjj kkk lll mmm nnn";

    self.label2.text = test;
//    [self.label2 setTruncatingText:test forNumberOfLines:self.label2.numberOfLines];
  
    

    NSLog(@"test = %@", self.label2.text );
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
