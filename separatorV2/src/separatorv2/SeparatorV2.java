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
        this.vccn = new Vector<>();
        this.vdab = new Vector<>();
        this.vfmh = new Vector<>();
        this.vhpi = new Vector<>();
        this.vimu = new Vector<>();
        this.vlio = new Vector<>();
        this.vlir = new Vector<>();
        this.vmec = new Vector<>();
        this.vpmh = new Vector<>();
        this.vpnt = new Vector<>();
        this.vros = new Vector<>();
        this.vsoh = new Vector<>();
        this.vvts = new Vector<>();  
        this.vbld = new Vector<>();
        this.valg = new Vector<>();
        this.vorc = new Vector<>();
        this.vdto = new Vector<>();
        this.vdgs = new Vector<>();
        this.vbli = new Vector<>();
        this.vadw = new Vector<>();
        this.vmsh = new Vector<>();
        this.vpdi = new Vector<>();
        this.vpos = new Vector<>();
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
                sm.showAAL();
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
    
    public static void main(String[] args) {
        String hai = "ORC|"
                + "T12113|"
                + "PIS20170000001|"
                + "|"
                + "|"
                + "NORMAL|"
                + "10042017^10:23:34|"
                + "10042017^09:23:34|"
                + "10042017^10:50:34|"
                + "00717|"
                + "KAMIL|"
                + "|"
                + "UTEM KAMPUS INDUK|"
                + "OUTPATIENT|"
                + "|"
                + "04|"
                + "06-3315032|"
                + "PKU, UNIVERSITI TEKNIKAL MALAYSIA MELAKA|"
                + "HANG TUAH JAYA|"
                + "DURIAN TUNGGAL|"
                + " MELAKA|"
                + "MELAKA TENGAH|"
                + "MELAKA|"
                + "MALAYSIA|"
                + "77900|"
                + "06-3319298|"
                + "UTEM KAMPUS INDUK|"
                + "OUTPATIENT|"
                + "|"
                + "08|"
                + "06-3315032|"
                + "PKU, UNIVERSITI TEKNIKAL MALAYSIA MELAKA|"
                + "HANG TUAH JAYA|DURIAN TUNGGAL| "
                + "MELAKA|"
                + " MELAKA TENGAH|"
                + "MELAKA|"
                + "MALAYSIA|"
                + "77900|"
                + "06-3319298|"
                + "All payment mode should be in cash|"
                + "<cr>"
                + "DGS|"
                + "2017-4-21 17:47:25|"
                + "null^^^^^^01A90A932^Colorado tick fever^^null^^null^^^^null^^^^^^2017-4-21 17:47:25^04010101^Dr002^PROF KHANAPI GHANI^^^|"
                + "<cr>";
        
        String hai2 = "MSH|^~|CIS|04010101^002^1||2017-4-27 12:15:40|||||||||||||<cr>\n" +
"PDI|9507060252694|MOHAMAD ARIF SUFFIAN BIN MOHAMAD SHOKRI|950706025269|-|012^Matric No.^004|D031310032|041^Male^001|06/07/1995|004^-^-|006^-^-|005^--|011^-^-|159 TAMAN MAWAR|||003^-^-|088^-^-|002^-^-|001^-^MALAYSIA|-|-||-|email@email.com|<cr>\n" +
"CCN|2017-4-27 12:15:40|^A600.^Jungle yellow fever ^^Mild^2^^Hour^^Right^^Right^no coment|<cr>\n" +
"DGS|2017-4-27 12:15:40|Final^^^05-04-2017^^^01A90A9601A90A969^Arenaviral haemorrhagic fever^^Mild^^Left^^^^Right^^^no comment^^^2017-4-27 12:15:40^04010101^ahmed_93^AHMED ABDALLAH SHEIKH^-^-^-|<cr>\n" +
"ORC|T12101|||NO|Normal|2017-4-27 12:15:40|2017-04-27 04:48:51.0|2017-04-27 04:48:51.0|ahmed_93|ahmed_93||04010101|002|1|1|02| Hang Tuah Jaya, 76100 Durian Tunggal,|Melaka, Malaysia|||DURIAN TUNGGAL|Melaka|MALAYSIA|001||04010101|-||05| Hang Tuah Jaya, 76100 Durian Tunggal,|Melaka, Malaysia||DURIAN TUNGGAL|<cr>\n" +
"LIO|A600.^Jungle yellow fever ^01A90A9601A90A969^Arenaviral haemorrhagic fever^CTV3|DC2P000^Alkaline Phosphatase^ICD10-PCS|14-04-2017|038^Normal^P01|096^PC01^Conscious|04010101^Klinik UTeM Induk^PSDD||04010101^Klinik UTeM Induk^002^Inpatient Discipline^1^Anesthesiology^|<cr>\n" +
"LIO|A600.^Jungle yellow fever ^01A90A9601A90A969^Arenaviral haemorrhagic fever^CTV3|DCBM000^Adrenaline (Epinephrine)^ICD10-PCS|14-04-2017|038^Urgent^P02|096^PC02^Unconscious|04010101^Klinik UTeM Induk^PSDD||04010101^Klinik UTeM Induk^002^Inpatient Discipline^1^Anesthesiology^|<cr>\n" +
"LIO|A600.^Jungle yellow fever ^01A90A9601A90A969^Arenaviral haemorrhagic fever^CTV3|DM6j03r^Culture Mycobacterium^ICD10-PCS||038^Urgent^P02|096^PC02^Unconscious|04010101^Klinik UTeM Induk^PSDD|no comment|04010101^Klinik UTeM Induk^002^Inpatient Discipline^1^Anesthesiology^|<cr>\n" +
"LIO|A600.^Jungle yellow fever ^01A90A9601A90A969^Arenaviral haemorrhagic fever^CTV3|DP0E333^Histopathological Examination^ICD10-PCS|06-04-2017|038^Normal^P01|096^PC02^Unconscious|04010101^Klinik UTeM Induk^PSDD|no comment|04010101^Klinik UTeM Induk^002^Inpatient Discipline^1^Anesthesiology^|<cr>";

        SeparatorV2 spv2 = new SeparatorV2();
        spv2.startProcess(hai2);
        

    }
    
}
