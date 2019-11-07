

#X4训练
#python main.py --model EDSR --scale 4 --n_resblocks 32 --n_feats 256 --res_scale 0.1 --batch_size 60 --save edsrtencent_x4 --dir_data ../datasets/ --reset --ext sep_reset

#测试
#python main.py --model EDSR --scale 4 --n_resblocks 32 --n_feats 256 --res_scale 0.1 --test_only --save_results --save edsrtencent_x4 --data_test Demo --pre_train ../experiment/edsrtencent_x4/model/model_best.pt --dir_demo ../datasets/Tencent/test/ --chop

