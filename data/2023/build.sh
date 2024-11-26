# BUild the output data files. 
cd SDDT_102923
dt_process -vv -i intersection.csv -c count output
dt_process -vv -i intersection.csv -g gcp output
dt_process --final output
