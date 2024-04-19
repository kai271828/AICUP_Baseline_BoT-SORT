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

# prepare ReID dataset
python fast_reid/datasets/generate_AICUP_patches.py --data_path /content/AICUP_Baseline_BoT-SORT/train
export FASTREID_DATASETS=/content/AICUP_Baseline_BoT-SORT/fast_reid/datasets

# Train the ReID Module for AICUP
python3 fast_reid/tools/train_net.py --config-file $1 MODEL.DEVICE "cuda:0"