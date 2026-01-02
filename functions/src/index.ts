import * as admin from "firebase-admin";
import { onDocumentCreated, onDocumentDeleted } from "firebase-functions/v2/firestore";

admin.initializeApp();

export const onAppointmentCreatd = onDocumentCreated(
    "users/{userId}/appointments/{appointmentId}",
    async (event) => {
        const { userId, appointmentId } = event.params;

        const document = event.data;
        if (!document) {
            return;
        }
        const { patientId, patientName, type, appointmentDate } = document.data();

        await admin
            .firestore()
            .collection("calendar")
            .doc(userId)
            .collection("appointments")
            .doc(appointmentId)
            .set(
                {
                    userId,
                    appointmentId,
                    patientId,
                    patientName,
                    type,
                    appointmentDate,
                },
                { merge: true }
            );
    }
);

export const onAppointmentDeleted = onDocumentDeleted(
    "users/{userId}/appointments/{appointmentId}",
    async (event) => {
        const { userId, appointmentId } = event.params;

        admin
            .firestore()
            .collection("calendar")
            .doc(userId)
            .collection("appointments")
            .doc(appointmentId)
            .delete();
    }
);

export const onPatientDeleted = onDocumentDeleted(
    "users/{userId}/patients/{patientId}",
    async (event) => {
        const { userId, patientId } = event.params;

        const db = admin.firestore();
        const querySnapshot = await db
            .collection("users")
            .doc(userId)
            .collection("appointments")
            .where("patientId", "==", patientId)
            .get();

        if (querySnapshot.empty) {
            return;
        }

        const batch = db.batch();

        querySnapshot.docs.forEach((doc) => {
            batch.delete(doc.ref);
        });

        await batch.commit();

    }
);