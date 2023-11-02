CUDA_VISIBLE_DEVICES=0 python inference_unit.py -f resources/filelists/ljspeech_unit/test.txt \
  -c logs/new_exp/grad_3184.pt -t 20 -d out/grad_3184