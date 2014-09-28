//
//  APInstrumentViewController.m
//  AirParranda
//
//  Created by Christian A. Rodriguez on 9/27/14.
//  Copyright (c) 2014 Mai Apps. All rights reserved.
//

#import "APInstrumentViewController.h"
#import <MyoKit/MyoKit.h>
@import AudioToolbox;
@import AVFoundation;

@interface APInstrumentViewController ()

@property (strong, nonatomic) NSURL *parrandaURL;
@property (assign) SystemSoundID parrandaSound;

@end


@implementation APInstrumentViewController

@synthesize name;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.instrumentName.text = self.name;

    
    // Posted when a new accelerometer event is available from a TLMMyo. Notifications are posted at a rate of 50 Hz.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceiveAccelerometerEvent:)
                                                 name:TLMMyoDidReceiveAccelerometerEventNotification
                                               object:nil];
    // Posted when a new pose is available from a TLMMyo
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didReceivePoseChange:)
                                                 name:TLMMyoDidReceivePoseChangedNotification
                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(didReceiveOrientationEvent:)
//                                                 name:TLMMyoDidReceiveOrientationEventNotification
//                                               object:nil];
    NSString *parrandaPath = [[NSBundle mainBundle]
                              pathForResource:self.name ofType:@"caf"];
    self.parrandaURL = [NSURL fileURLWithPath:parrandaPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)self.parrandaURL, &_parrandaSound);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didReceiveAccelerometerEvent:(NSNotification *)notification {
    // Retrieve the accelerometer event from the NSNotification's userInfo with the kTLMKeyAccelerometerEvent.
    TLMAccelerometerEvent *accelerometerEvent = notification.userInfo[kTLMKeyAccelerometerEvent];
    
    // Get the acceleration vector from the accelerometer event.
    GLKVector3 accelerationVector = accelerometerEvent.vector;
    
    // Calculate the magnitude of the acceleration vector.
    float magnitude = GLKVector3Length(accelerationVector);
    
    if ([self.name isEqual:@"Palitos"]) {
        if (magnitude > 1.1) {
            AudioServicesPlaySystemSound(self.parrandaSound);
            NSLog(@"%f", magnitude);
            NSLog(@"%@", self.musicPlayers);
        }
    } else if ([self.name isEqual:@"Güiro"]) {
        if (magnitude > 1.3) {
            AudioServicesPlaySystemSound(self.parrandaSound);
            NSLog(@"%f", magnitude);
        }
    } else if ([self.name isEqual:@"Maracas"]) {
        if (magnitude > 1.2) {
            AudioServicesPlaySystemSound(self.parrandaSound);
            NSLog(@"%f", magnitude);
        }
    } else if ([self.name isEqual:@"Tumbador"]) {
        if (magnitude > 1.4) {
            AudioServicesPlaySystemSound(self.parrandaSound);
            NSLog(@"%f", magnitude);
        }
    } else if ([self.name isEqual:@"Seguidor"]) {
        if (magnitude > 1.4) {
            AudioServicesPlaySystemSound(self.parrandaSound);
            NSLog(@"%f", magnitude);
        }
    } else if ([self.name isEqual:@"Requinto1"]) {
        if (magnitude > 1.4) {
            AudioServicesPlaySystemSound(self.parrandaSound);
            NSLog(@"%f", magnitude);
        }
    }
}

- (void)didReceivePoseChange:(NSNotification *)notification {
    // Retrieve the pose from the NSNotification's userInfo with the kTLMKeyPose key.
    TLMPose *pose = notification.userInfo[kTLMKeyPose];
    
    // Handle the cases of the TLMPoseType enumeration, and change the color of helloLabel based on the pose we receive.
    switch (pose.type) {
        case TLMPoseTypeUnknown:
        case TLMPoseTypeRest:
            // Changes helloLabel's font to Helvetica Neue when the user is in a rest or unknown pose.
            NSLog(@"Hello Myo");
            break;
        case TLMPoseTypeFist: {
            // Changes helloLabel's font to Noteworthy when the user is in a fist pose.
            NSLog(@"Fist");
            NSError *error;
            AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.parrandaURL error:&error];
            [self.musicPlayers addObject:newPlayer];
            newPlayer.enableRate = YES;
            [newPlayer setNumberOfLoops:-1];
            if ([self.name isEqual:@"Palitos"]) {
                [newPlayer setRate:2.5];
            } else if ([self.name isEqual:@"Güiro"]) {
                [newPlayer setRate:1.5];
            } else if ([self.name isEqual:@"Maracas"]) {
                [newPlayer setRate:1.0];
            } else if ([self.name isEqual:@"Tumbador"]) {
                [newPlayer setRate:1.0];
            } else if ([self.name isEqual:@"Seguidor"]) {
                [newPlayer setRate:1.0];
            } else if ([self.name isEqual:@"Requinto1"]) {

            }
            [newPlayer prepareToPlay];
            [newPlayer play];
            break;
        }
        case TLMPoseTypeWaveIn:
            // Changes helloLabel's font to Courier New when the user is in a wave in pose.
            NSLog(@"Wave In");
            break;
        case TLMPoseTypeWaveOut:
            // Changes helloLabel's font to Snell Roundhand when the user is in a wave out pose.
            NSLog(@"Wave Out");
            break;
        case TLMPoseTypeThumbToPinky:
            // Changes helloLabel's font to Superclarendon when the user is in a twist in pose.
            NSLog(@"Thumb to Pinky");
            break;
        case TLMPoseTypeFingersSpread:
            NSLog(@"Fingers Spread");
            for (AVAudioPlayer *player in self.musicPlayers) {
                [player stop];
            }
            break;
    }
}

//- (void)didReceiveOrientationEvent:(NSNotification *)notification {
//    TLMOrientationEvent *orientationEvent = notification.userInfo[kTLMKeyOrientationEvent];
//    float a = GLKQuaternionAngle(orientationEvent.quaternion);
//    NSLog(@"%f", a);
//}

@end
