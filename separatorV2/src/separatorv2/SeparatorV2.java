/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package separatorv2;

import bean.*;


import controller.SeperateMethod;
import java.util.Vector;

/**
 *
 * @author shay
 */
public class SeparatorV2 {
    
    private Vector<ORC2> vorc;
    private Vector<DTO2> vdto;
    private Vector<DGS2> vdgs;
    private Vector<ALG2> valg;
    private Vector<BLD2> vbld;
    private Vector<CCN2> vccn;
    private Vector<DAB2> vdab;
    private Vector<FMH2> vfmh;
    private Vector<HPI2> vhpi;
    private Vector<IMU2> vimu;
    private Vector<LIO2> vlio;
    private Vector<LIR2> vlir;
    private Vector<MEC2> vmec;
    private Vector<PMH2> vpmh;
    private Vector<PNT2> vpnt;
    private Vector<ROS2> vros;
    private Vector<SOH2> vsoh;
    private Vector<VTS2> vvts;
    private Vector<ADW2> vadw;
    private Vector<BLI2> vbli;

    public SeparatorV2() {
        this.vccn = new Vector<CCN2>();
        this.vdab = new Vector<DAB2>();
        this.vfmh = new Vector<FMH2>();
        this.vhpi = new Vector<HPI2>();
        this.vimu = new Vector<IMU2>();
        this.vlio = new Vector<LIO2>();
        this.vlir = new Vector<LIR2>();
        this.vmec = new Vector<MEC2>();
        this.vpmh = new Vector<PMH2>();
        this.vpnt = new Vector<PNT2>();
        this.vros = new Vector<ROS2>();
        this.vsoh = new Vector<SOH2>();
        this.vvts = new Vector<VTS2>();  
        this.vbld = new Vector<BLD2>();
        this.valg = new Vector<ALG2>();
        this.vorc = new Vector<ORC2>();
        this.vdto = new Vector<DTO2>();
        this.vdgs = new Vector<DGS2>();
        this.vbli = new Vector<BLI2>();
        this.vadw = new Vector<ADW2>();
    }

    public Vector<ORC2> getVorc() {
        return vorc;
    }

    public Vector<DTO2> getVdto() {
        return vdto;
    }

    public Vector<DGS2> getVdgs() {
        return vdgs;
    }

    public Vector<ALG2> getValg() {
        return valg;
    }

    public Vector<BLD2> getVbld() {
        return vbld;
    }

    public Vector<CCN2> getVccn() {
        return vccn;
    }

    public Vector<DAB2> getVdab() {
        return vdab;
    }

    public Vector<FMH2> getVfmh() {
        return vfmh;
    }

    public Vector<HPI2> getVhpi() {
        return vhpi;
    }

    public Vector<IMU2> getVimu() {
        return vimu;
    }

    public Vector<LIO2> getVlio() {
        return vlio;
    }

    public Vector<LIR2> getVlir() {
        return vlir;
    }

    public Vector<MEC2> getVmec() {
        return vmec;
    }

    public Vector<PMH2> getVpmh() {
        return vpmh;
    }

    public Vector<PNT2> getVpnt() {
        return vpnt;
    }

    public Vector<ROS2> getVros() {
        return vros;
    }

    public Vector<SOH2> getVsoh() {
        return vsoh;
    }

    public Vector<VTS2> getVvts() {
        return vvts;
    }
    
    public Vector<ADW2> getVadw() {
        return vadw;
    }

    public Vector<BLI2> getVbli() {
        return vbli;
    }
    
    
    public void startProcess(String hai){
         String rows[] = hai.split("\\<cr>");
        int rowNum = rows.length;
         System.out.println(rowNum);
         
         
        for(int i = 0;i < rowNum;i++){
            System.out.println(rows[i]);
            String cols[] = rows[i].split("\\|");
            SeperateMethod sm = new SeperateMethod();
            if(cols[0].contains("ORC")){
                ORC2 orc = new ORC2();                            
                sm.separatePipe(rows[i]);
                sm.showAAL();
                orc.setValue(sm.getAal());
                vorc.addElement(orc);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("DGS")){
                DGS2 dgs = new DGS2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                dgs.setValue(sm.getAal());
                vdgs.addElement(dgs);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("DTO")){
                DTO2 dto = new DTO2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                dto.setValue(sm.getAal());
                vdto.addElement(dto);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("ALG")){
                ALG2 alg = new ALG2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                alg.setValue(sm.getAal());
                valg.addElement(alg);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("BLD")){
                BLD2 bld = new BLD2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                bld.setValue(sm.getAal());
                vbld.addElement(bld);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("CCN")){
                CCN2 ccn = new CCN2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                ccn.setValue(sm.getAal());
                vccn.addElement(ccn);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("DAB")){
                DAB2 dab = new DAB2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                dab.setValue(sm.getAal());
                vdab.addElement(dab);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("FMH")){
                FMH2 fmh = new FMH2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                fmh.setValue(sm.getAal());
                vfmh.addElement(fmh);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("HPI")){
                HPI2 hpi = new HPI2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                hpi.setValue(sm.getAal());
                vhpi.addElement(hpi);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("IMU")){
                IMU2 imu = new IMU2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                imu.setValue(sm.getAal());
                vimu.addElement(imu);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("LIO")){
                LIO2 lio = new LIO2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                lio.setValue(sm.getAal());
                vlio.addElement(lio);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("LIR")){
                LIR2 lir = new LIR2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                lir.setValue(sm.getAal());
                vlir.addElement(lir);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("MEC")){
                MEC2 mec = new MEC2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                mec.setValue(sm.getAal());
                vmec.addElement(mec);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("PMH")){
                PMH2 pmh = new PMH2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                pmh.setValue(sm.getAal());
                vpmh.addElement(pmh);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("PNT")){
                PNT2 pnt = new PNT2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                pnt.setValue(sm.getAal());
                vpnt.addElement(pnt);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("ROS")){
                ROS2 ros = new ROS2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                ros.setValue(sm.getAal());
                vros.addElement(ros);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("SOH")){
                SOH2 soh = new SOH2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                soh.setValue(sm.getAal());
                vsoh.addElement(soh);
                System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("VTS")){
                VTS2 vts = new VTS2();
                sm.separatePipe(rows[i]);
                sm.showAAL();
                vts.setValue(sm.getAal());
                vvts.addElement(vts);
                System.out.println("---------------------------------------------------------------------------------");
            }
        }
        
    }
    
//    public static void main(String[] args) {
//        String hai = "ORC|"
//                + "T12113|"
//                + "PIS20170000001|"
//                + "|"
//                + "|"
//                + "NORMAL|"
//                + "10042017^10:23:34|"
//                + "10042017^09:23:34|"
//                + "10042017^10:50:34|"
//                + "00717|"
//                + "KAMIL|"
//                + "|"
//                + "UTEM KAMPUS INDUK|"
//                + "OUTPATIENT|"
//                + "|"
//                + "04|"
//                + "06-3315032|"
//                + "PKU, UNIVERSITI TEKNIKAL MALAYSIA MELAKA|"
//                + "HANG TUAH JAYA|"
//                + "DURIAN TUNGGAL|"
//                + " MELAKA|"
//                + "MELAKA TENGAH|"
//                + "MELAKA|"
//                + "MALAYSIA|"
//                + "77900|"
//                + "06-3319298|"
//                + "UTEM KAMPUS INDUK|"
//                + "OUTPATIENT|"
//                + "|"
//                + "08|"
//                + "06-3315032|"
//                + "PKU, UNIVERSITI TEKNIKAL MALAYSIA MELAKA|"
//                + "HANG TUAH JAYA|DURIAN TUNGGAL| "
//                + "MELAKA|"
//                + " MELAKA TENGAH|"
//                + "MELAKA|"
//                + "MALAYSIA|"
//                + "77900|"
//                + "06-3319298|"
//                + "All payment mode should be in cash|"
//                + "<cr>"
//                + "DGS|"
//                + "2017-4-21 17:47:25|"
//                + "null^^^^^^01A90A932^Colorado tick fever^^null^^null^^^^null^^^^^^2017-4-21 17:47:25^04010101^Dr002^PROF KHANAPI GHANI^^^|"
//                + "<cr>";
//        
//        String hai2 = "MSH|"
//                + "^~(|"
//                + "CIS|"
//                + "04010101^001^001|"
//                + "-|"
//                + "2017-4-17 14:27:12|"
//                + "-|"
//                + "-|"
//                + "-^^^^-^|"
//                + "-|"
//                + "-|"
//                + "-|"
//                + "-|"
//                + "-|"
//                + "-|"
//                + "|"
//                + "|"
//                + "|"
//                + "|"
//                + "<cr>"+
//"PDI|9504050251851|MUHAMAD BUDIE BIN BASRI|950405025185|-|012^Matric No.^004|D031310012|041^Male^001|05/04/1995|004^-^-|006^SINGLE^1|005^Islam01|011^Malaysian^001|NO 74,LORONG SHAHBANDAR 39|||003^PULAU RUSUKAN KECIL^150031|088^MELAKA TENGAH^401|002^Kedah^02|001^MALAYSIA^001|2499|-||0175757018|email@email.com|<cr>" +
//"ORC|T12101|NO^undefined^2017-4-12 23:25:59^2017-04-12 22:58:20.0^2017-04-12 22:58:20.0^budie01^budie01^-^04010101^001^001^001^02^address1^address2^address3^orderHFCtown^orderHFCDistrict^orderHFCState^orderHFCCountry^orderHFCPostcode^orderHFCPhoneNo^041140^001^providerSub^05^providerAdd_HIM^providerAdd_ME^providerAdd3^providerTown|<cr>" +
//"LIO|19B5.^Excessive flatulence^01A30B542^high fever^CTV3|DC2P008^Phosphatase, Isoenzymes,ICD10-PCS^19-04-2017^038^nothing^nothing^096^test1^test2^Biocore_V1^Hospital Pakar Sakit Puan^PPP^asadas^04010101^Klinik UTeM Induk^001^Outpatient Discipline^002^-^|<cr>" +
//"DTO|19B2.^Excessive flatulence^01A30A421^Abdominal actinomycosis^CTV3|MSP014002^ Annucare supp^MDC|No product name^02^EE^MDC|066^FF^|^6 hourly^SG|Day|1||025^^Before meats|12|21|hfcSendCode^hfcSendName^PSDD|qdqwe^qwewq|04010101^Klinik UTeM Induk^001^Outpatient Discipline^001^04^|<cr>"
//                + "ORC|T12113|170000061^-^NO^NORMAL^2017-04-23 02:00:02^2017-04-08 13:29:29.0^2017-04-08 13:29:29.0^DR024^DR024^-^04010101^Klinik UTeM Induk^001^Outpatient Discipline^001-Outpatient Discipline^04^-^ Hang Tuah Jaya, 76100 Durian Tunggal,^Melaka, Malaysia^-^0003^40305^DURIAN TUNGGAL^-^0078^403-ALOR GAJAH^0002^04^Melaka^0001^001^MALAYSIA^0079^1936^76100^-^04010101^Klinik UTeM Induk^001^Outpatient Discipline^001^Outpatient Discipline^-^-^-^0003^40305^DURIAN TUNGGAL^0078^403^ALOR GAJAH^0002^08^Melaka^0001^001^MALAYSIA^0079^1936^76100^-^|<cr>" +
//"BLI|2017-4-23 2:2:2|CH^9504050251851^MTA013001^albendazole^2.60^12^DR024^2017-4-23 2:2:2<cr>";
//
//        SeparatorV2 spv2 = new SeparatorV2();
//        spv2.startProcess(hai2);
//        
//
//    }
    
}
