package model;

import org.hibernate.collection.internal.PersistentSet;
import org.joda.time.DateTime;

import java.sql.Timestamp;
import java.util.*;

/**
 * Created by stevenc on 11/04/15.
 */
public class Dashboard {

    private String name;
    private char gender;
    private Timestamp expecteddischargedate;

    public List<PatientAlergy> getAlergiesOverCritical() {
        return alergiesOverCritical;
    }

    public void setAlergiesOverCritical(List<PatientAlergy> alergiesOverCritical) {
        this.alergiesOverCritical = alergiesOverCritical;
    }

    public List<PatientMedication> getMedicationToTakeNow() {
        return medicationToTakeNow;
    }

    public void setMedicationToTakeNow(List<PatientMedication> medicationToTakeNow) {
        this.medicationToTakeNow = medicationToTakeNow;
    }

    public List<PatientTest> getTestsToComplete() {
        return testsToComplete;
    }

    public void setTestsToComplete(List<PatientTest> testsToComplete) {
        this.testsToComplete = testsToComplete;
    }

    private List<PatientAlergy> alergiesOverCritical;
    private List<PatientMedication> medicationToTakeNow;
    private List<PatientTest> testsToComplete;



    public Dashboard (Patient patient) {

        this.name = patient.getName();
        this.gender = patient.getGender();
        this.expecteddischargedate = patient.getExpecteddischargedate();
        this.alergiesOverCritical = this.getAlergiesOverCritical(patient.getPatientAlergies());
        this.medicationToTakeNow = this.getMedicationToTakeNow(patient.getPatientMedication());
        this.testsToComplete = this.getTestsToComplete(patient.getPatientTests());

    }

//    public static String getDashboardData()
//    {
//        return this.;
//    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public Timestamp getExpecteddischargedate() {
        return expecteddischargedate;
    }

    public void setExpecteddischargedate(Timestamp expecteddischargedate) {
        this.expecteddischargedate = expecteddischargedate;
    }

    public List<PatientAlergy> getAlergiesOverCritical(Set<PatientAlergy> alergiesOverCritical) {

        Iterator iterateAlergies = alergiesOverCritical.iterator();
        List<PatientAlergy> severeAlergies = new ArrayList<PatientAlergy>();

        while(iterateAlergies.hasNext()){
            PatientAlergy alergy = (PatientAlergy) iterateAlergies.next();
            if(alergy.getSeverness() >= 4) {
                severeAlergies.add(alergy);
            }
        }
        return severeAlergies;
    }

    public List<PatientMedication> getMedicationToTakeNow(Set<PatientMedication> patientMedication) {
        Iterator iterateMeds = patientMedication.iterator();
        List<PatientMedication> medsDueNow = new ArrayList<PatientMedication>();

        while(iterateMeds.hasNext()){
            PatientMedication medication = (PatientMedication) iterateMeds.next();
            if(medication.getTimetotake().after(new Date())) {
                medsDueNow.add(medication);
            }
        }
        return medsDueNow;
    }

    public List<PatientTest> getTestsToComplete(Set<PatientTest> testsToComplete) {
        Iterator iterateMeds = testsToComplete.iterator();
        List<PatientTest> incompleteTests = new ArrayList<PatientTest>();

        while(iterateMeds.hasNext()){
            PatientTest test = (PatientTest) iterateMeds.next();
            if(test.isIscomplete() == false) {
                incompleteTests.add(test);
            }
        }
        return incompleteTests;
    }
}
