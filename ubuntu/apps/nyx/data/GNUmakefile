# AMREX_HOME defines the directory in which we will find all the AMReX code
AMREX_HOME ?= /tmp/amrex-19.08

CVODE_LIB_DIR ?= /usr/local/

# TOP defines the directory in which we will find Source, Exec, etc
TOP = ../..

# compilation options
COMP    = gnu
USE_MPI = TRUE
USE_OMP = TRUE

USE_SENSEI_INSITU = FALSE
USE_HENSON = FALSE

PROFILE       = FALSE
TRACE_PROFILE = FALSE
COMM_PROFILE  = FALSE
TINY_PROFILE  = FALSE

PRECISION = DOUBLE
USE_SINGLE_PRECISION_PARTICLES = TRUE
DEBUG     = FALSE

GIMLET = FALSE
REEBER = FALSE

# physics
DIM      = 3
USE_GRAV = TRUE
USE_HEATCOOL = TRUE
USE_AGN = FALSE
USE_CVODE = TRUE
USE_SUNDIALS_3x4x = TRUE
USE_ARKODE_LIBS = FALSE

Bpack := ./Make.package
Blocs := .

include $(TOP)/Exec/Make.Nyx

