#!/bin/bash
zip_file="./32_33_train_v2.zip"

pip install -qr requirements.txt
pip install -q cython; pip3 install -q 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'
# Cython-bbox
pip -q install cython_bbox

# faiss cpu / gpu
# !pip install -q faiss-cpu
pip install -q faiss-gpu

# Download the AI_CUP dataset
if [ ! -f "$zip_file" ]; then
  gdown 1zfiIB7r_pbFgLzXlkdhmW7LrWqFDDlZy
fi
unzip -n ./32_33_train_v2.zip

# prepare YOLO dataset
python yolov7/tools/AICUP_to_YOLOv7.py --AICUP_dir train --YOLOv7_dir datasets/AI_CUP_MCMOT_dataset/yolo