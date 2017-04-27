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
    private Vector<MSH2> vmsh;
    private Vector<PDI2> vpdi;
    private Vector<POS2> vpos;

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
        this.vmsh = new Vector<MSH2>();
        this.vpdi = new Vector<PDI2>();
        this.vpos = new Vector<POS2>();
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
    public Vector<MSH2> getVmsh() {
        return vmsh;
    }
    public Vector<PDI2> getVpdi() {
        return vpdi;
    }
    public Vector<POS2> getVpos() {
        return vpos;
    }
    
    
    public void startProcess(String hai){
         String rows[] = hai.split("\\<cr>");
        int rowNum = rows.length;
         //System.out.println(rowNum);
         
         
        for(int i = 0;i < rowNum;i++){
            //System.out.println(rows[i]);
            String cols[] = rows[i].split("\\|");
            SeperateMethod sm = new SeperateMethod();
            if(cols[0].contains("ORC")){
                ORC2 orc = new ORC2();                            
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                orc.setValue(sm.getAal());
                vorc.addElement(orc);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("DGS")){
                DGS2 dgs = new DGS2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                dgs.setValue(sm.getAal());
                vdgs.addElement(dgs);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("DTO")){
                DTO2 dto = new DTO2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                dto.setValue(sm.getAal());
                vdto.addElement(dto);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("ALG")){
                ALG2 alg = new ALG2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                alg.setValue(sm.getAal());
                valg.addElement(alg);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("BLD")){
                BLD2 bld = new BLD2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                bld.setValue(sm.getAal());
                vbld.addElement(bld);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("CCN")){
                CCN2 ccn = new CCN2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                ccn.setValue(sm.getAal());
                vccn.addElement(ccn);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("DAB")){
                DAB2 dab = new DAB2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                dab.setValue(sm.getAal());
                vdab.addElement(dab);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("FMH")){
                FMH2 fmh = new FMH2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                fmh.setValue(sm.getAal());
                vfmh.addElement(fmh);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("HPI")){
                HPI2 hpi = new HPI2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                hpi.setValue(sm.getAal());
                vhpi.addElement(hpi);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("IMU")){
                IMU2 imu = new IMU2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                imu.setValue(sm.getAal());
                vimu.addElement(imu);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("LIO")){
                LIO2 lio = new LIO2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                lio.setValue(sm.getAal());
                vlio.addElement(lio);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("LIR")){
                LIR2 lir = new LIR2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                lir.setValue(sm.getAal());
                vlir.addElement(lir);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("MEC")){
                MEC2 mec = new MEC2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                mec.setValue(sm.getAal());
                vmec.addElement(mec);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("PMH")){
                PMH2 pmh = new PMH2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                pmh.setValue(sm.getAal());
                vpmh.addElement(pmh);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("PNT")){
                PNT2 pnt = new PNT2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                pnt.setValue(sm.getAal());
                vpnt.addElement(pnt);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("ROS")){
                ROS2 ros = new ROS2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                ros.setValue(sm.getAal());
                vros.addElement(ros);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("SOH")){
                SOH2 soh = new SOH2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                soh.setValue(sm.getAal());
                vsoh.addElement(soh);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("VTS")){
                VTS2 vts = new VTS2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                vts.setValue(sm.getAal());
                vvts.addElement(vts);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("BLI")){
                BLI2 bli = new BLI2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                bli.setValue(sm.getAal());
                vbli.addElement(bli);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("ADW")){
                ADW2 adw = new ADW2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                adw.setValue(sm.getAal());
                vadw.addElement(adw);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("MSH")){
                MSH2 msh = new MSH2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                msh.setValue(sm.getAal());
                vmsh.addElement(msh);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("PDI")){
                PDI2 pdi = new PDI2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                pdi.setValue(sm.getAal());
                vpdi.addElement(pdi);
                //System.out.println("---------------------------------------------------------------------------------");
            }else if(cols[0].contains("POS")){
                POS2 pos = new POS2();
                sm.separatePipe(rows[i]);
                //sm.showAAL();
                pos.setValue(sm.getAal());
                vpos.addElement(pos);
                //System.out.println("---------------------------------------------------------------------------------");
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
//        String hai2 = "MSH|^~|CIS|BC001^001^001||2017-4-26 15:51:39|||||||||||||<cr>\n" +
//"PDI|9409110361284|HANNANI BINTI MOHD ROOM|940911036128|-|012^Matric No.^004|B031310399|041^Female^002|11/09/1994|004^-^-|006^SINGLE^1|005^--|011^Malaysian^001|LOT 2832 KAMPUNG PADANG BONGOR|||003^-^-|088^-^-|002^-^-|001^-^-|-|-||0137892739|-|<cr>\n" +
//"CCN|2017-4-26 15:50:47|^1682.^Fatigue^^Severity^^^null^^null^^null^|<cr>\n" +
//"DGS|2017-4-26 15:50:47|null^^^^^^13M45M484^Fatigue fracture of vertebra^^null^^null^^^^null^^^^^^2017-4-26 15:50:47^BC001^mizikhanapi^MIZI KHANAPI^^^|<cr>\n" +
//"CCN|2017-4-26 15:50:52|^1682.^Fatigue^^Severity^^^null^^null^^null^|<cr>\n" +
//"DGS|2017-4-26 15:50:52|null^^^^^^13M45M484^Fatigue fracture of vertebra^^null^^null^^^^null^^^^^^2017-4-26 15:50:52^BC001^mizikhanapi^MIZI KHANAPI^^^|<cr>\n" +
//"CCN|2017-4-26 15:50:59|^1682.^Fatigue^^Severity^^^null^^null^^null^|<cr>\n" +
//"DGS|2017-4-26 15:50:59|null^^^^^^13M45M484^Fatigue fracture of vertebra^^null^^null^^^^null^^^^^^2017-4-26 15:50:59^BC001^mizikhanapi^MIZI KHANAPI^^^|<cr>\n" +
//"CCN|2017-4-26 15:51:2|^1682.^Fatigue^^Severity^^^null^^null^^null^|<cr>\n" +
//"DGS|2017-4-26 15:51:2|null^^^^^^13M45M484^Fatigue fracture of vertebra^^null^^null^^^^null^^^^^^2017-4-26 15:51:2^BC001^mizikhanapi^MIZI KHANAPI^^^|<cr>\n" +
//"CCN|2017-4-26 15:51:11|^1682.^Fatigue^^Severity^^^null^^null^^null^|<cr>\n" +
//"DGS|2017-4-26 15:51:11|null^^^^^^13M45M484^Fatigue fracture of vertebra^^null^^null^^^^null^^^^^^2017-4-26 15:51:11^BC001^mizikhanapi^MIZI KHANAPI^^^|<cr>\n" +
//"CCN|2017-4-26 15:51:39|^1682.^Fatigue^^Severity^^^null^^null^^null^|<cr>\n" +
//"DGS|2017-4-26 15:51:39|null^^^^^^13M45M484^Fatigue fracture of vertebra^^null^^null^^^^null^^^^^^2017-4-26 15:51:39^BC001^mizikhanapi^MIZI KHANAPI^^^|<cr>\n" +
//"ORC|T12103|||NO|-|2017-4-26 15:51:39|2017-04-26 15:47:27.0|2017-04-26 15:47:27.0|mizikhanapi|mizikhanapi||BC001|001|001|001|02|-|-|-|-|-|-|-|-|-|-|-||18|-|-|-|-|<cr>\n" +
//"POS|1682.^Fatigue^CTV3|^17.1^Apply Bandage ^ICD10-PCS||Small Bandage |||||BC001|Biocore 001||hfc_cd_receiving|<cr>\n" +
//"";
//
//        SeparatorV2 spv2 = new SeparatorV2();
//        spv2.startProcess(hai2);
//        
//
//    }
    
}
