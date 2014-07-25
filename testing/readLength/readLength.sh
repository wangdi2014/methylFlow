#!/usr/bin/bash

### run :  sh readLength.sh par
### par = 0 > simple
### par = 1 > moderate
### par = 2 > Hard


## input file
##>> chr >> startDNA >> dnaLength >> readLength >> HapNum >> freqFlag >> coverage >> error >> dataFlag >> corrDist ;

# dataFlag = 0  >>> read CpG sites from file
# dataFlag > 0 >>>> dataFlag equals the number of cpg sites
# dataFlag < 0 >>> read the data from rest of the file

# freqFlag = 0 >>> randomly choose the frequency of each pattern
# freqFlag = 1 >>> read the frequency of patterns from rest of the file(second line)

if [ "$1" == 2 ];
then


echo "Hard Setting"

cd /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/


########  evaluation for different read lengthes ########

echo -n "" > evalAvg.txt
echo -n "" > mcf.txt
echo -n "" > weight.txt
echo -n "" > match.txt

for i in $(seq 10 5 150)
do
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/eval.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/input.txt
echo 1 757121 230 $i 10 1 20 0 50 10 >> /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/input.txt
echo 10 10 10 10 10 10 10 10 10 10 >> /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/input.txt
#echo $i >> evalReadLength.txt
#echo -n "   " >> evalReadLength.txt




echo $i
for j in {1..100}
do

echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/shortRead.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/simPattern.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/patterns.tsv
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/weight.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/match.txt


#change directory to  /cbcb/project-scratch/fdorri/Code/methylFlow/testing/
cd /cbcb/project-scratch/fdorri/Code/methylFlow/testing/



echo "SimulateReadLength"
../build/simulator/mfSimulate /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/input.txt  /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard


echo "MethylFlowReadLength"
../build/methylFlow/methylFlow -i /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/shortRead.txt -o /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard/ -l 1 -chr 0


echo "EvaluateReadLength"
../build/evaluation/mfEvaluation /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard 757121 757353 $i

done

../build/avgEval/avgEvaluation /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/hard $i

#sed -e "s/$/$i/" eval.txt

done

elif [ "$1" == 1 ];
then


echo "Moderate Setting"

cd /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/

########  evaluation for different read lengthes ########

echo -n "" > evalAvg.txt
echo -n "" > mcf.txt
echo -n "" > weight.txt
echo -n "" > match.txt

for i in $(seq 10 5 150)
do
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/eval.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/input.txt
echo 1 757121 230 $i 4 1 20 0 50 10 >> /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/input.txt
echo 15 15 35 35 >> /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/input.txt
#echo $i >> evalReadLength.txt
#echo -n "   " >> evalReadLength.txt




echo $i
for j in {1..100}
do

echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/shortRead.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/simPattern.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/patterns.tsv
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/weight.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/match.txt


#change directory to  /cbcb/project-scratch/fdorri/Code/methylFlow/testing/
cd /cbcb/project-scratch/fdorri/Code/methylFlow/testing/



echo "SimulateReadLength"
../build/simulator/mfSimulate /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/input.txt /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate


echo "MethylFlowReadLength"
../build/methylFlow/methylFlow -i /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/shortRead.txt -o /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate/ -l 1 -chr 0


echo "EvaluateReadLength"
../build/evaluation/mfEvaluation /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate 757121 757353 $i

done

../build/avgEval/avgEvaluation /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/moderate $i

#sed -e "s/$/$i/" eval.txt

done

elif [ "$1" == 0 ];
then


echo "Simple Setting"

cd /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/

########  evaluation for different read lengthes ########

echo -n "" > evalAvg.txt
echo -n "" > mcf.txt
echo -n "" > weight.txt
echo -n "" > match.txt

for i in $(seq 10 5 150)
do
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/eval.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/input.txt
echo 1 757121 230 $i 2 1 20 0 50 10 >> /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/input.txt
echo 25 75 >> /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/input.txt
#echo $i >> evalReadLength.txt
#echo -n "   " >> evalReadLength.txt




echo $i
for j in {1..100}
do

echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/shortRead.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/simPattern.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/patterns.tsv
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/weight.txt
echo -n "" > /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/match.txt


#change directory to  /cbcb/project-scratch/fdorri/Code/methylFlow/testing/
cd /cbcb/project-scratch/fdorri/Code/methylFlow/testing/



echo "SimulateReadLength"
../build/simulator/mfSimulate  /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/input.txt /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple


echo "MethylFlowReadLength"
../build/methylFlow/methylFlow -i /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/shortRead.txt -o /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple/ -l 1 -chr 0


echo "EvaluateReadLength"
../build/evaluation/mfEvaluation /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple 757121 757353 $i

done

../build/avgEval/avgEvaluation /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple /cbcb/project-scratch/fdorri/Code/methylFlow/testing/readLength/simple $i

#sed -e "s/$/$i/" eval.txt

done

else
echo "Your input should be 0, 1 or 2"
exit 2
fi




