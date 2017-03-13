
package Formatter;
import java.util.Vector;
import org.apache.commons.lang3.*;
/**
 *
 * @author shay
 * 
 * this class is to add one single quote every after a single in a string,because in search,when the data only has one single quote,data not retrieved
 */
public class quoteFomatter {
    private String newText;
    public String quote(String text) {

        if (text.contains("'")) {
           
            newText = text.replace("'", "\''");
        }else{
            newText = text;
        }

        return newText;
    }
}
