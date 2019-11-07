

#X2
#python main.py --model EDSR --scale 2 --save edsrtencent_x2 --n_resblocks 32 --n_feats 256  --res_scale 0.1 --reset  --dir_data ../../datasets/ --batch_size 30 --ext sep_reset

#跳过编码 训练
python main.py --model EDSR --scale 2 --save edsrtencent_x2 --n_resblocks 32 --n_feats 256  --res_scale 0.1 --reset  --dir_data ../../datasets/ --batch_size 30 --ext sep

