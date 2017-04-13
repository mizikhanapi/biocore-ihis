/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import com.lowagie.text.Chunk;
import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.Properties;
 
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author MH0411
 */
public class EmailSender {
    
    private String recipient = "";
    private String subject = "";
    private String message = "";
    private String fileName = "";
    private ByteArrayOutputStream baos = null;
    
    /**
     * Constructor for normal email
     * @param email
     * @param subject
     * @param message 
     */
    public EmailSender(String email, String subject, String message){
        this.recipient = email;
        this.subject = subject;
        this.message = message;
    }
    
    /**
     * Constructor for email with attachment PDF
     * baos = ByteArrayOutputStream of PDF
     * @param email
     * @param subject
     * @param message
     * @param fileName 
     * @param baos 
     */
    public EmailSender(String email, String subject, String message,
            String fileName, ByteArrayOutputStream baos){
        this.recipient = email;
        this.subject = subject;
        this.message = message;
        this.fileName = fileName;
        this.baos = baos;
    }
            
    /**
     * Sends an email with a PDF attachment.
     */
    public void email() {
        String smtpHost = "smtp01.utem.edu.my"; //replace this with a valid host
        String sender = "biocore@utem.edu.my"; //replace this with a valid sender email address

        Properties properties = new Properties();
        properties.setProperty("mail.smtp.host", smtpHost);
        properties.setProperty("mail.user", "biocore@utem.edu.my");
        properties.setProperty("mail.password", "Bano5782"); 
        Session session = Session.getDefaultInstance(properties, null);
       
        try {           
            //construct the text body part
            MimeBodyPart textBodyPart = new MimeBodyPart();
            textBodyPart.setText(message);
            
            //create the sender/recipient addresses
            InternetAddress iaSender = new InternetAddress(sender);
            InternetAddress iaRecipient = new InternetAddress(recipient);

            //construct the mime message
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setSender(iaSender);
            mimeMessage.setSubject(subject);
            mimeMessage.setRecipient(Message.RecipientType.TO, iaRecipient);
            
            //PDF Attachment
            if (baos != null){
                //now write the PDF content to the output stream
                byte[] bytes = baos.toByteArray();

                //construct the pdf body part
                DataSource dataSource = new ByteArrayDataSource(bytes, "application/pdf");
                MimeBodyPart pdfBodyPart = new MimeBodyPart();
                pdfBodyPart.setDataHandler(new DataHandler(dataSource));
                pdfBodyPart.setFileName(fileName + ".pdf");

                //construct the mime multi part
                MimeMultipart mimeMultipart = new MimeMultipart();
                mimeMultipart.addBodyPart(textBodyPart);
                mimeMultipart.addBodyPart(pdfBodyPart);
                
                mimeMessage.setContent(mimeMultipart);
            }
            
            //send off the email
            Transport.send(mimeMessage);
             
            System.out.println("sent from " + sender + 
                    ", to " + recipient + 
                    "; server = " + smtpHost);         
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            //clean off
            if(null != baos) {
                try { baos.close(); baos = null; }
                catch(Exception ex) { }
            }
        }
    }
     
//    /**
//     * Writes the content of a PDF file (using iText API)
//     * to the {@link OutputStream}.
//     * @param outputStream {@link OutputStream}.
//     * @throws Exception
//     */
//    public void writePdf(OutputStream outputStream) throws Exception {
//        Document document = new Document();
//        PdfWriter.getInstance(document, outputStream);
//         
//        document.open();
//         
//        document.addTitle("Test PDF");
//        document.addSubject("Testing email PDF");
//        document.addKeywords("iText, email");
//        document.addAuthor("Jee Vang");
//        document.addCreator("Jee Vang");
//         
//        Paragraph paragraph = new Paragraph();
//        paragraph.add(new Chunk("hello!"));
//        document.add(paragraph);
//         
//        document.close();
//    }
//     
//    /**
//     * Main method.
//     * @param args No args required.
//     */
//    public static void main(String[] args) {
//        EmailWithPdf demo = new EmailWithPdf();
//        demo.email();
//    }
}