iOS date time picker
====================
Based on [RMDateSelectionViewController](https://github.com/CooperRS/RMDateSelectionViewController)

## Rationale
To create Xamarin/C# bindings for RMDateSelectionViewController project


## Requirements
 - Xcode
 - Xcode command-line tools
 - Xamarin Studio
 - Objective Sharpie

## Log
    sudo gem install cocoapods

    sharpie update
    sharpie docs

    sharpie pod init ios RMDateSelectionViewController
    sharpie pod bind

    sharpie -tlm-do-not-submit -tlm-do-not-identify bind

## Dev/Process Issues
 - Xcode "Product" path for library is always wrong
 - "Build" vs "build" when using gui or cli
 - Xcode endless building (Locations/DerivedData issue)
 - Xcode project management - Add files to project:
   1. Can't use "Groups"
   2. Can't add "Folder reference" to a build process directly
   3. To fix 2. you should use "Add other" in a "Build phases"
   4. To fix 3. you should use "New group from selection"
 - Cocoa Pods is totally crap
