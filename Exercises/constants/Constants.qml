pragma Singleton
import QtQuick 2.0
import QuickFlux 1.0

KeyTable {
    property int getWorkouts: 1
    property int getWorkout: 2
    property int workoutStarted: 3
    property int workoutEnded: 4
    property int setStarted: 5
    property int setEnded: 6
    property int repStarted: 7
    property int repEnded: 8
    property int repStatusChanged: 9
    property int stationInUse: 10
    property int stationNotInUse: 11
    property int heartRateChanged: 12
    property int resistanceChanged: 13
}
