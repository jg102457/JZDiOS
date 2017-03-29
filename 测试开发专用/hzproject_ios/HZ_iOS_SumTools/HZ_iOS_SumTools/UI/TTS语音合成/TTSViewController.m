//
//  TTSViewController.m
//  HZ_iOS_SumTools
//
//  Created by jason on 17/1/12.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TTSViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface TTSViewController ()

@end

@implementation TTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //语音播报
    AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:@"床前明月光，疑是地上霜。"];
    
    utterance.pitchMultiplier=0.8;
    
    //中式发音
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    //英式发音
    //    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-GB"];
    
    utterance.voice = voice;
    
    NSLog(@"%@",[AVSpeechSynthesisVoice speechVoices]);
    
    AVSpeechSynthesizer *synth = [[AVSpeechSynthesizer alloc]init];
    
    [synth speakUtterance:utterance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
