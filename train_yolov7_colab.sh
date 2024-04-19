pip install -r requirements.txt
pip install cython; pip3 install -q 'git+https://github.com/cocodataset/cocoapi.git#subdirectory=PythonAPI'
pip install yacs
# Cython-bbox
pip install cython_bbox

# faiss cpu / gpu
# !pip install -q faiss-cpu
pip install faiss-gpu

# Download the AI_CUP dataset
gdown 1zfiIB7r_pbFgLzXlkdhmW7LrWqFDDlZy
unzip /content/AICUP_Baseline_BoT-SORT/32_33_train_v2.zip

# prepare YOLO dataset
python yolov7/tools/AICUP_to_YOLOv7.py --AICUP_dir /content/AICUP_Baseline_BoT-SORT/train --YOLOv7_dir datasets/AI_CUP_MCMOT_dataset/yolo

# Fine-tune YOLOv7 for AICUP

# finetune p5 models
!python yolov7/train.py --device 0 --batch-size 4 --epochs 50 --data yolov7/data/AICUP.yaml --img 1280 1280 --cfg $1 --weights $2 --name yolov7-AICUP --hyp $3