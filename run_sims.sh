#!/usr/bin/env bash
# run a batch of simulations

function error {
    echo "something went wrong..."
    exit 1
}

function run_sim {
    ./setup.sh $1 $2 $3 $4 || error
    sleep 2
}

# this should be enough data to draw some conclusions from

PLOT_DIR="simulations/plots/A"

for req in 100 1000; do
    for con in 10 50 100; do
        run_sim 4 $req $con "$PLOT_DIR"
        run_sim 8 $req $con "$PLOT_DIR"
    done
done
