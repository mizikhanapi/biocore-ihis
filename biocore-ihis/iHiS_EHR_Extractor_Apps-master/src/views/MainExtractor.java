/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package views;


import lhr_tables.lhr_ALG;
import lhr_tables.lhr_BLD;
import lhr_tables.lhr_CCN;
import lhr_tables.lhr_DAB;
import lhr_tables.lhr_DGS;
import lhr_tables.lhr_DTO;
import lhr_tables.lhr_FMH;
import lhr_tables.lhr_HPI;
import lhr_tables.lhr_IMU;
import lhr_tables.lhr_LIR;
import lhr_tables.lhr_MEC;
import lhr_tables.lhr_PMH;
import lhr_tables.lhr_PNT;
import lhr_tables.lhr_ROS;
import lhr_tables.lhr_SOH;
import lhr_tables.lhr_VTS;
import lhr_tables.update_ehr_central;
/**
 *
 * @author umarmukhtar
 */
public class MainExtractor {
    
   public boolean extract(){
   
   //CCN
   lhr_CCN lhr_ccn = new lhr_CCN();
   lhr_ccn.M_CCN();
   
   //DGS
   lhr_DGS lhr_dgs = new lhr_DGS();
   lhr_dgs.M_DGS();
   
   //DTO
   lhr_DTO lhr_dto = new lhr_DTO();
   lhr_dto.M_DTO();
   
   //FMH
   lhr_FMH lhr_fmh = new lhr_FMH();
   lhr_fmh.M_FMH();
   
   //LIR
   lhr_LIR lhr_lir = new lhr_LIR();
   lhr_lir.M_LIR();
   
   //MEC
   lhr_MEC lhr_mec = new lhr_MEC();
   lhr_mec.M_MEC();
   
   //PMH
   lhr_PMH lhr_pmh = new lhr_PMH();
   lhr_pmh.M_PMH();
   
   //ROS
   lhr_ROS lhr_ros = new lhr_ROS();
   lhr_ros.M_ROS();
   
   //VTS
   lhr_VTS lhr_vts = new lhr_VTS();
   lhr_vts.M_VTS();
   
   //HPI
   lhr_HPI lhr_hpi = new lhr_HPI();
   lhr_hpi.M_HPI();
   
   //ALG
   lhr_ALG lhr_alg = new lhr_ALG();
   lhr_alg.M_ALG();
   
   //SOH
   lhr_SOH lhr_soh = new lhr_SOH();
   lhr_soh.M_SOH();
   
   //BLD
   lhr_BLD lhr_bld = new lhr_BLD();
   lhr_bld.M_BLD();
   
   //IMU
   lhr_IMU lhr_imu = new lhr_IMU();
   lhr_imu.M_IMU();
   
   //DAS
   lhr_DAB lhr_dab = new lhr_DAB();
   lhr_dab.M_DAB();
   
   //PNT
   lhr_PNT lhr_pnt = new lhr_PNT();
   lhr_pnt.M_PNT();
   
   return true;
   }
   
}
