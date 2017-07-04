/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

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
    
    public boolean extract() {

        
        System.out.println(query);
        System.out.println(t.getCentral_Code());
//    System.out.println(query);
        if (query == true) {
//    System.out.println(t.getTxndata());

            spv2.startProcess(t.getTxndata());
            //PDI
//   lhr_PDI lhr_pdi = new lhr_PDI();
//   lhr_pdi.lhr_PDI();
            //CCN
            lhr_CCN lhr_ccn = new lhr_CCN();
            lhr_ccn.M_CCN(spv2.getVccn(), t);

            //DGS
            lhr_DGS lhr_dgs = new lhr_DGS();
            lhr_dgs.M_DGS(spv2.getVdgs(), t);
            //DTO
//   lhr_DTO lhr_dto = new lhr_DTO();
//   lhr_dto.M_DTO(spv2.getVdto(),t);
            //FMH
            lhr_FMH lhr_fmh = new lhr_FMH();
            lhr_fmh.M_FMH(spv2.getVfmh(), t);
            //LIR
            lhr_LIR lhr_lir = new lhr_LIR();
            lhr_lir.M_LIR(spv2.getVlir(), t);
            //MEC
            lhr_MEC lhr_mec = new lhr_MEC();
            lhr_mec.M_MEC(spv2.getVmec(), spv2.getVdgs(), spv2.getVccn(), t);
            //PMH
            lhr_PMH lhr_pmh = new lhr_PMH();
            lhr_pmh.M_PMH(spv2.getVpmh(), t);
            //ROS
//   lhr_ROS lhr_ros = new lhr_ROS();
//   lhr_ros.M_ROS();
            //VTS
            lhr_VTS lhr_vts = new lhr_VTS();
            lhr_vts.M_VTS(spv2.getVvts(), t);
            //HPI
            lhr_HPI lhr_hpi = new lhr_HPI();
            lhr_hpi.M_HPI(spv2.getVhpi(), t);
            //ALG
            lhr_ALG lhr_alg = new lhr_ALG();
            lhr_alg.M_ALG(spv2.getValg(), t);

            //SOH
            lhr_SOH lhr_soh = new lhr_SOH();
            lhr_soh.M_SOH(spv2.getVsoh(), t);
            //BLD
            lhr_BLD lhr_bld = new lhr_BLD();
            lhr_bld.M_BLD(spv2.getVbld(), t);
            //IMU
            lhr_IMU lhr_imu = new lhr_IMU();
            lhr_imu.M_IMU(spv2.getVimu(), t);
            //DAS
            lhr_DAB lhr_dab = new lhr_DAB();
            lhr_dab.M_DAB(spv2.getVdab(), t);

            //PNT
            lhr_PNT lhr_pnt = new lhr_PNT();
            lhr_pnt.M_PNT(spv2.getVpnt(), t);

            //DDR
            lhr_DDR lhr_ddr = new lhr_DDR();
            lhr_ddr.M_DDR(spv2.getVddr(), t);

            //RRS
            lhr_RRS lhr_rrs = new lhr_RRS();
            lhr_rrs.M_RRS(spv2.getVrrs(), t);

            //SPR
            lhr_SPR lhr_spr = new lhr_SPR();
            lhr_spr.M_SPR(spv2.getVspr(), t);
            
            //DCG
            lhr_DCG lhr_dcg = new lhr_DCG();
            lhr_dcg.M_DCG(spv2.getVdcg(),t);

            update_ehr_central u = new update_ehr_central();
            u.update_status(t.getCentral_Code());
        } else {
            System.out.println("No data");
        }
        return true;
    }

}
