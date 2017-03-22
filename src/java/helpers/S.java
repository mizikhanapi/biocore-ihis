package helpers;


public class S
{
//        public static void rep(String h) {
//            String t = Menu.report.getText();
//            Menu.report.setText(h+t);
//        }
    
        public static void cons(String h) {
            //Console.txt_console.setText(h+Console.txt_console.getText());
        }

	public static void oln()
	{
		System.out.println();
                //rep("\n");
                //Menu.report.append("\n");
                cons("\n");
	}
	public static void oln(String a)
	{
		System.out.println(a);
                //rep(a+"\n");
                //Menu.report.append(a+"\n");
                cons(a+"\n");
	}
	public static void oln(double a)
	{
		System.out.println(a);
                //rep(a+"\n");
                //Menu.report.append(a+"\n");
                cons(a+"\n");
	}
	public static void o(String a)
	{
		System.out.print(a);
                //rep(a);
                //Menu.report.append(a);
                cons(a);
	}
	public static void o(double a)
	{
		System.out.print(a);
                //rep(a+"");
                //Menu.report.append(a+"");
                cons(a+"");
	}
}
