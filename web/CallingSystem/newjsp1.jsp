
<%
     Thread.sleep(2500);
    String myString1 = request.getParameter("idResult");
    //String myString1 = "34546556";
%>

<%
    String[] myStrArr = myString1.split(""); 
    int val=0;
out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/Nombor.mp3'></audio>");
for( int j=0 ; j<myStrArr.length ; j++){
    if(j==0)
    {
        val = 800*1;   
    }
    else if(j==1)
    {
        val = 800*2;   
    }
    else if(j==2)
    {
        val = 800*3;
    }
    else if(j==3)
    {
        val = 800*4;
    } 
    else if(j==4)
    {
        val = 800*5;
    } 
    else if(j==5)
    {
        val = 800*6;
    } 
    else if(j==6)
    {
        val = 800*7;
    } 
    else if(j==7)
    {
        val = 800*8;
    } 
    else if(j==8)
    {
        val = 800*9;
    } 
    
        if(myStrArr[j].equals("1"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/translate_tts.MP3'></audio>");
        }
        if(myStrArr[j].equals("2"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/translate_tts_2.mp3'></audio>");
        }
        if(myStrArr[j].equals("3"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/3.mp3'></audio>");
        }
        if(myStrArr[j].equals("4"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/4.mp3'></audio>");
        }
        if(myStrArr[j].equals("5"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/5.mp3'></audio>");
        }
        if(myStrArr[j].equals("6"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/6.mp3'></audio>");
        }
        if(myStrArr[j].equals("7"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/7.mp3'></audio>");
        }
        if(myStrArr[j].equals("8"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/8.mp3'></audio>");
        }
        if(myStrArr[j].equals("9"))
        {
            out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/9.mp3.MP3'></audio>");
        }
}
val = val+800;
out.println("<audio onloadeddata='var audioPlayer = this; setTimeout(function() { audioPlayer.play(); }, "+val+")'><source src='sound/GiliranBiasa.MP3'></audio>");
%> 
</body>
</html>