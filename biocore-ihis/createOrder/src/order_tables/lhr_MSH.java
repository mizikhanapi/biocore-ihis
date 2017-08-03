/*
 * Copyright 2017 shay.
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
package order_tables;

import Bean.MSH;
import bean.MSH2;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author shay
 */
public class lhr_MSH {
        
    public MSH M_MSH(Vector<MSH2> msh, get_ehr_central_data t) {
        MSH mshbean = new MSH();
        try {
            int rowDCG = msh.size();
            if (rowDCG > 0) {
                    try {
                        ArrayList<ArrayList<String>> alMSH = msh.get(0).getValue();
                        
                        mshbean.setFieldSeparator(alMSH.get(0).get(0));
                        
                        mshbean.setEncodingCharacter(alMSH.get(1).get(0));
                        
                        mshbean.setSendingApplication(alMSH.get(2).get(0));
                        
                        mshbean.setSendingFacilityCode(alMSH.get(3).get(0));
                        mshbean.setSendingFacilityDis(alMSH.get(3).get(1));
                        mshbean.setSendingFacilitySubDis(alMSH.get(3).get(2));
                        
                        mshbean.setRecievingApplication(alMSH.get(4).get(0));
                        
                        mshbean.setReceivingFacilityCode(alMSH.get(5).get(0));
                        mshbean.setReceivingFacilityDis(alMSH.get(5).get(1));
                        mshbean.setReceivingFacilitySubDis(alMSH.get(5).get(2));
                        
                        mshbean.setDateTime(alMSH.get(6).get(0));
                        
                        mshbean.setSecurity(alMSH.get(7).get(0));
                        
                        //so far not used yet
                        
//                        mshbean.setMessageType(alMSH.get(8).get(0));
//                        mshbean.setEventTransaction(alMSH.get(8).get(1));
//                        
//                        mshbean.setMessageCtrlId(alMSH.get(9).get(0));
//                        
//                        mshbean.setProcessingId(alMSH.get(10).get(0));
//                        
//                        mshbean.setVersionId(alMSH.get(11).get(0));
//                        
//                        mshbean.setSequenceId(alMSH.get(12).get(0));
//                        
//                        mshbean.setContinuationPointer(alMSH.get(13).get(0));
//                       
//                        mshbean.setAcceptAcknowledgeTypeValue(alMSH.get(14).get(0));
//                        mshbean.setAcceptAcknowledgeTypeDesc(alMSH.get(14).get(1));
//                        mshbean.setAcceptAcknowledgeTypeCodingStand(alMSH.get(14).get(2));
//                        
//                        mshbean.setCountryCode(alMSH.get(15).get(0));
//                        mshbean.setCountryCodeDesc(alMSH.get(15).get(2));
//                        mshbean.setCountryCodeDetailRef(alMSH.get(15).get(1));
//                        
//                        mshbean.setCharacterSet(alMSH.get(16).get(0));
//                        
//                        mshbean.setPrincipalLang(alMSH.get(17).get(0));

                       
                        

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mshbean;
    }
}
