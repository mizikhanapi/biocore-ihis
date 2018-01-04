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
package Bean;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author shay
 */
public class ERRCOUNT {
    public static int counterError = 0;
    public static String errMsg = "";

    public static String getErrMsg() {
        return errMsg;
    }

    public static void setErrMsg(String errMsg) {
        ERRCOUNT.errMsg = errMsg;
    }

    public static int getCounterError() {
        return counterError;
    }

    public static void setCounterError(int counterError) {
        ERRCOUNT.counterError = counterError;
    }
    
    public static int plusOne(){
        counterError += 1;
        return counterError;
    }
    
    public static String msgErr(String msj){
        errMsg += msj;
        return errMsg;
    }
    public static void setLog() throws FileNotFoundException, IOException{
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        Date date = new Date();
        File tmpDir = new File(dateFormat.format(date)+".txt");
        boolean b = false;
        if(!tmpDir.exists()){
            tmpDir.createNewFile();
        }
        PrintStream o = new PrintStream(new FileOutputStream(tmpDir, true));
        System.setOut(o);
          
    }
    
}
