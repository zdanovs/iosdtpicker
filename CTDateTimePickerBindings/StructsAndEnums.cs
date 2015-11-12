using System;
using ObjCRuntime;

[Native]
public enum RMActionControllerStyle : nint
{
	White,
	Black,
	Default = White
}

[Native]
public enum RMActionStyle : nint
{
	Done,
	Cancel,
	Destructive,
	Additional,
	Default = Done
}
