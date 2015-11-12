iOS dt picker
=============

# Xamarin/C# bindings
Based on [RMDateSelectionViewController](https://github.com/CooperRS/RMDateSelectionViewController)  

# Log

    sudo gem install cocoapods

    sharpie update
    sharpie docs

    sharpie pod init ios RMDateSelectionViewController
    sharpie pod bind

    sharpie -tlm-do-not-submit -tlm-do-not-identify bind

# Dev/Process Issues
 - Xcode "Product" path for library is always wrong
 - "Build" vs "build" when usin gui or cli
 - Xcode endless building (Locations/DerivedData issue)
 - XCode project management - Add files to project:
     1. Can't use "Groups"
     2. Can't add "Folder reference" to a build process directly
     3. To fix 2. you should use "Add other" in a "Build phases"
     4. To fix 3. you should use "New group from selection"
