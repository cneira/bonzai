all:libsys 

libsys: sound_detect.o 
	clang -shared -o libsys.so sound_detect.o -lutil

sound_detect.o: sound_detect.c 
	clang -fPIC -c sound_detect.c 

clean:
	rm -rf *.o libsys.so

