#!/bin/bash

#RUN=327327
#RUN=327430
#RUN=327174
#RUN=327402
RUN=327495

triggers=(
# path name, ID
"L1_ZeroBias,107"
"L1_MinimumBiasHF1_AND_BptxAND,154"
"L1_MinimumBiasHF1_OR_BptxAND,155"
"L1_MinimumBiasHF2_AND_BptxAND,164"
"L1_MinimumBiasHF2_OR_BptxAND,164"
"L1_SingleEG7_BptxAND,346"
"L1_SingleEG21_BptxAND,349"
"L1_SingleEG30_BptxAND,350"
"HLT_HIGEDPhoton40_v1,2134253"             # menu v1.5 : 2133564
"HLT_HIGEDPhoton40_EB_v1,2134259"          # menu v1.5 : 2133570
"HLT_HIIslandPhoton40_Eta2p4_v1,2134244"   # menu v1.5 : 2133555
"HLT_HIIslandPhoton40_Eta1p5_v1,2134245"   # menu v1.5 : 2133556
"HLT_HIGEDPhoton30_v1,2134252"             # menu v1.5 : 2133563
"HLT_HIGEDPhoton30_EB_v1,2134258"          # menu v1.5 : 2133569
"HLT_HIIslandPhoton30_Eta2p4_v1,2134242"   # menu v1.5 : 2133553
"HLT_HIIslandPhoton30_Eta1p5_v1,2134243"   # menu v1.5 : 2133554
#"HLT_HIGEDPhoton10_v1,2134640"              # menu v1.5 : 2133893
#"HLT_HIGEDPhoton10_EB_v1,2134256"           # menu v1.5 : 2133567
#"HLT_HIIslandPhoton10_Eta2p4_v1,2134639"    # menu v1.5 : 2133892
#"HLT_HIIslandPhoton10_Eta1p5_v1,2134239"    # menu v1.5 : 2133550
#"HLT_HIGEDPhoton20_v1,2134251"              # menu v1.5 : 2133562
#"HLT_HIGEDPhoton20_EB_v1,2134257"           # menu v1.5 : 2133568
#"HLT_HIIslandPhoton20_Eta2p4_v1,2134240"    # menu v1.5 : 2133551
#"HLT_HIIslandPhoton20_Eta1p5_v1,2134241"    # menu v1.5 : 2133552
);

linkL1Temp="https://cmswbm.cern.ch/cmsdb/servlet/ChartL1TriggerRates?fromTime=&toTime=&fromLSNumber=&toLSNumber=&minRate=&maxRate=&minCount=&maxCount=&beforePrescale=1&rates=1&postDeadRatesHLT=1&drawCounts=0&drawLumisec=1&runID=YOURRUN&bitID=YOURPATHID&type=0&TRIGGER_NAME=YOURPATHNAME&LSLength=23.31040958"

linkHLTTemp="https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=YOURRUN&pathID=YOURPATHID&TRIGGER_PATH=YOURPATHNAME&LSLength=23.31040958"

arrayIndices=${!triggers[*]}
for i1 in $arrayIndices
do
  trigger=${triggers[i1]}
  pathName=$(cut -d',' -f1 <<< ${trigger})
  pathID=$(cut -d',' -f2 <<< ${trigger})

  webLink=""
  if [[ $pathName = L1_* ]]; then
     webLink=$linkL1Temp
  elif [[ $pathName = HLT_* ]]; then
     webLink=$linkHLTTemp
  fi

  webLink="${webLink/YOURRUN/${RUN}}"
  webLink="${webLink/YOURPATHID/${pathID}}"
  webLink="${webLink/YOURPATHNAME/${pathName}}"

  if [ ! -z $webLink ]; then
    firefox $webLink
    echo "firefox $webLink"
  fi

done

