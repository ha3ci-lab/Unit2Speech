# Unit2Speech

The purpose is to focus on research on converting from Unit to speech. Unit can be obtained from different modalities such as images, signals, and speech.

## Prepare data
Follow [this link](https://github.com/facebookresearch/fairseq/tree/main/examples/textless_nlp/gslm/speech2unit) to convert speech to unit

Here, I only use the pre-trained of HuBERT Base + KM100

## Training
We select Grad-TTS and VITS (not Fastspeech2, Tacotron2) because these frameworks don't need pre-processing data and are non-autoregressive.

Details of training the models are described in each sub-folder.

