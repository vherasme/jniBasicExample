# Define a variable for classpath
CLASS_PATH = ./bin

# Debug: -g3=compile with extra debugg infos. -ggdbg3=include things like macro defenitions. -O0=turn off optimizations.
DEBUGFLAGS = -g3 -ggdb3 -O0
CFLAGS = $(DEBUGFLAGS)

# Define a virtual path for .class in the bin directory
vpath %.class $(CLASS_PATH)

all : HelloJNI.class HelloJNI.h HelloJNI.o libhello.so
	@echo "Compiled Successfully. To run type: make run"

HelloJNI.class : src/HelloJNI.java
	javac -d ./bin/ src/HelloJNI.java

# $* matches the target filename without the extension
# manually this would be: javah -classpath ../bin HelloJNI
HelloJNI.h : bin/HelloJNI.class
	javah -d ./jni/ -classpath $(CLASS_PATH) $* 

# $@ matches the target, $< matches the first dependancy
HelloJNI.o : jni/HelloJNI.c jni/HelloJNI.h
	gcc $(CFLAGS) -fPIC -I/usr/lib/jvm/java/include -I/usr/lib/jvm/java/include/linux -c $< -o jni/$@

# $@ matches the target, $< matches the first dependancy
libhello.so : jni/HelloJNI.o
	gcc $(CFLAGS) -W -shared -o bin/$@ $<

run :
	export LD_LIBRARY_PATH=$(shell pwd)/bin && java -cp ./bin/ HelloJNI

clean :
	rm -f ./jni/HelloJNI.h ./jni/HelloJNI.o ./bin/libhello.so ./bin/HelloJNI.class
