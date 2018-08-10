pragma Singleton
import QtQuick 2.0
import QuickFlux 1.0
import "."

ActionCreator {

    signal startApp

    signal quitApp

    function incCounter(value) {
        dispatch(ActionTypes.incCounter, {value: value});
    }

    function incResistance(value) {
        dispatch(ActionTypes.incResistance, {value: value});
    }

    function next() {
        dispatch(ActionTypes.next);
    }

    function restartWorkout() {
        dispatch(ActionTypes.restartWorkout);
    }

    function fetchWorkout() {
        dispatch(ActionTypes.fetchWorkout);
    }

    function fetchWorkouts() {
        dispatch(ActionTypes.fetchWorkouts);
    }

    function workoutRecieved(value) {
        dispatch(ActionTypes.workoutRecieved, { value: value });
    }
}
