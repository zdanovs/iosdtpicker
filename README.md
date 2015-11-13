Date time picker for Xamarin.iOS
================================
Based on [RMDateSelectionViewController](https://github.com/CooperRS/RMDateSelectionViewController)

## Rationale
To create Xamarin.iOS/C# bindings for
[RMDateSelectionViewController](https://github.com/CooperRS/RMDateSelectionViewController) project

![screenshot](https://raw.githubusercontent.com/okertanov/iosdtpicker/master/Resources/Simulator-Screenshot-1.png "iosdtpicker screenshot")

## Requirements
 - Mac OS X >= Yosemite
 - Xcode
 - Xcode command-line tools
 - Xamarin Studio
 - Objective Sharpie

## How to build & use
Start your favorite terminal and

    git clone --recursive <this repo : iosdtpicker>
    cd iosdtpicker
    make clean all

And then that's it. To ensure, just:

    file CTDateTimePickerBindings/bin/Debug/CTDateTimePickerBindings.dll
    file CTDateTimePickerBindings/libCTDateTimePicker-universal.a


## To be in sync

    git status
    git pull --all
    git pull && git push && git status
    git submodule init
    git submodule update
    git submodule foreach "git checkout master && git pull"


## Tasks
 - [ ] Make forks
 - [ ] Contribute to upstream
 - [ ] More docs
 - [ ] Review code
 - [ ] Review makefiles
 - [ ] License
 - [ ] Get rid of "Xamarin.TVOS not found" error

## Log/Misc garbage

    sudo gem install cocoapods

    sharpie update
    sharpie docs

    sharpie pod init ios RMDateSelectionViewController
    sharpie pod bind

    sharpie -tlm-do-not-submit -tlm-do-not-identify bind


## Dev process issues
 - Xcode "Product" path for library is always wrong
 - "Build" vs "build" when using gui or cli ([Bb]uild)
 - Xcode endless building (Locations/DerivedData issue)
 - Xcode project management - Add files to project:
   1. Can't use "Groups"
   2. Can't add "Folder reference" to a build process directly
   3. To fix 2. you should use "Add other" in a "Build phases"
   4. To fix 3. you should use "New group from selection"
 - Cocoa Pods is ~~totally crap~~ strange


