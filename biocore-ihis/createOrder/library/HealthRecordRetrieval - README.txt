Step by step:-

1. Import that 'HealthRecordRetrieval.jar' into your java project.

2. Call this function to declare object for MainRetrieval class :-

	MainRetrieval mr = new MainRetrieval();

3. Call method from object 'mr' to input all EHR's data into the startProcess method's parameter. Note that, before put that variable 'ehrdata', that variable MUST already contains all informations or datas of EHR's record:-

        mr.startProcess(ehrdata);

4. Call method 'getData' to store all extracted EHR's data into 2-dimensional array, for example I name it as 'dto'. In the 'getData' parameter, you can put any EHR's code to extract only a certain record from the EHR's record that came from variable 'ehrdata':-

        String dto[][] = mr.getData("DTO");

5. As an optional, after calling method from step 4, to get the number of DTO's data from EHR's record, you call this method named 'getRowNums'. It will return the number of DTO's data:- 

        int row = mr.getRowNums();

-----------------------------------------
MEDICAL CODE:-
ALG - Allergy
BLD - Blood
CCN - Chief Complaint
DAB - Dissability
DGS - Diagnosis
DTO - Drug Treatment Order
FMH - Family History
HPI - History of Present Illness
IMU - Immunization
MEC - Medical Certification
MSH - Message Header
PDI - Patient Demographic Information
PEM - Physical Examination
PMH - Past Medical History
PNT - Progress Notes
POS - Procedure
SOH - Social History
VTS - Vital Sign