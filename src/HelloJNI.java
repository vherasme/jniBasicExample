import java.lang.management.ManagementFactory;

public class HelloJNI {
   static {
      System.loadLibrary("hello"); // hello.dll (Windows) or libhello.so (Unixes)
   }
 
   // Declare native method
   private native void sayHello();
 
   // Test Driver
   public static void main(String[] args) {
	   String pid = getJvmPid();

	   System.out.println("Java: Hello world.\n"
	   		+ "    To debug 'C' part: Ctrl+3 -> 'Debug Attached Executable', select 'Java' with PID of: " + pid);
	   	// Alternativley, use 'jps' command to find PID of HelloJNI.java
	   
      new HelloJNI().sayHello();  // invoke the native method
   }

static String getJvmPid() {
	
	/*
	 * This method works on most platforms (including Linux). Although when Java 9 comes along, there is a better way:
	 * long pid = ProcessHandle.current().getPid();
	 * 
	 * See:
	 * http://stackoverflow.com/questions/35842/how-can-a-java-program-get-its-own-process-id
	 */
	String pidAndHost = ManagementFactory.getRuntimeMXBean().getName();
	return pidAndHost.substring(0, pidAndHost.indexOf('@'));
}
}