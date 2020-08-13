# Tasks+SwiftUI+CoreData
Simple Tasks application that uses SwiftUI for UI presentation and CoreData as a persistent storage manager.
The project divided into 3 parts:
- main application as presentation layer
- Domain pod that includes all necessary models, protocols for services etc.
- CoreDataPlatform that includes all Domain realization
This separation helps to test parts of the application side by side and remove 
dependency between an application and persistent storage which devs can change during the development process, for example on Realm.
