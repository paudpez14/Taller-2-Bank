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
    pointcut doneTransaction() : call(* moneyMakeTransaction() );
    after() : doneTransaction() {
    	System.out.println("Se hizo la transaccion");
    	System.out.println(cal.getTime());
    	try(FileWriter fw = new FileWriter("log.txt", true);
    		    BufferedWriter bw = new BufferedWriter(fw);
    		    PrintWriter out = new PrintWriter(bw))
    		    {
    		        fw.write("Se hizo la transaccion"+cal.getTime());
    		        fw.write("\n");
    		        fw.close();
    		} catch (IOException e) {
    		}
    }
    
    pointcut withdrawal() : call(* moneyWithdrawal() );
    after() : withdrawal() {
    	System.out.println("Se hizo el retiro");
    	System.out.println(cal.getTime());
    	try(FileWriter fw = new FileWriter("log.txt", true);
    		    BufferedWriter bw = new BufferedWriter(fw);
    		    PrintWriter out = new PrintWriter(bw))
    		    {
    		        fw.write("Se hizo la transaccion"+cal.getTime());
    		        fw.write("\n");
    		        fw.close();
    		} catch (IOException e) {
    		}
    }
} 
