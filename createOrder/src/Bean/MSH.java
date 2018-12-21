/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author shay
 */
public class MSH {

    private String fieldSeparator,
            encodingCharacter,
            sendingApplication,
            sendingFacilityCode, sendingFacilityDis,
            sendingFacilitySubDis,
            recievingApplication,
            receivingFacilityCode, receivingFacilityDis, receivingFacilitySubDis,
            dateTime,
            security,
            messageType, eventTransaction,
            messageCtrlId,
            processingId,
            versionId,
            sequenceId,
            continuationPointer,
            acceptAcknowledgeTypeValue, acceptAcknowledgeTypeDesc, acceptAcknowledgeTypeCodingStand,
            appAcknowledgeTypeValue, appAcknowledgeTypeDesc,
            appAcknowledgeTypeCodingStand,
            countryCode, countryCodeDetailRef, countryCodeDesc,
            characterSet,
            principalLang;
    private String discipline;
    private String subdiscipline;

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

    public String getFieldSeparator() {
        return fieldSeparator;
    }

    public void setFieldSeparator(String fieldSeparator) {
        this.fieldSeparator = fieldSeparator;
    }

    public String getEncodingCharacter() {
        return encodingCharacter;
    }

    public void setEncodingCharacter(String encodingCharacter) {
        this.encodingCharacter = encodingCharacter;
    }

    public String getSendingApplication() {
        return sendingApplication;
    }

    public void setSendingApplication(String sendingApplication) {
        this.sendingApplication = sendingApplication;
    }

    public String getSendingFacilityCode() {
        return sendingFacilityCode;
    }

    public void setSendingFacilityCode(String sendingFacilityCode) {
        this.sendingFacilityCode = sendingFacilityCode;
    }

    public String getSendingFacilityDis() {
        return sendingFacilityDis;
    }

    public void setSendingFacilityDis(String sendingFacilityDis) {
        this.sendingFacilityDis = sendingFacilityDis;
    }

    public String getSendingFacilitySubDis() {
        return sendingFacilitySubDis;
    }

    public void setSendingFacilitySubDis(String sendingFacilitySubDis) {
        this.sendingFacilitySubDis = sendingFacilitySubDis;
    }

    public String getRecievingApplication() {
        return recievingApplication;
    }

    public void setRecievingApplication(String recievingApplication) {
        this.recievingApplication = recievingApplication;
    }

    public String getReceivingFacilityCode() {
        return receivingFacilityCode;
    }

    public void setReceivingFacilityCode(String receivingFacilityCode) {
        this.receivingFacilityCode = receivingFacilityCode;
    }

    public String getReceivingFacilityDis() {
        return receivingFacilityDis;
    }

    public void setReceivingFacilityDis(String receivingFacilityDis) {
        this.receivingFacilityDis = receivingFacilityDis;
    }

    public String getReceivingFacilitySubDis() {
        return receivingFacilitySubDis;
    }

    public void setReceivingFacilitySubDis(String receivingFacilitySubDis) {
        this.receivingFacilitySubDis = receivingFacilitySubDis;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }

    public String getSecurity() {
        return security;
    }

    public void setSecurity(String security) {
        this.security = security;
    }

    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    public String getEventTransaction() {
        return eventTransaction;
    }

    public void setEventTransaction(String eventTransaction) {
        this.eventTransaction = eventTransaction;
    }

    public String getMessageCtrlId() {
        return messageCtrlId;
    }

    public void setMessageCtrlId(String messageCtrlId) {
        this.messageCtrlId = messageCtrlId;
    }

    public String getProcessingId() {
        return processingId;
    }

    public void setProcessingId(String processingId) {
        this.processingId = processingId;
    }

    public String getVersionId() {
        return versionId;
    }

    public void setVersionId(String versionId) {
        this.versionId = versionId;
    }

    public String getSequenceId() {
        return sequenceId;
    }

    public void setSequenceId(String sequenceId) {
        this.sequenceId = sequenceId;
    }

    public String getContinuationPointer() {
        return continuationPointer;
    }

    public void setContinuationPointer(String continuationPointer) {
        this.continuationPointer = continuationPointer;
    }

    public String getAcceptAcknowledgeTypeValue() {
        return acceptAcknowledgeTypeValue;
    }

    public void setAcceptAcknowledgeTypeValue(String acceptAcknowledgeTypeValue) {
        this.acceptAcknowledgeTypeValue = acceptAcknowledgeTypeValue;
    }

    public String getAcceptAcknowledgeTypeDesc() {
        return acceptAcknowledgeTypeDesc;
    }

    public void setAcceptAcknowledgeTypeDesc(String acceptAcknowledgeTypeDesc) {
        this.acceptAcknowledgeTypeDesc = acceptAcknowledgeTypeDesc;
    }

    public String getAcceptAcknowledgeTypeCodingStand() {
        return acceptAcknowledgeTypeCodingStand;
    }

    public void setAcceptAcknowledgeTypeCodingStand(String acceptAcknowledgeTypeCodingStand) {
        this.acceptAcknowledgeTypeCodingStand = acceptAcknowledgeTypeCodingStand;
    }

    public String getAppAcknowledgeTypeValue() {
        return appAcknowledgeTypeValue;
    }

    public void setAppAcknowledgeTypeValue(String appAcknowledgeTypeValue) {
        this.appAcknowledgeTypeValue = appAcknowledgeTypeValue;
    }

    public String getAppAcknowledgeTypeDesc() {
        return appAcknowledgeTypeDesc;
    }

    public void setAppAcknowledgeTypeDesc(String appAcknowledgeTypeDesc) {
        this.appAcknowledgeTypeDesc = appAcknowledgeTypeDesc;
    }

    public String getAppAcknowledgeTypeCodingStand() {
        return appAcknowledgeTypeCodingStand;
    }

    public void setAppAcknowledgeTypeCodingStand(String appAcknowledgeTypeCodingStand) {
        this.appAcknowledgeTypeCodingStand = appAcknowledgeTypeCodingStand;
    }

    public String getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    public String getCountryCodeDetailRef() {
        return countryCodeDetailRef;
    }

    public void setCountryCodeDetailRef(String countryCodeDetailRef) {
        this.countryCodeDetailRef = countryCodeDetailRef;
    }

    public String getCountryCodeDesc() {
        return countryCodeDesc;
    }

    public void setCountryCodeDesc(String countryCodeDesc) {
        this.countryCodeDesc = countryCodeDesc;
    }

    public String getCharacterSet() {
        return characterSet;
    }

    public void setCharacterSet(String characterSet) {
        this.characterSet = characterSet;
    }

    public String getPrincipalLang() {
        return principalLang;
    }

    public void setPrincipalLang(String principalLang) {
        this.principalLang = principalLang;
    }

}
