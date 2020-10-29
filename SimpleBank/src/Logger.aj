import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;


public aspect Logger {
    Calendar cal = Calendar.getInstance();
    // el nombre del pointcut debe coincidir por ejemplo
    /*
     * pointcut name() : gfdxfhgh;
     * after(): name()	
     */

  
    pointcut done() : execution(* moneyWithdrawal() ) || execution(* moneyMakeTransaction());
    after() : done() {
    	String str = "";
    	if(thisJoinPointStaticPart.getSignature().getName().equalsIgnoreCase("moneyMakeTransaction")) {
    		str += "Se hizo la transaccion";
    	} else {
    		str += "Se hizo el retiro";
    	}
        System.out.println(str);
        System.out.println(cal.getTime());
        try(FileWriter fw = new FileWriter("log.txt", true);
                BufferedWriter bw = new BufferedWriter(fw);
                PrintWriter out = new PrintWriter(bw))
                {
                    fw.write(str+cal.getTime());
                    fw.write("\n");
                    fw.close();
            } catch (IOException e) {
            }
}
    }
