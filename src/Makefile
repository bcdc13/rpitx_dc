all: ../sendiq

CXXFLAGS ?= -std=c++11 -Wall -g -O2 -Wno-unused-variable
LDFLAGS ?= -L/opt/vc/lib
LDFLAGS += -lrpitx -lm -lrt -lpthread
CXX ?= c++

../sendiq : sendiq.cpp 
	$(CXX) $(CXXFLAGS) -o ../sendiq sendiq.cpp  $(LDFLAGS)

clean:
	rm -f  ../sendiq
	
install: all
	install -m 0755 ../sendiq /usr/bin
