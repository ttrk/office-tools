#!/bin/bash

baseDir=$baseOfficeTools
if [ -z $baseDir ]; then
  echo "It looks that env var are not setup. Please set them up, ie. run the following :"
  echo "cd ../.."
  echo "source ./setupEnv.sh"
  exit 1
fi

output="ex1/output.fodp"

presenter="MyFirstN MyLastN"

# one title per page
titles=(
"QG fraction and Spectra"
"X_{jg} and eta"
);

# one LHS plot per page
plotsLHS=(
"ex1/plot1_gammajet_qgFraction.png"
"ex1/plot3_xjg_parton.png"
);

textsLHS=(
"Quark/gluon fraction in Pythia photon+jet"
"xjg distribution using parton-level jets"
);

# one RHS plot per page
plotsRHS=(
"ex1/plot2_jetphox.png"
"ex1/plot4_eta_jetphox.png"
);

textsRHS=(
"Photon p_{T} spectrum from jetphox"
"Photon \eta spectrum from jetphox"
);

set -x

rm -rf $output
cat $baseDir"/"$baseOpenDoc >> $output
cat $baseDir"/"$baseSettings >> $output
cat $baseDir"/"$baseStyles >> $output
cat $baseDir"/"$baseOpenBody >> $output

sed -i "s;NAME_LASTNAME;${presenter};g" $output

arrayIndices=${!titles[*]}
for i1 in $arrayIndices
do
  pageTmp="pageTmp.fodp"
  cp $baseDir"/"$basePage1x2 $pageTmp

  title=${titles[i1]}
  plot1=$(basename ${plotsLHS[i1]})
  text1=${textsLHS[i1]}
  plot2=$(basename ${plotsRHS[i1]})
  text2=${textsRHS[i1]}

  sed -i "s;TITLE;${title};g" $pageTmp
  sed -i "s;PATHTOPICTURE_L;${plot1};g" $pageTmp
  sed -i "s;TEXTAREA_L;${text1};g" $pageTmp
  sed -i "s;PATHTOPICTURE_R;${plot2};g" $pageTmp
  sed -i "s;TEXTAREA_R;${text2};g" $pageTmp

  cat $pageTmp >> $output
  rm -rf $pageTmp

done

cat $baseDir"/"$baseCloseBody >> $output
cat $baseDir"/"$baseCloseDoc >> $output

## export pdf
unoconv -f pdf $output

