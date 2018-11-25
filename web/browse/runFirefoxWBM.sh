#!/bin/bash

RUN=327237

webLinks=(
"https://cmswbm.cern.ch/cmsdb/servlet/ChartL1TriggerRates?fromTime=&toTime=&fromLSNumber=&toLSNumber=&minRate=&maxRate=&minCount=&maxCount=&beforePrescale=1&rates=1&postDeadRatesHLT=1&drawCounts=0&drawLumisec=1&runID=${RUN}&bitID=154&type=0&TRIGGER_NAME=L1_MinimumBiasHF1_AND_BptxAND&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartL1TriggerRates?fromTime=&toTime=&fromLSNumber=&toLSNumber=&minRate=&maxRate=&minCount=&maxCount=&beforePrescale=1&rates=1&postDeadRatesHLT=1&drawCounts=0&drawLumisec=1&runID=${RUN}&bitID=164&type=0&TRIGGER_NAME=L1_MinimumBiasHF2_AND_BptxAND&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartL1TriggerRates?fromTime=&toTime=&fromLSNumber=&toLSNumber=&minRate=&maxRate=&minCount=&maxCount=&beforePrescale=1&rates=1&postDeadRatesHLT=1&drawCounts=0&drawLumisec=1&runID=${RUN}&bitID=346&type=0&TRIGGER_NAME=L1_SingleEG7_BptxAND&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartL1TriggerRates?fromTime=&toTime=&fromLSNumber=&toLSNumber=&minRate=&maxRate=&minCount=&maxCount=&beforePrescale=1&rates=1&postDeadRatesHLT=1&drawCounts=0&drawLumisec=1&runID=${RUN}&bitID=349&type=0&TRIGGER_NAME=L1_SingleEG21_BptxAND&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartL1TriggerRates?fromTime=&toTime=&fromLSNumber=&toLSNumber=&minRate=&maxRate=&minCount=&maxCount=&beforePrescale=1&rates=1&postDeadRatesHLT=1&drawCounts=0&drawLumisec=1&runID=${RUN}&bitID=350&type=0&TRIGGER_NAME=L1_SingleEG30_BptxAND&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=${RUN}&pathID=2133570&TRIGGER_PATH=HLT_HIGEDPhoton40_EB_v1&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=${RUN}&pathID=2133564&TRIGGER_PATH=HLT_HIGEDPhoton40_v1&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=${RUN}&pathID=2133556&TRIGGER_PATH=HLT_HIIslandPhoton40_Eta1p5_v1&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=${RUN}&pathID=2133555&TRIGGER_PATH=HLT_HIIslandPhoton40_Eta2p4_v1&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=${RUN}&pathID=2133569&TRIGGER_PATH=HLT_HIGEDPhoton30_EB_v1&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=${RUN}&pathID=2133563&TRIGGER_PATH=HLT_HIGEDPhoton30_v1&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=${RUN}&pathID=2133554&TRIGGER_PATH=HLT_HIIslandPhoton30_Eta1p5_v1&LSLength=23.31040958"
"https://cmswbm.cern.ch/cmsdb/servlet/ChartHLTTriggerRates?drawCounts=0&drawLumisec=1&runID=${RUN}&pathID=2133553&TRIGGER_PATH=HLT_HIIslandPhoton30_Eta2p4_v1&LSLength=23.31040958"
);

set -x

arrayIndices=${!webLinks[*]}
for i1 in $arrayIndices
do
    webLink=${webLinks[i1]}

    firefox $webLink
done


