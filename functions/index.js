const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

// Notify when a task is added
exports.sendTaskNotification = functions.firestore
    .document("tasks/{taskId}")
    .onCreate((snap, context) => {
      const task = snap.data();
      const payload = {
        notification: {
          title: "New Task Added",
          body: `Task "${task.title}" has been added.`,
        },
        topic: "all",
      };
      return admin.messaging().send(payload)
          .then((response) => {
            console.log("Task notification sent successfully:", response);
          })
          .catch((error) => {
            console.log("Task notification failed:", error);
          });
    });

// Notify when an experiment is added
exports.sendExperimentNotification = functions.firestore
    .document("experiments/{experimentId}")
    .onCreate((snap, context) => {
      const experiment = snap.data();
      const payload = {
        notification: {
          title: "New Experiment Added",
          body: `Experiment "${experiment.title}" has been added.`,
        },
        topic: "all",
      };
      return admin.messaging().send(payload)
          .then((response) => {
            console.log("Experiment notification sent successfully:", response);
          })
          .catch((error) => {
            console.log("Experiment notification failed:", error);
          });
    });
