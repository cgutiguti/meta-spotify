//
//  SpotifyManager.m
//  Bounce
//
//  Created by Carmen Gutierrez on 7/20/20.
//  Copyright © 2020 Carmen Gutierrez. All rights reserved.
//
#import "SpotifyManager.h"
#import "AppDelegate.h"

static NSString * const spotifyClientID = @"78a164a9d67e4cd4857e69bd9b70b2bb";
static NSString * const spotifySecretClientID = @"40d1fedad22842f7acc8728a05e36230";
static NSString * const spotifyRedirectURLString = @"bounce-spotify://callback";
static NSString * const tokenSwapURLString = @"https://bounce-spotify.herokuapp.com/api/token";
static NSString * const tokenRefreshURLString = @"https://bounce-spotify.herokuapp.com/api/refresh_token";
static NSString * const baseURL =@"https://api.spotify.com";
static NSString * const trackRequestBase = @"/v1/tracks/";
static NSString * const searchRequestBase = @"/v1/search?q=";
static NSString * const audioFeaturesRequestBase = @"/v1/audio-features/";
static NSString * const artistTopTracksRequestBase = @"/v1/artists/";
static NSString * const personalTopTracksRequestBase = @"/v1/me/top/";



@implementation SpotifyManager

+ (instancetype) shared{
    static dispatch_once_t once;
    static SpotifyManager *sharedObject = nil;
    dispatch_once(&once, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

-(instancetype) init{
    self = [super initWithBaseURL:[NSURL URLWithString:baseURL] clientID:spotifyClientID secret:spotifySecretClientID];
    return self;

}

- (void) doGetRequest:(NSString *)request accessToken: (NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    [self.requestSerializer setValue:[NSString stringWithFormat:@"Bearer  %@",token] forHTTPHeaderField:@"Authorization"];
    [self GET:request
    parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable response) {
        
         NSLog(@"Response from GET: %@", response );
          completion(response, nil);
                          
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        //Error
        NSLog(@"Error from GET: %@", error.description);
        completion(nil,error);
    }];
}
- (void) getSong:(NSString *)songURI accessToken:(NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
    NSString *request = [trackRequestBase stringByAppendingString:songURI];
    [self doGetRequest:request accessToken:token completion:^(NSDictionary *dict, NSError *error) {
        completion(dict, error);
    }];
    
}
- (void) searchForSong:(NSString *)songQueryURI  accessToken:(NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
    NSString *request = [[searchRequestBase stringByAppendingString:songQueryURI] stringByAppendingString:@"&type=track"];
    [self doGetRequest:request accessToken:token completion:^(NSDictionary *dict, NSError *error) {
        completion(dict, error);
    }];
}
 - (void) searchForArtist:(NSString *)songQueryURI  accessToken:(NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
     NSString *request = [[searchRequestBase stringByAppendingString:songQueryURI] stringByAppendingString:@"&type=artist"];
     [self doGetRequest:request accessToken:token completion:^(NSDictionary *dict, NSError *error) {
         completion(dict, error);
     }];
 }

- (void) getAudioFeaturesForTrack:(NSString *)songURI  accessToken:(NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
    NSString *request = [audioFeaturesRequestBase stringByAppendingString:songURI];
    [self doGetRequest:request accessToken:token completion:^(NSDictionary *dict, NSError *error) {
        completion(dict, error);
    }];
}
- (void) getArtistTopTracks:(NSString *)artistID  accessToken:(NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
    NSString *request = [[artistTopTracksRequestBase stringByAppendingString:artistID] stringByAppendingString:@"/top-tracks?country=from_token"];
    [self doGetRequest:request accessToken:token completion:^(NSDictionary *dict, NSError *error) {
        completion(dict, error);
    }];
}

- (void) getRelatedArtists:(NSString *)artistID  accessToken:(NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
    NSString *request = [[artistTopTracksRequestBase stringByAppendingString:artistID] stringByAppendingString:@"/related-artists"];
    [self doGetRequest:request accessToken:token completion:^(NSDictionary *dict, NSError *error) {
        completion(dict, error);
    }];
}

- (void) getPersonalTopTracks:(NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
    NSString *request = [personalTopTracksRequestBase stringByAppendingString:@"tracks"];
    [self doGetRequest:request accessToken:token completion:^(NSDictionary *dict, NSError *error) {
        completion(dict, error);
    }];
}

- (void) getPersonalTopArtists:(NSString *)token completion:(void (^)(NSDictionary * , NSError * ))completion{
    NSString *request = [personalTopTracksRequestBase stringByAppendingString:@"artists"];
    [self doGetRequest:request accessToken:token completion:^(NSDictionary *dict, NSError *error) {
        completion(dict, error);
    }];
}
@end
