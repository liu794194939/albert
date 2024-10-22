#!/bin/bash
#chkconfig: 2345 80 90
#description: 启动BERT分类模型 

echo 'start BERT mobile svr...'
cd /home/Sentence_Similarity/albert_zh/mobile_svr
rm -rf tmp*
source /root/miniconda3/bin/activate tf1
export BERT_BASE_DIR=/home/Sentence_Similarity/albert_zh/init_checkpoint
export TRAINED_CLASSIFIER=/home/Sentence_Similarity/albert_zh/output
#export EXP_NAME=

bert-base-serving-start \
    -model_dir $TRAINED_CLASSIFIER \
    -bert_model_dir $BERT_BASE_DIR \
    -model_pb_dir $TRAINED_CLASSIFIER \
    -mode CLASS \
    -max_seq_len 128 \
    -http_port 8091 \
    -port 5575 \
    -port_out 5576 \
    -device_map 1 
