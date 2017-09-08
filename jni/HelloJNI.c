/*
 * HelloJNI.c
 *
 *  Created on: Oct 20, 2016
 *      Author: lufimtse
 *
 *      MANUALLY WRITTEN! See: http://www3.ntu.edu.sg/home/ehchua/programming/java/JavaNativeInterface.html
 */


#include "../jni/HelloJNI.h"

#include <jni.h>
#include <stdio.h>

JNIEXPORT void JNICALL Java_HelloJNI_sayHello(JNIEnv *env, jobject thisObj) {
   printf("c: Hello World!\n");
   return;
}
