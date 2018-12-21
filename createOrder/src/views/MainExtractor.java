/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views;

import Bean.MSH;
import Bean.PDI;
import order_tables.*;
import order_tables.get_ehr_central_data;
import order_tables.update_ehr_central;
import separatorv2.SeparatorV2;

/**
 *
 * @author umarmukhtar
 */
public class MainExtractor {

    SeparatorV2 spv2 = new SeparatorV2();
    get_ehr_central_data t = new get_ehr_central_data();
    boolean query = t.getQuery();

    public boolean extract() {

        //System.out.println(query);
        System.out.println("central code: " + t.getCentral_Code());
//    System.out.println(query);
        if (query == true) {
            //System.out.println(t.getTxndata());

            spv2.startProcess(t.getTxndata());
            PDI_ord lhr_pde = new PDI_ord();
            PDI pdi = lhr_pde.lhr_PDI(spv2.getVpdi(), t);
            //MSH
            lhr_MSH lhr_msh = new lhr_MSH();
            MSH msh = lhr_msh.M_MSH(spv2.getVmsh(),t);
            
            //LIO
            LIO_ord lio_ord = new LIO_ord();
            lio_ord.M_LIO(spv2.getVorc(), spv2.getVlio(), t,spv2.getVpdi(),msh);

            //POS
            POS_ord pos_ord = new POS_ord();
            pos_ord.M_POS(t, spv2.getVpos(), spv2.getVorc(),msh);

            //ROS
            ROS_ord ros_ord = new ROS_ord();
            ros_ord.M_ROS(t, spv2.getVros(), spv2.getVorc(),spv2.getVpdi(),msh);

            //PIS
            PIS_ord pis_ord = new PIS_ord();
            pis_ord.M_PIS(spv2.getVorc(), spv2.getVdto(), t,msh);

            //BLI
            BLI_ord bli_ord = new BLI_ord();
            bli_ord.M_BLI(spv2.getVorc(), spv2.getVbli(), t,msh);

            //ADW
            ADW_ord adw_ord = new ADW_ord();
            adw_ord.M_ADW(spv2.getVorc(), spv2.getVadw(), t,msh);

            //DCG
            DCG_ord dcg_ord = new DCG_ord();
            dcg_ord.M_DCG(spv2.getVorc(), spv2.getVdcg(), t,msh);
            
            //PRI
            PRI_ord pri_ord = new PRI_ord();
            pri_ord.M_PRI(spv2.getVorc(), spv2.getVpri(), t,msh);
            
            //update ehr_central status_1
            update_ehr_central upd_sts = new update_ehr_central();
            upd_sts.update_status_1();
        } else {
            System.out.println("No data");
        }

        return true;
    }

}
