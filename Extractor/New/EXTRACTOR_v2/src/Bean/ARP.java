/*
 * Copyright 2017 Shay.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package Bean;

/**
 *
 * @author Shay
 */
public class ARP {

    private String PMI_no;
    private String Encounter_Date;

    private String prCode;
    private String prName;
    private String prCodeStd;
    private String dateTime;
    private String prDuration;
    private String dcgCode;
    private String docId;
    private String docName;
    private String locCode;
    private String locName;
    private String comment;
    private String recHFCcode;
    private String episodeDate;
    private String discipline;
    private String subdiscipline;
    private String procedureOutcome;

    public String getProcedureOutcome() {
        return procedureOutcome;
    }

    public void setProcedureOutcome(String procedureOutcome) {
        this.procedureOutcome = procedureOutcome;
    }
    
    public String getDiscipline() {
        return discipline;
    }

    public void setDiscipline(String discipline) {
        this.discipline = discipline;
    }

    public String getSubdiscipline() {
        return subdiscipline;
    }

    public void setSubdiscipline(String subdiscipline) {
        this.subdiscipline = subdiscipline;
    }

    public String getPrCode() {
        return prCode;
    }

    public void setPrCode(String prCode) {
        this.prCode = prCode;
    }

    public String getPrName() {
        return prName;
    }

    public void setPrName(String prName) {
        this.prName = prName;
    }

    public String getPrCodeStd() {
        return prCodeStd;
    }

    public void setPrCodeStd(String prCodeStd) {
        this.prCodeStd = prCodeStd;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getPrDuration() {
        return prDuration;
    }

    public void setPrDuration(String prDuration) {
        this.prDuration = prDuration;
    }

    public String getDcgCode() {
        return dcgCode;
    }

    public void setDcgCode(String dcgCode) {
        this.dcgCode = dcgCode;
    }

    public String getDocId() {
        return docId;
    }

    public void setDocId(String docId) {
        this.docId = docId;
    }

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public String getLocCode() {
        return locCode;
    }

    public void setLocCode(String locCode) {
        this.locCode = locCode;
    }

    public String getLocName() {
        return locName;
    }

    public void setLocName(String locName) {
        this.locName = locName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getRecHFCcode() {
        return recHFCcode;
    }

    public void setRecHFCcode(String recHFCcode) {
        this.recHFCcode = recHFCcode;
    }

    public String getEpisodeDate() {
        return episodeDate;
    }

    public void setEpisodeDate(String episodeDate) {
        this.episodeDate = episodeDate;
    }

    public String getPMI_no() {
        return PMI_no;
    }

    public void setPMI_no(String PMI_no) {
        this.PMI_no = PMI_no;
    }

    public String getEncounter_Date() {
        return Encounter_Date;
    }

    public void setEncounter_Date(String Encounter_Date) {
        this.Encounter_Date = Encounter_Date;
    }
}
