/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import Bean.ERRCOUNT;
import Bean.MSH;
import Bean.PDI;
import java.io.FileNotFoundException;
import java.io.IOException;
import lhr_tables.*;
import lhr_tables.update_ehr_central;
import separatorv2.SeparatorV2;

/**
 *
 * @author shay
 */
public class MainExtractor {

    SeparatorV2 spv2 = new SeparatorV2();
    get_ehr_central_data t = new get_ehr_central_data();
    boolean query = t.getQuery();
    
    public boolean extract() throws FileNotFoundException, IOException {
        
        ERRCOUNT.setCounterError(0);
        ERRCOUNT.setErrMsg("");
        
        
        System.out.println("central code: "+t.getCentral_Code());
        if (query == true) {
            
            spv2.startProcess(t.getTxndata());
            
            lhr_PDI lhr_pde = new lhr_PDI();
            PDI pdi = lhr_pde.lhr_PDI(spv2.getVpdi(), t);
            //MSH
            lhr_MSH lhr_msh = new lhr_MSH();
            MSH msh = lhr_msh.M_MSH(spv2.getVmsh(),t);

            //CCN
            lhr_CCN lhr_ccn = new lhr_CCN();
            lhr_ccn.M_CCN(spv2.getVccn(), t,msh,pdi);

            //DGS
            lhr_DGS lhr_dgs = new lhr_DGS();
            lhr_dgs.M_DGS(spv2.getVdgs(), t,msh);

            //FMH
            lhr_FMH lhr_fmh = new lhr_FMH();
            lhr_fmh.M_FMH(spv2.getVfmh(), t,msh);
            
            //LIR
            lhr_LIR lhr_lir = new lhr_LIR();
            lhr_lir.M_LIR(spv2.getVlir(), t,msh);
            //MEC
            lhr_MEC lhr_mec = new lhr_MEC();
            lhr_mec.M_MEC(spv2.getVmec(), spv2.getVdgs(), spv2.getVccn(), t,msh);
            //PMH
            lhr_PMH lhr_pmh = new lhr_PMH();
            lhr_pmh.M_PMH(spv2.getVpmh(), t,msh);

            //VTS
            lhr_VTS lhr_vts = new lhr_VTS();
            lhr_vts.M_VTS(spv2.getVvts(), t,msh);
            //HPI
            lhr_HPI lhr_hpi = new lhr_HPI();
            lhr_hpi.M_HPI(spv2.getVhpi(), t,msh);
            //ALG
            lhr_ALG lhr_alg = new lhr_ALG();
            lhr_alg.M_ALG(spv2.getValg(), t,msh);

            //SOH
            lhr_SOH lhr_soh = new lhr_SOH();
            lhr_soh.M_SOH(spv2.getVsoh(), t,msh);
            //BLD
            lhr_BLD lhr_bld = new lhr_BLD();
            lhr_bld.M_BLD(spv2.getVbld(), t,msh,pdi);
            //IMU
            lhr_IMU lhr_imu = new lhr_IMU();
            lhr_imu.M_IMU(spv2.getVimu(), t,msh);
            //DAS
            lhr_DAB lhr_dab = new lhr_DAB();
            lhr_dab.M_DAB(spv2.getVdab(), t,msh);

            //PNT
            lhr_PNT lhr_pnt = new lhr_PNT();
            lhr_pnt.M_PNT(spv2.getVpnt(), t,msh,pdi);

            //DDR
            lhr_DDR lhr_ddr = new lhr_DDR();
            lhr_ddr.M_DDR(spv2.getVddr(), t,msh,spv2.getVorc());

            //RRS
            lhr_RRS lhr_rrs = new lhr_RRS();
            lhr_rrs.M_RRS(spv2.getVrrs(), t,spv2.getVorc(),msh);
     
            //DCG
            lhr_DCG lhr_dcg = new lhr_DCG();
            lhr_dcg.M_DCG(spv2.getVdcg(),t,msh);
            
            //ARP
            lhr_ARP lhr_arp = new lhr_ARP();
            lhr_arp.M_ARP(spv2.getVarp(), t, spv2.getVorc(),msh,pdi);
            
            //PEM
            lhr_PEM lhr_pem = new lhr_PEM();
            lhr_pem.M_PEM(spv2.getVpem(), t,msh);
            
            
            int nums = ERRCOUNT.getCounterError();
            System.out.println("error: "+ nums);
            update_ehr_central u = new update_ehr_central();
            if(nums <= 0 ){
                u.update_status(t.getCentral_Code());
            }else if(nums > 0){
                u.update_status(t.getCentral_Code());
                u.update_status_5(t.getCentral_Code());
                System.out.println("error " + ERRCOUNT.getErrMsg());
            }
            
        } else {
            System.out.println("No data");
        }
        return true;
    }

}
