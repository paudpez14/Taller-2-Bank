import java.io.File;
import java.util.Calendar;


public aspect Logger {
	File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    //
    pointcut doneTransaction() : call(* moneyMakeTransaction() );
    after() : doneTransaction() {
    	System.out.println("Se hizo la transaccion");
    	System.out.println(cal.getTime());
    }
}