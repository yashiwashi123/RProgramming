{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf200
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;\red249\green249\blue249;}
{\*\expandedcolortbl;;\cssrgb\c20000\c20000\c20000;\cssrgb\c98039\c98039\c98039;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 #R Assignment 1#\
\
\pard\pardeftab720\sl480\sa240\partightenfactor0

\f1\fs32 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 Part 1\
\pard\pardeftab720\sl400\sa400\partightenfactor0

\fs28 \cf2 Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA. A prototype of the function is as follows\
\
\pard\pardeftab720\sl480\sa240\partightenfactor0

\fs32 \cf2 Part 2\
\pard\pardeftab720\sl400\sa400\partightenfactor0

\fs28 \cf2 Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows\
This function is called \'93complete\'94\
\pard\pardeftab720\sl480\sa240\partightenfactor0

\fs32 \cf2 Part 3\
\pard\pardeftab720\sl400\sa400\partightenfactor0

\fs28 \cf2 Write a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. A prototype of this function follows\
This function is called \'93corr\'94}