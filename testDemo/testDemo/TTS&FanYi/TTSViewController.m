//
//  TTSViewController.m
//  TextToSoundDemo
//
//  Created by songtao on 2018/9/26.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "TTSViewController.h"
#import <AVFoundation/AVFoundation.h>
#define kMargin 10
#define kScreenW [UIScreen mainScreen].bounds.size.width

#import "MyTextView.h"

#import "FanYiTool.h"
#import "SuspensionDisplayView.h"

@interface TTSViewController () <AVSpeechSynthesizerDelegate, UITextViewDelegate>

@property (nonatomic) AVSpeechSynthesizer *speechSynth;
@property (nonatomic) AVSpeechUtterance *speechUtt;

@property (nonatomic) UITextView *inputTextV;
@property (nonatomic) UIButton *btn1;//翻译
@property (nonatomic) UIButton *btn2;//阅读
@property (nonatomic) SuspensionDisplayView *showView;

@end

@implementation TTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"英语学习";
    self.view.backgroundColor = UIColor.whiteColor;
    
    MyTextView *textV1 = [[MyTextView alloc] initWithFrame:CGRectMake(kMargin, 75, kScreenW-kMargin*2, 150)];
    textV1.backgroundColor = UIColor.grayColor;
    textV1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textV1];
    [textV1 addClearButtonWith:[UIImage imageNamed:@""]];
    textV1.delegate = self;
    _inputTextV = textV1;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = UIColor.grayColor;
    btn.frame = CGRectMake(kMargin, 235, kScreenW-kMargin*2, 50);
    [btn setTitle:@"翻译" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.btn1 = btn;
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = UIColor.grayColor;
    btn.frame = CGRectMake(kMargin, 295, kScreenW-kMargin*2, 50);
    [btn setTitle:@"阅读" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.btn2 = btn;    
}

- (void)btnClick:(UIButton *)btn{
    NSString *string = [_inputTextV.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (string.length<=0) {
        NSLog(@"输入框不可为空！！！");
    }
    
    if (btn == self.btn1) {
        __block typeof(self) weaksekf = self;
        [FanYiTool fanyiSrcStr:string toResult:^(NSString * _Nonnull dstStr) {
            //NSLog(@"%@", dstStr);
            weaksekf.showView.content = dstStr;
            weaksekf.showView.hidden = NO;
        }];
    } else {
        if (self.speechSynth.isSpeaking==NO) {//未播放状态开始播放
            [self.speechSynth speakUtterance:self.speechUtt];
        }else{
            if (self.speechSynth.isPaused==0) {//播放时未暂停时暂停
                [self.speechSynth pauseSpeakingAtBoundary:AVSpeechBoundaryWord];
            }else{//暂停时继续播放
                [self.speechSynth continueSpeaking];
            }
        }
    }
    
}

- (SuspensionDisplayView *)showView{
    if (_showView==nil) {
        _showView = [[SuspensionDisplayView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:_showView];
    }
    return _showView;
}

#pragma mark - 生成AVSpeechSynthesizer
/**
 Speech:演讲
 Synthesizer:合成器
 */
- (AVSpeechSynthesizer *)speechSynth{
    if (_speechSynth==nil) {
        _speechSynth = [[AVSpeechSynthesizer alloc] init];
        _speechSynth.delegate = self;
    }
    return _speechSynth;
}

#pragma mark AVSpeechSynthesizerDelegate
- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didStartSpeechUtterance:(AVSpeechUtterance*)utterance{
    //开始
    [self.btn2 setTitle:@"Pause" forState:UIControlStateNormal];
    NSLog(@"didStartSpeechUtterance，%d, %d", self.speechSynth.speaking, self.speechSynth.paused);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance*)utterance{
    //完成
    [self.btn2 setTitle:@"Start" forState:UIControlStateNormal];
    NSLog(@"didFinishSpeechUtterance，%d, %d", self.speechSynth.speaking, self.speechSynth.paused);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance*)utterance{
    //暂停
    [self.btn2 setTitle:@"Continue" forState:UIControlStateNormal];
    NSLog(@"didPauseSpeechUtterance，%d, %d", self.speechSynth.speaking, self.speechSynth.paused);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance*)utterance{
    //恢复
    [self.btn2 setTitle:@"Pause" forState:UIControlStateNormal];
    NSLog(@"didContinueSpeechUtterance，%d, %d", self.speechSynth.speaking, self.speechSynth.paused);
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance*)utterance{
    //取消
    [self.btn2 setTitle:@"Start" forState:UIControlStateNormal];
}

#pragma mark - 生成AVSpeechUtterance
/**
 Utterance:话语
 */
- (AVSpeechUtterance *)speechUtt{
    if (_speechUtt==nil) {
        _speechUtt = [AVSpeechUtterance speechUtteranceWithString:self.inputTextV.text];
        _speechUtt.pitchMultiplier = 1;//音调调节  调节范围 ：[0.5 - 2]  默认是：1
        _speechUtt.volume = 1;//音量调节  调节范围 ：[0-1]  默认是 ：1
        _speechUtt.rate = 0.5;//语速调节  调节范围 ：[0-1]  0最慢  1 最快
        //设置语种
        AVSpeechSynthesisVoice *language = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        _speechUtt.voice = language;
    }
    return _speechUtt;
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{
    if (self.speechSynth.isSpeaking) {//输入框中的文本改变时，停止转换
        [self.speechSynth stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    }
    //输入框中的文本改变时，AVSpeechUtterance置空
    if (_speechUtt) {
        _speechUtt = nil;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

@end
