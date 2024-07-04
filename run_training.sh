# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/eras_tu/miniforge3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/eras_tu/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/eras_tu/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/eras_tu/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

unalias python

source switch-cuda.sh 11.3

conda activate mae.train1

CUDA_VISIBLE_DEVICES=3 python main_pretrain.py --batch_size 64 --mask_ratio 0.75 --epochs 700 --warmup_epochs 40 --blr 1.5e-4 --weight_decay 0.05 --data_path /home/eras_tu/Documents/Dataset/UBCV2/fine-grained_building_roof_instance_segmentation/images/


