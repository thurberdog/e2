import QtQuick 2.0
import QuickFlux 1.1
import Exercises.actions 1.0

Store {
    id: store

    property string displayTitle: ""

    property int displayCounter: 0

    property int displayResistance: 0

    property int selectedIndex: 0

    property bool isFinished: false

    property int totalFinishedCounter;

    property ListModel exercises: ListModel {}

    Filter {
        type: ActionTypes.startApp
        onDispatched: {
            var json = {
                "title": "Workout 1",
                "exercises": [
                    {
                        "name": "Bicep Curl",
                        "id": 1
                    },
                    {
                        "name": "Tricep Press",
                        "id": 2
                    },
                    {
                        "name": "Bench Press",
                        "id": 3
                    },
                    {
                        "name": "Upright Row",
                        "id": 4
                    }
                ]
            }

            json.exercises.forEach(function(item) {
                var data = {};
                for (var i in item) {
                    data[i] = item[i];
                }
                data.uid = data.id;
                data["counter"] = 0;
                data["isCompleted"] = false;
                data["isInProgress"] = false;
                data["resistance"] = 1
                delete data.id;
                store.exercises.append(data);
            });

            _select(0);
        }
    }

    Filter {
        type: ActionTypes.incCounter
        onDispatched: {
            if (selectedIndex >= exercises.count) {
                return;
            }

            var rec = exercises.get(selectedIndex);

            var counter = rec.counter + message.value
            exercises.setProperty(selectedIndex, "counter", counter);
            _select(selectedIndex);
        }
    }

    Filter {
        type: ActionTypes.next
        onDispatched: {
            exercises.setProperty(selectedIndex, "isCompleted", true);

            var index =  selectedIndex + 1;
            if (index < exercises.count) {
                _select(selectedIndex + 1);
            } else {
                isFinished = true;
                var value = 0;
                for (var i = 0 ; i < exercises.count ;i++) {
                    var rec = exercises.get(i);
                    value += rec.counter * rec.resistance;
                }
                totalFinishedCounter = value;
            }
        }
    }

    Filter {
        type: ActionTypes.incResistance
        onDispatched: {
            if (selectedIndex >= exercises.count) {
                return;
            }

            var rec = exercises.get(selectedIndex);

            var value = rec.resistance + message.value
            if (value < 1) {
                return;
            }

            exercises.setProperty(selectedIndex, "resistance", value);
            _select(selectedIndex);
        }
    }

    Filter {
        type: ActionTypes.restartWorkout
        onDispatched: {
            for (var i = 0 ; i < exercises.count ;i++) {
                exercises.set(i, {"resistance": 5, "counter": 0, "isInProgress": false, "isCompleted": false});
            }
            isFinished = false;
            _select(0);
        }
    }

    Filter {
        type: ActionTypes.workoutRecieved
        onDispatched: {
            console.log(JSON.stringify(message.value.sets));
            store.exercises.clear();
            message.value.sets.forEach(function (item) {
                store.exercises.append({
                   name: item.exercise.name,
                   uid: item.id,
                   counter: 0,
                   isCompleted: false,
                   isInProgress: false,
                   resistance: 5

                });
            });
        }
    }

    function _select(index) {
        var rec = exercises.get(index);
        exercises.setProperty(index, "isInProgress", true);
        displayTitle = rec.name;
        displayCounter = rec.counter;
        displayResistance = rec.resistance
        selectedIndex = index;
    }
}
