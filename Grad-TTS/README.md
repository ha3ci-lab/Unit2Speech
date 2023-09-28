<p align="center">
    <img src="resources/reverse-diffusion.gif" alt="drawing" width="500"/>
</p>


# Grad-TTS

Official implementation of the Grad-TTS model based on Diffusion Probabilistic Modelling. For all details check out our paper accepted to ICML 2021 via [this](https://arxiv.org/abs/2105.06337) link.

**Authors**: Vadim Popov\*, Ivan Vovk\*, Vladimir Gogoryan, Tasnima Sadekova, Mikhail Kudinov.

<sup>\*Equal contribution.</sup>

## Abstract

Recently, denoising diffusion probabilistic models and generative score matching have shown high potential in modelling complex data distributions while stochastic calculus has provided a unified point of view on these techniques allowing for flexible inference schemes. In this paper we introduce Grad-TTS, a novel text-to-speech model with score-based decoder producing mel-spectrograms by gradually transforming noise predicted by encoder and aligned with text input by means of Monotonic Alignment Search. The framework of stochastic differential equations helps us to generalize conventional diffusion probabilistic models to the case of reconstructing data from noise with different parameters and allows to make this reconstruction flexible by explicitly controlling trade-off between sound quality and inference speed. Subjective human evaluation shows that Grad-TTS is competitive with state-of-the-art text-to-speech approaches in terms of Mean Opinion Score.

## Installation

Firstly, install all Python package requirements:

```bash
pip install -r requirements.txt
```

Secondly, build `monotonic_align` code (Cython):

```bash
cd model/monotonic_align; python setup.py build_ext --inplace; cd ../..
```

**Note**: code is tested on Python==3.6.9.

## Inference

1. You can download Grad-TTS and HiFi-GAN checkpoints trained on LJSpeech* and Libri-TTS datasets (22kHz) from [here](https://drive.google.com/drive/folders/1grsfccJbmEuSBGQExQKr3cVxNV0xEOZ7?usp=sharing).

Run script `inference.py` by providing path to the text file, path to the Grad-TTS checkpoint, number of iterations to be used for reverse diffusion (default: 10):
    ```bash
    python inference.py -f <your-text-file> -c <grad-tts-checkpoint> -t <number-of-timesteps>
    ```
2Check out folder called `out` for generated audios.

## Training

1. Make filelists of your audio data like ones included into `resources/filelists` folder.
2. Set experiment configuration in `params.py` file.
3. Specify your GPU device and run training script:
    ```bash
    export CUDA_VISIBLE_DEVICES=YOUR_GPU_ID
    python train.py  # if single speaker
    ```
4. To track your training process run tensorboard server on any available port:
    ```bash
    tensorboard --logdir=YOUR_LOG_DIR --port=8888
    ```
    During training all logging information and checkpoints are stored in `YOUR_LOG_DIR`, which you can specify in `params.py` before training.

## References

* HiFi-GAN model is used as vocoder, official github repository: [link](https://github.com/jik876/hifi-gan).
* Monotonic Alignment Search algorithm is used for unsupervised duration modelling, official github repository: [link](https://github.com/jaywalnut310/glow-tts).
* Phonemization utilizes CMUdict, official github repository: [link](https://github.com/cmusphinx/cmudict).
