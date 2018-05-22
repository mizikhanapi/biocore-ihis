/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package GNLHelper;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 *
 * @author Shammugam
 */
public class SeqNoGenerator {

    private String module;
    private String format;

    /*
      Constructor for normal email
     */
    public SeqNoGenerator(String module) {

        this.module = module;

    }

    public String getSeqNo() {

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatOrderTime = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
        String orderDate = formatOrderTime.format(now);
        return module + orderDate;

    }

}
