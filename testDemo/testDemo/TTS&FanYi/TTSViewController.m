//
//  TTSViewController.m
//  TextToSoundDemo
//
//  Created by songtao on 2018/9/26.
//  Copyright © 2018年 ryan. All rights reserved.
//

#import "TTSViewController.h"

#import "SpeechSettingController.h"
#import <AVFoundation/AVFoundation.h>
#import "MyTextView.h"
#import "SuspensionDisplayView.h"
#import "BaiduFanYiTool.h"

#define kMargin 10
#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface TTSViewController () <AVSpeechSynthesizerDelegate, UITextViewDelegate>
{
    float _pitchMultiplier;
    float _volume;
    float _rate;
}

@property (nonatomic) AVSpeechSynthesizer *speechSynth;
@property (nonatomic) AVSpeechUtterance *speechUtt;

@property (nonatomic) UITextView *inputTextV;
@property (nonatomic) UIButton *transbtn;//翻译
@property (nonatomic) UIButton *speechbtn;//阅读
@property (nonatomic) UIButton *pinspeechbtn;//拼读
@property (nonatomic) SuspensionDisplayView *showView;

@end

@implementation TTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"英语学习";
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"语音设置" style:UIBarButtonItemStyleDone target:self action:@selector(speechSetting)];
    
    MyTextView *textV1 = [[MyTextView alloc] initWithFrame:CGRectMake(kMargin, 75, kScreenW-kMargin*2, 150)];
    textV1.backgroundColor = UIColor.grayColor;
    textV1.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:textV1];
    //textV1.haveClearBtn = YES;
    textV1.delegate = self;
    _inputTextV = textV1;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = UIColor.grayColor;
    btn.frame = CGRectMake(kMargin, 235, kScreenW-kMargin*2, 50);
    [btn setTitle:@"翻译" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.transbtn = btn;
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = UIColor.grayColor;
    btn.frame = CGRectMake(kMargin, 295, kScreenW-kMargin*2, 50);
    [btn setTitle:@"阅读" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.speechbtn = btn;
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = UIColor.grayColor;
    btn.frame = CGRectMake(kMargin, 355, kScreenW-kMargin*2, 50);
    [btn setTitle:@"拼读" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.pinspeechbtn = btn;
    
    [self defaultValue];
}

- (void)speechSetting{
    __block typeof(self) weaksekf = self;
    SpeechSettingController *controller = [SpeechSettingController new];
    [controller setpvalue:_pitchMultiplier vvalue:_volume rvalue:_rate];
    controller.saveSettingValueBlock = ^(float pitchMultiplier, float volume, float rate) {
        [weaksekf changeValueWithPitchMultiplier:pitchMultiplier volume:volume rate:rate];
    };
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)btnClick:(UIButton *)btn{
    NSString *string = [_inputTextV.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if (string.length<=0) {
        NSLog(@"输入框不可为空！！！");
        return;
    }
    
    if (btn == self.transbtn) {
        __block typeof(self) weaksekf = self;
        [BaiduFanYiTool fanyiSrcStr:string toResult:^(NSString * _Nonnull dstStr) {
            //NSLog(@"%@", dstStr);
            weaksekf.showView.content = dstStr;
            weaksekf.showView.hidden = NO;
        }];
    } else {
        if (btn == self.pinspeechbtn) {
            NSMutableString *mutableStr = [NSMutableString stringWithString:string];
            for (NSInteger i=0; i+1<mutableStr.length; i++) {
                NSString *str = [mutableStr substringWithRange:NSMakeRange(i, 1)];
                if ([str isEqualToString:@" "]) {
                    continue;
                }else{
                    NSString *next = [mutableStr substringWithRange:NSMakeRange(i+1, 1)];
                    if ([next isEqualToString:@" "]) {
                        continue;
                    }else{
                        [mutableStr insertString:@" " atIndex:i+1];
                        i++;
                    }
                }
            }
            _inputTextV.text = mutableStr;
            _speechUtt = nil;
        }
        
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
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didPauseSpeechUtterance:(AVSpeechUtterance*)utterance{
    //暂停
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didContinueSpeechUtterance:(AVSpeechUtterance*)utterance{
    //恢复
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance*)utterance{
    //完成
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer*)synthesizer didCancelSpeechUtterance:(AVSpeechUtterance*)utterance{
    //取消
    
}

#pragma mark - 生成AVSpeechUtterance
/**
 Utterance:话语
 .pitchMultiplier   //音调调节  调节范围 ：[0.5 - 2]  默认是：1
 .volume            //音量调节  调节范围 ：[0-1]  默认是 ：1
 .rate              //语速调节  调节范围 ：[0-1]  0最慢  1 最快
 */
- (AVSpeechUtterance *)speechUtt{
    if (_speechUtt==nil) {
        _speechUtt = [AVSpeechUtterance speechUtteranceWithString:self.inputTextV.text];
        //设置语种
        AVSpeechSynthesisVoice *language = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
        _speechUtt.voice = language;
    }
    _speechUtt.pitchMultiplier = _pitchMultiplier;
    _speechUtt.volume = _volume;
    _speechUtt.rate = _rate;
    return _speechUtt;
}

- (void)defaultValue{
    if (_pitchMultiplier==0) {
        _pitchMultiplier = 1.0;
        _volume = 1.0;
        _rate = 0.5;
    }
}

- (void)changeValueWithPitchMultiplier:(float)pitchMultiplier volume:(float)volume rate:(float)rate{
    _pitchMultiplier = pitchMultiplier;
    _volume = volume;
    _rate = rate;
 
    //播放语音时，修改参数无效。
//    if (_speechUtt) {
//        _speechUtt.pitchMultiplier = _pitchMultiplier;
//        _speechUtt.volume = _volume;
//        _speechUtt.rate = _rate;
//    }
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

- (void)dealloc{
    if (self.speechSynth.isSpeaking) {
        [self.speechSynth stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    }
}

@end
