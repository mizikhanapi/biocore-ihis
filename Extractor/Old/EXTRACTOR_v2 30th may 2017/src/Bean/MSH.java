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
            sendingFacility[],
            recievingApplication,
            receivingFacility[],
            dateTime,
            security,
            messageType[],
            messageCtrlId,
            processingId,
            versionId,
            sequenceId,
            continuationPointer,
            acceptAcknowledgeType[],
            appAcknowledgeType[],
            countryCode[],
            characterSet,
            principalLang;

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

    public String[] getSendingFacility() {
        return sendingFacility;
    }

    public void setSendingFacility(String[] sendingFacility) {
        this.sendingFacility = sendingFacility;
    }

    public String getRecievingApplication() {
        return recievingApplication;
    }

    public void setRecievingApplication(String recievingApplication) {
        this.recievingApplication = recievingApplication;
    }

    public String[] getReceivingFacility() {
        return receivingFacility;
    }

    public void setReceivingFacility(String[] receivingFacility) {
        this.receivingFacility = receivingFacility;
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

    public String[] getMessageType() {
        return messageType;
    }

    public void setMessageType(String[] messageType) {
        this.messageType = messageType;
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

    public String[] getAcceptAcknowledgeType() {
        return acceptAcknowledgeType;
    }

    public void setAcceptAcknowledgeType(String[] acceptAcknowledgeType) {
        this.acceptAcknowledgeType = acceptAcknowledgeType;
    }

    public String[] getAppAcknowledgeType() {
        return appAcknowledgeType;
    }

    public void setAppAcknowledgeType(String[] appAcknowledgeType) {
        this.appAcknowledgeType = appAcknowledgeType;
    }

    public String[] getCountryCode() {
        return countryCode;
    }

    public void setCountryCode(String[] countryCode) {
        this.countryCode = countryCode;
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
