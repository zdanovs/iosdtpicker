using System;
using Foundation;
using ObjCRuntime;
using UIKit;

namespace CTDateTimePickerBindings
{
	// typedef void (^CTCompletionActionBlock)(NSDate *);
	delegate void CTCompletionActionBlock (NSDate arg0);

	// @interface CTDateTimePicker : NSObject
	[BaseType (typeof(NSObject))]
	interface CTDateTimePicker
	{
		// @property (readonly, nonatomic, strong) NSString * module;
		[Export ("module", ArgumentSemantic.Strong)]
		string Module { get; }

		// @property (readonly, atomic, strong) NSDate * currentDate;
		[Export ("currentDate", ArgumentSemantic.Strong)]
		NSDate CurrentDate { get; }

		// @property (readonly, atomic, strong) NSDate * lastSelectedDate;
		[Export ("lastSelectedDate", ArgumentSemantic.Strong)]
		NSDate LastSelectedDate { get; }

		// @property NSDate * minimumDate;
		[Export ("minimumDate", ArgumentSemantic.Assign)]
		NSDate MinimumDate { get; set; }

		// @property NSDate * maximumDate;
		[Export ("maximumDate", ArgumentSemantic.Assign)]
		NSDate MaximumDate { get; set; }

		// @property int pickerMode;
		[Export ("pickerMode")]
		int PickerMode { get; set; }

		// -(instancetype)init:(NSDate *)date;
		[Export ("init:")]
		IntPtr Constructor (NSDate date);

		// -(id)show:(id)sender withPresenter:(UIViewController *)presenter completeAction:(CTCompletionActionBlock)action;
		[Export ("show:withPresenter:completeAction:")]
		NSObject Show (NSObject sender, UIViewController presenter, CTCompletionActionBlock action);

		// -(void)dealloc;
		[Export ("dealloc")]
		void Dealloc ();
	}
}
