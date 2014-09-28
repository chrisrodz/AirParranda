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

@interface APInstrumentViewController ()

@property (assign) SystemSoundID pewPewSound;

@end


@implementation APInstrumentViewController

@synthesize name;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    
    if (magnitude > 2.0) {
        NSLog(@"%f", magnitude);
        if ([self.instrumentName.text  isEqual: @"Güiro"]) {
            NSLog(@"Play güiro");
            NSString *pewPewPath = [[NSBundle mainBundle]
                                    pathForResource:@"hola" ofType:@"caf"];
            NSURL *pewPewURL = [NSURL fileURLWithPath:pewPewPath];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)pewPewURL, &_pewPewSound);
            AudioServicesPlaySystemSound(self.pewPewSound);
        } else if ([self.instrumentName.text  isEqual: @"Palitos"]) {
            //play sound
            NSLog(@"Play palitos");
        } else if ([self.instrumentName.text  isEqual: @"Maracas"]) {
            //play sound
            NSLog(@"Play maracas");
        } else if ([self.instrumentName.text  isEqual: @"Requinto"]) {
            //play sound
            NSLog(@"Play requinto");
        } else if ([self.instrumentName.text  isEqual: @"Seguidor"]) {
            //play sound
            NSLog(@"Play seguidor");
        } else if ([self.instrumentName.text  isEqual: @"Tumbador"]) {
            //play sound
            NSLog(@"Play tumbador");
        } else {
            NSLog(@"Lo jodiste");
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
        case TLMPoseTypeFist:
            // Changes helloLabel's font to Noteworthy when the user is in a fist pose.
            NSLog(@"Fist");
            break;
        case TLMPoseTypeWaveIn:
            // Changes helloLabel's font to Courier New when the user is in a wave in pose.
            NSLog(@"Wave In");
            break;
        case TLMPoseTypeWaveOut:
            // Changes helloLabel's font to Snell Roundhand when the user is in a wave out pose.
            NSLog(@"Wave Out");
            break;
        case TLMPoseTypeFingersSpread:
            // Changes helloLabel's font to Chalkduster when the user is in a fingers spread pose.
            NSLog(@"Fingers Spread");
            break;
        case TLMPoseTypeThumbToPinky:
            // Changes helloLabel's font to Superclarendon when the user is in a twist in pose.
            NSLog(@"Thumb to Pinky");
            break;
    }
}

//- (void)didReceiveOrientationEvent:(NSNotification *)notification {
//    TLMOrientationEvent *orientationEvent = notification.userInfo[kTLMKeyOrientationEvent];
//    float a = GLKQuaternionAngle(orientationEvent.quaternion);
//    NSLog(@"%f", a);
//}

@end
