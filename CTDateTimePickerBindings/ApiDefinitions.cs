using System;
using Foundation;
using ObjCRuntime;
using UIKit;

// audit-objc-generics: @interface RMActionController<T : UIView *> : UIViewController <UIAppearanceContainer>
[BaseType (typeof(UIViewController))]
interface RMActionController : IUIAppearanceContainer
{
	// +(instancetype _Nullable)actionControllerWithStyle:(RMActionControllerStyle)style;
	[Static]
	[Export ("actionControllerWithStyle:")]
	[return: NullAllowed]
	RMActionController ActionControllerWithStyle (RMActionControllerStyle style);

	// +(instancetype _Nullable)actionControllerWithStyle:(RMActionControllerStyle)aStyle selectAction:(RMAction<RMActionController<T> *> * _Nullable)selectAction andCancelAction:(RMAction<RMActionController<T> *> * _Nullable)cancelAction;
	[Static]
	[Export ("actionControllerWithStyle:selectAction:andCancelAction:")]
	[return: NullAllowed]
	RMActionController ActionControllerWithStyle (RMActionControllerStyle aStyle, [NullAllowed] RMAction<RMActionController<UIView>> selectAction, [NullAllowed] RMAction<RMActionController<UIView>> cancelAction);

	// +(instancetype _Nullable)actionControllerWithStyle:(RMActionControllerStyle)aStyle title:(NSString * _Nullable)aTitle message:(NSString * _Nullable)aMessage selectAction:(RMAction<RMActionController<T> *> * _Nullable)selectAction andCancelAction:(RMAction<RMActionController<T> *> * _Nullable)cancelAction;
	[Static]
	[Export ("actionControllerWithStyle:title:message:selectAction:andCancelAction:")]
	[return: NullAllowed]
	RMActionController ActionControllerWithStyle (RMActionControllerStyle aStyle, [NullAllowed] string aTitle, [NullAllowed] string aMessage, [NullAllowed] RMAction<RMActionController<UIView>> selectAction, [NullAllowed] RMAction<RMActionController<UIView>> cancelAction);

	// -(instancetype _Nullable)initWithStyle:(RMActionControllerStyle)aStyle title:(NSString * _Nullable)aTitle message:(NSString * _Nullable)aMessage selectAction:(RMAction<RMActionController<T> *> * _Nullable)selectAction andCancelAction:(RMAction<RMActionController<T> *> * _Nullable)cancelAction __attribute__((objc_designated_initializer));
	[Export ("initWithStyle:title:message:selectAction:andCancelAction:")]
	[DesignatedInitializer]
	IntPtr Constructor (RMActionControllerStyle aStyle, [NullAllowed] string aTitle, [NullAllowed] string aMessage, [NullAllowed] RMAction<RMActionController<UIView>> selectAction, [NullAllowed] RMAction<RMActionController<UIView>> cancelAction);

	// @property (readonly, assign, nonatomic) RMActionControllerStyle style;
	[Export ("style", ArgumentSemantic.Assign)]
	RMActionControllerStyle Style { get; }

	// @property (copy, nonatomic) NSString * _Nullable title;
	[NullAllowed, Export ("title")]
	string Title { get; set; }

	// @property (copy, nonatomic) NSString * _Nullable message;
	[NullAllowed, Export ("message")]
	string Message { get; set; }

	// @property (assign, nonatomic) BOOL disableBackgroundTaps;
	[Export ("disableBackgroundTaps")]
	bool DisableBackgroundTaps { get; set; }

	// @property (readonly, nonatomic) NSArray<RMAction<RMActionController<T> *> *> * _Nonnull actions;
	[Export ("actions")]
	RMAction<RMActionController<UIView>>[] Actions { get; }

	// -(void)addAction:(RMAction<RMActionController<T> *> * _Nonnull)action;
	[Export ("addAction:")]
	void AddAction (RMAction<RMActionController<UIView>> action);

	// @property (nonatomic) T _Nonnull contentView;
	[Export ("contentView", ArgumentSemantic.Assign)]
	UIView ContentView { get; set; }

	// @property (assign, nonatomic) BOOL disableMotionEffects;
	[Export ("disableMotionEffects")]
	bool DisableMotionEffects { get; set; }

	// @property (assign, nonatomic) BOOL disableBouncingEffects;
	[Export ("disableBouncingEffects")]
	bool DisableBouncingEffects { get; set; }

	// @property (assign, nonatomic) BOOL disableBlurEffects;
	[Export ("disableBlurEffects")]
	bool DisableBlurEffects { get; set; }

	// @property (assign, nonatomic) BOOL disableBlurEffectsForContentView;
	[Export ("disableBlurEffectsForContentView")]
	bool DisableBlurEffectsForContentView { get; set; }

	// @property (assign, nonatomic) BOOL disableBlurEffectsForBackgroundView;
	[Export ("disableBlurEffectsForBackgroundView")]
	bool DisableBlurEffectsForBackgroundView { get; set; }
}

// audit-objc-generics: @interface RMAction<T : RMActionController *> : NSObject
[BaseType (typeof(NSObject))]
interface RMAction
{
	// +(instancetype _Nullable)actionWithTitle:(NSString * _Nonnull)title style:(RMActionStyle)style andHandler:(void (^ _Nullable)(T _Nonnull))handler;
	[Static]
	[Export ("actionWithTitle:style:andHandler:")]
	[return: NullAllowed]
	RMAction ActionWithTitle (string title, RMActionStyle style, [NullAllowed] Action<RMActionController> handler);

	// +(instancetype _Nullable)actionWithImage:(UIImage * _Nonnull)image style:(RMActionStyle)style andHandler:(void (^ _Nullable)(T _Nonnull))handler;
	[Static]
	[Export ("actionWithImage:style:andHandler:")]
	[return: NullAllowed]
	RMAction ActionWithImage (UIImage image, RMActionStyle style, [NullAllowed] Action<RMActionController> handler);

	// @property (readonly, nonatomic) NSString * _Nullable title;
	[NullAllowed, Export ("title")]
	string Title { get; }

	// @property (readonly, nonatomic) UIImage * _Nullable image;
	[NullAllowed, Export ("image")]
	UIImage Image { get; }

	// @property (readonly, nonatomic) RMActionStyle style;
	[Export ("style")]
	RMActionStyle Style { get; }

	// @property (assign, nonatomic) BOOL dismissesActionController;
	[Export ("dismissesActionController")]
	bool DismissesActionController { get; set; }
}

// audit-objc-generics: @interface RMGroupedAction<T : RMActionController *> : RMAction
[BaseType (typeof(RMAction))]
interface RMGroupedAction
{
	// +(instancetype _Nullable)actionWithStyle:(RMActionStyle)style andActions:(NSArray<RMAction<T> *> * _Nonnull)actions;
	[Static]
	[Export ("actionWithStyle:andActions:")]
	[return: NullAllowed]
	RMGroupedAction ActionWithStyle (RMActionStyle style, RMAction<RMActionController>[] actions);

	// @property (readonly, nonatomic, strong) NSArray<RMAction<T> *> * _Nonnull actions;
	[Export ("actions", ArgumentSemantic.Strong)]
	RMAction<RMActionController>[] Actions { get; }
}

// @interface RMDateSelectionViewController : RMActionController
[BaseType (typeof(RMActionController))]
interface RMDateSelectionViewController
{
	// @property (readonly, nonatomic) UIDatePicker * datePicker;
	[Export ("datePicker")]
	UIDatePicker DatePicker { get; }
}
