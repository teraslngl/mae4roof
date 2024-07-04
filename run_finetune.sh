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

conda activate mae.train2

CUDA_VISIBLE_DEVICES=3 python main_finetune.py --accum_iter 4 --batch_size 32 --model vit_base_patch16 --finetune mae_pretrain_vit_base.pth --epochs 100 --blr 5e-4 --layer_decay 0.65  --weight_decay 0.05 --drop_path 0.1 --mixup 0.8 --cutmix 1.0 --reprob 0.25 --dist_eval --data_path /home/eras_tu/Documents/Dataset/UBCV2/fine-grained_building_roof_instance_segmentation/images/

#CUDA_VISIBLE_DEVICES=3 python main_finetune.py --accum_iter 4 --batch_size 32 --model vit_base_patch16 --finetune mae_pretrain_vit_base.pth --epochs 100 --blr 5e-4 --layer_decay 0.65  --weight_decay 0.05 --drop_path 0.1 --mixup 0.8 --cutmix 1.0 --reprob 0.25 --dist_eval --data_path /home/eras_tu/Documents/Dataset/UBCV2/fine-grained_building_roof_instance_segmentation/images/




