#Kokkos root path
KOKKOS_PATH = __KOKKOS_PATH__

#Backend and architecture configuration
KOKKOS_DEVICES=OpenMP
KOKKOS_ARCH = ""

#MPI On or off (1/0)
MPI = 1

MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
EXAMINIMD_PATH = $(subst Makefile,,$(MAKEFILE_PATH))/..

default: build
	echo "Start Build"


EXE = ExaMiniMD
CXXFLAGS = __FLAGS__
LINKFLAGS = __LD_FLAGS__

ifeq ($(MPI), 1)
  CXX = mpicxx
  CXXFLAGS += -DEXAMINIMD_ENABLE_MPI
else
  ifneq (,$(findstring Cuda,$(KOKKOS_DEVICES)))
    CXX = $(KOKKOS_PATH)/bin/nvcc_wrapper
  else
    CXX = g++
  endif
endif

LINK = ${CXX}

KOKKOS_OPTIONS=aggressive_vectorization

DEPFLAGS = -M

vpath %.cpp $(EXAMINIMD_PATH)/src
SRC =  $(wildcard $(EXAMINIMD_PATH)/src/*.cpp) 
HEADERS = $(wildcard $(EXAMINIMD_PATH)/src/*.h) 
CXXFLAGS += -I$(EXAMINIMD_PATH)/src

vpath %.cpp $(EXAMINIMD_PATH)/src/force_types
SRC += $(wildcard $(EXAMINIMD_PATH)/src/force_types/*.cpp)
HEADERS += $(wildcard $(EXAMINIMD_PATH)/src/force_types/*.h)
CXXFLAGS += -I$(EXAMINIMD_PATH)/src/force_types

vpath %.cpp $(EXAMINIMD_PATH)/src/comm_types
SRC += $(wildcard $(EXAMINIMD_PATH)/src/comm_types/*.cpp)
HEADERS += $(wildcard $(EXAMINIMD_PATH)/src/comm_types/*.h)
CXXFLAGS += -I$(EXAMINIMD_PATH)/src/comm_types

vpath %.cpp $(EXAMINIMD_PATH)/src/neighbor_types
SRC += $(wildcard $(EXAMINIMD_PATH)/src/neighbor_types/*.cpp)
HEADERS += $(wildcard $(EXAMINIMD_PATH)/src/neighbor_types/*.h)
CXXFLAGS += -I$(EXAMINIMD_PATH)/src/neighbor_types

vpath %.cpp $(EXAMINIMD_PATH)/src/binning_types
SRC += $(wildcard $(EXAMINIMD_PATH)/src/binning_types/*.cpp)
HEADERS += $(wildcard $(EXAMINIMD_PATH)/src/binning_types/*.h)
CXXFLAGS += -I$(EXAMINIMD_PATH)/src/binning_types

SRC_NOTDIR = $(notdir $(SRC))
OBJ = $(SRC_NOTDIR:.cpp=.o)
LIB =

include $(KOKKOS_PATH)/Makefile.kokkos

build: $(EXE)

$(EXE): $(OBJ) $(KOKKOS_LINK_DEPENDS)
	$(LINK) $(KOKKOS_LDFLAGS) $(LINKFLAGS) $(EXTRA_PATH) $(OBJ) $(KOKKOS_LIBS) $(LIB) -o $(EXE)

clean: kokkos-clean 
	rm -f *.o $(EXE)

# Compilation rules

%.o:%.cpp $(KOKKOS_CPP_DEPENDS) ${HEADERS}
	$(CXX) $(KOKKOS_CPPFLAGS) $(KOKKOS_CXXFLAGS) $(CXXFLAGS) $(EXTRA_INC) -c $<

