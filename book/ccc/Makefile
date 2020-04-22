SRCS = $(wildcard src/*.cpp)
BINS = $(SRCS:.cpp=.bin)

# Commands

.PHONY: all run clean

all: $(BINS)

run: all
	$(foreach bin,$(BINS),./$(bin);)

clean:
	rm src/*.bin

# Compiling Configurations

CXX = g++
CXXFLAGS = -std=c++17 -Wall

%.bin: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<
