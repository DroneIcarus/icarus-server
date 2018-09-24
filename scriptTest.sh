#!/bin/bash

initialPlan=$1
optimizedPlan=$2

cd ../Icarus-MissionOptimizer

pipenv run python main.py $initialPlan $optimizedPlan
