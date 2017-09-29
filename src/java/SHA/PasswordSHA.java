/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SHA;

import java.security.MessageDigest;

/**
 *
 * @author -D-
 */

public class PasswordSHA {
    

    
    public String getHashPassword(String password){
        String hashedPassword = "";
        try{
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            byte byteData[] = md.digest();

            //convert the byte to hex format method 1
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
            }
            
            hashedPassword = sb.toString();
            
        }catch(Exception e){
            System.out.println(e);
        }

        return hashedPassword;
    }
    
}
