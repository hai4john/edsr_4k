# coding=utf-8
# 测试集自动化处理脚本，注意该脚本默认在src目录下运行。对应工作路径要注意

import os, subprocess, time

path_x4_video = '/raid/aicomp/edsr_4k/datasets/Tencent/SDR_540p'
path_x4_png = '/raid/aicomp/edsr_4k/datasets/Tencent/test'
path_x4_sr_png = '/raid/aicomp/edsr_4k/experiment/edsrtencent_x4/results-Demo'
path_x4_sr_video = '/raid/aicomp/edsr_4k/datasets/Tencent/SR_4K'

def del_file(path):
    ls = os.listdir(path)
    for i in ls:
        c_path = os.path.join(path, i)
        if os.path.isdir(c_path):
            del_file(c_path)
        else:
            os.remove(c_path)

for video in os.listdir(path_x4_video):
    # 准备工作，清理所有临时文件
    del_file(path_x4_png)
    del_file(path_x4_sr_png)

    #  如果已完成测试，直接跳过
    if os.path.exists(os.path.join(path_x4_sr_video, video)):
        continue

    # 1. 产生需要预测的png文件
    cmd_png = 'ffmpeg -i ' + path_x4_video + '/' + video + ' -vsync 0 ' + path_x4_png + '/target%4d.png -y'
    print(cmd_png)
    process_png = subprocess.Popen(cmd_png, shell=True)
    process_png.wait()

    # 2. 调用算法产生超分后的png文件
    cmd_edsr = 'python main.py --model EDSR --scale 4 --n_resblocks 16 --n_feats 128 --res_scale 0.1 --test_only --save_results --save edsrtencent_x4 --data_test Demo --pre_train ../experiment1012/edsrtencent_x4/model/model_best.pt --chop --dir_demo '+ path_x4_png
    print(cmd_edsr)
    process_edsr = subprocess.Popen(cmd_edsr, shell=True)
    process_edsr.wait()

    # 3. 编码超分后png文件为视频文件
    cmd_encoder = 'ffmpeg -i ' + path_x4_sr_png + '/target%4d_x4_SR.png  -vcodec libx265 -pix_fmt yuv422p -crf 10 ' + path_x4_sr_video + '/' + video
    print(cmd_encoder)
    process_encoder = subprocess.Popen(cmd_encoder, shell=True)
    process_encoder.wait()
