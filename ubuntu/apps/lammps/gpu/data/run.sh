#!/bin/bash

cd /docker/run

if [ "$INPUT" == "in.lj" ]; then
	mpirun -n 2 --bind-to socket --map-by socket --mca pml ^ucx -x UCX_TLS=sm lmp -k on g 2 -sf kk -pk kokkos neigh full neigh/qeq half newton off neigh/thread off -var x 8 -var y 8 -var z 6 -in in.lj
else
	mpirun -n 2 --bind-to socket --map-by socket --mca pml ^ucx -x UCX_TLS=sm lmp -k on g 2 -sf kk -pk kokkos neigh half neigh/qeq full newton on neigh/thread off -var x 8 -var y 8 -var z 6 -in in.reaxc.hns
fi

