#!/bin/bash

python clear_courses.py > fristrations_output/clear_output
python load_courses.py > fristrations_output/load_output
date > fristrations_output/progress_report