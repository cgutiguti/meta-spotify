//
//  TrackDetailsViewController.m
//  Bounce
//
//  Created by Carmen Gutierrez on 7/15/20.
//  Copyright © 2020 Carmen Gutierrez. All rights reserved.
//

#import "TrackDetailsViewController.h"

@interface TrackDetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *albumView;
@property (weak, nonatomic) IBOutlet UILabel *songNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *keyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeSigLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempoLabel;
@property (weak, nonatomic) IBOutlet UILabel *loudnessLabel;
@property (weak, nonatomic) IBOutlet UILabel *valenceLabel;
@property (weak, nonatomic) IBOutlet UILabel *acousticLabel;
@property (weak, nonatomic) IBOutlet UILabel *danceLabel;
@property (weak, nonatomic) IBOutlet UILabel *energyLabel;

@end

@implementation TrackDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.keyLabel setUserInteractionEnabled:YES];
    UITapGestureRecognizer *keyGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyClicked)];
    [self.keyLabel addGestureRecognizer:keyGesture];
    
    [self.timeSigLabel setUserInteractionEnabled:YES];
    UITapGestureRecognizer *timeSigGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(timeSigClicked)];
    [self.keyLabel addGestureRecognizer:timeSigGesture];
    
    [self.tempoLabel setUserInteractionEnabled:YES];
    UITapGestureRecognizer *tempoGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tempoClicked)];
    [self.keyLabel addGestureRecognizer:tempoGesture];
    
    [self.loudnessLabel setUserInteractionEnabled:YES];
    UITapGestureRecognizer *loudnessGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loudnessClicked)];
    [self.keyLabel addGestureRecognizer:loudnessGesture];
    
    [self.valenceLabel setUserInteractionEnabled:YES];
    UITapGestureRecognizer *valenceGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(valenceClicked)];
    [self.keyLabel addGestureRecognizer:valenceGesture];
    
    [self.acousticLabel setUserInteractionEnabled:YES];
    UITapGestureRecognizer *acousticGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(acousticClicked)];
    [self.keyLabel addGestureRecognizer:acousticGesture];
    
    [self.danceLabel setUserInteractionEnabled:YES];
    UITapGestureRecognizer *danceGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(danceClicked)];
    [self.keyLabel addGestureRecognizer:danceGesture];
    
    [self.energyLabel setUserInteractionEnabled:YES];
    UITapGestureRecognizer *energyGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(energyClicked)];
    [self.keyLabel addGestureRecognizer:energyGesture];
}

- (void) keyClicked{
    [self presentAlertControllerWithTitle:@"Musical Key"
                                  message:@"The key the track is in. Integers map to pitches using standard Pitch Class notation. E.g. 0 = C, 1 = C♯/D♭, 2 = D, and so on."
                              buttonTitle:@"Close"];
    
}
- (void) timeSigClicked {
    [self presentAlertControllerWithTitle:@"Time Signature"
                                  message:@"An estimated overall time signature of a track. The time signature (meter) is a notational convention to specify how many beats are in each bar (or measure)."
                              buttonTitle:@"Close"];
}
- (void) tempoClicked {
    [self presentAlertControllerWithTitle:@"Tempo"
                                  message:@"The overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration."
                              buttonTitle:@"Close"];
}
- (void) loudnessClicked {
    [self presentAlertControllerWithTitle:@"Loudness"
                                  message:@"The overall loudness of a track in decibels (dB). Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks. Loudness is the quality of a sound that is the primary psychological correlate of physical strength (amplitude). Values typical range between -60 and 0 db."
                              buttonTitle:@"Close"];
}
- (void) valenceClicked{
    [self presentAlertControllerWithTitle:@"Valence"
                                  message:@"A measure from 0 to 100 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry)."
                              buttonTitle:@"Close"];
}
- (void) acousticClicked{
    [self presentAlertControllerWithTitle:@"Acousticness"
                                  message:@"A confidence measure from 0 to 100 of whether the track is acoustic. 100 represents high confidence the track is acoustic."
                              buttonTitle:@"Close"];
}
- (void) danceClicked{
    [self presentAlertControllerWithTitle:@"Danceability"
                                  message:@"Danceability describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 00 is least danceable and 100 is most danceable."
                              buttonTitle:@"Close"];
}
- (void) energyClicked{
    [self presentAlertControllerWithTitle:@"Energy"
                                  message:@"Energy is a measure from 0 to 100 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy. For example, death metal has high energy, while a Bach prelude scores low on the scale. Perceptual features contributing to this attribute include dynamic range, perceived loudness, timbre, onset rate, and general entropy."
                              buttonTitle:@"Close"];
}
- (void)presentAlertControllerWithTitle:(NSString *)title
                                message:(NSString *)message
                            buttonTitle:(NSString *)buttonTitle
{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                                 message:message
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:buttonTitle
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertController addAction:dismissAction];
        [self presentViewController:alertController
                           animated:YES
                         completion:nil];
    });
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