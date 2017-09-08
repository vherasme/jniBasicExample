# About
This is a minimal skeleton to compile/run jni code.

# Compiling and running
To compile and run:

	make all
	make run

# Notes
Folder structure:  
/bin is the binary folder for compiled units  
/jni holds the native glue code  
/src holds the java source code  
This folder structure was chosen to make it easier to integrate this into Eclipse.

The java file is compiled into /bin.  
The '.h' header is put into jni, where the '.o' is also generated.
The library is put into /bin.

# See also
A more elaborate set of snippets, including a project that can easily be imported into eclipse can be found here: https://github.com/LeoUfimtsev/jniSnippets
