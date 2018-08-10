pragma Singleton
import QtQuick 2.0
import QuickFlux 1.0

KeyTable {
    // Call it when the initialization is finished.
    // Now, it is able to start and show the application
    property string startApp

    // Call it to quit the application
    property string quitApp

    property string incCounter

    property string next

    property string incResistance

    property string restartWorkout
    property string fetchWorkout
    property string fetchWorkouts
    property string workoutRecieved
}
