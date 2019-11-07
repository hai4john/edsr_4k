



#X3训练
#python main.py --model EDSR --scale 3 --save edsrtencent_x3 --n_resblocks 32 --n_feats 256  --res_scale 0.1 --reset  --dir_data ../../datasets/ --batch_size 30 --ext sep_reset


#跳过编码 训练
#python main.py --model EDSR --scale 3 --save edsrtencent_x3 --n_resblocks 32 --n_feats 256  --res_scale 0.1 --reset  --dir_data ../../datasets/ --batch_size 30 --ext sep

#跳过编码 在x2预训练基础上
python main.py --model EDSR --scale 3 --save edsrtencent_x3 --n_resblocks 32 --n_feats 256  --res_scale 0.1 --reset  --dir_data ../../datasets/ --batch_size 30 --ext sep --pre_train /userhome/aicomp/EDSR/experiment/edsrtencent_x2/model/model_best.pt