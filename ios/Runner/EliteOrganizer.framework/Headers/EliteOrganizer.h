//
//  EliteOrganizer.h
//  LuckyGame
//
//  Created by LuckyGame on 2024/12/30.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^CompletionProcedure)(double gameX, double gameY);

NS_ASSUME_NONNULL_BEGIN

@interface EliteOrganizer : NSObject

@property (nonatomic, copy) CompletionProcedure detailProgress;
//idfa 请尽量传入
@property (nonatomic, copy) NSString *fieldStepper;
//distinctid 务必传入
@property (nonatomic, copy) NSString *preferenceToast;

+ (EliteOrganizer *)streamKeyboard;

//controller中调用，设置环境
- (void)combineDuct:(UIViewController *)rootVC copyModem:(UIView *)gameView;

//移除View
- (void)guideResource;

//加载BasicConfig
- (void)serializeExtension;

//加载OfferConfig if success,load success.
- (void)arrangeMedicine;

//显示WebView
- (void)refractSignal;

@end

NS_ASSUME_NONNULL_END
