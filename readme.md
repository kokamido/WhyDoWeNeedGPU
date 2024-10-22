# Код к докладу о том, зачем датасатанистам GPU

Чтобы сделать те измерения, на которые были ссылки в докладе, нужно:

1. Склонировать репозиторий
2. Собрать образ из докерфайла, позвав в корне репозитория `docker build . -t my_bench_image:2`. Собранный образ есть [тут](https://disk.yandex.ru/d/E1g8SnX0_syQ4A) и его можно подгрузить через `docker image load`, но возможны нюансы: один из шагов сборки - это билд [llama.cpp](https://github.com/ggerganov/llama.cpp) из сырцов, а там повсюду `-march=native`, т.е. переносимость под вопросом
3. Скачать модель, которую будем запускать с помощью llama.cpp, положить её в директорию `etc` в корне репозитория: `wget https://huggingface.co/microsoft/Phi-3-mini-4k-instruct-gguf/resolve/main/Phi-3-mini-4k-instruct-fp16.gguf?download=true -O etc/Phi-3-mini-4k-instruct-fp16.gguf`
4. Запустить как
`docker run -i -v ./audios:/my_bench/audios -v ./scripts:/my_bench/scripts -v ./etc:/my_bench/etc -v ./profiler_outputs:/my_bench/profiler_outputs --gpus all my_bench_image:2`

В итоге файлы в папке profiler_outputs перетрутся результатами работы кода на вашей машине.

Точка входа - файл scripts/run_everything.sh

Аудио в папке audios взяты из открытого датасета речи [sova](https://github.com/sovaai/sova-dataset)

Оригинальные измерения сделаны в такой конфигурации:

```
PyTorch version: 2.4.1+cu121
Is debug build: False
CUDA used to build PyTorch: 12.1
OS: Ubuntu 24.04.1 LTS (x86_64)
GCC version: (Ubuntu 13.2.0-23ubuntu4) 13.2.0
Libc version: glibc-2.39
Python version: 3.12.3 (main, Sep 11 2024, 14:17:37) [GCC 13.2.0] (64-bit runtime)
Python platform: Linux-6.8.0-45-generic-x86_64-with-glibc2.39
Is CUDA available: True
CUDA_MODULE_LOADING set to: LAZY
GPU models and configuration: GPU 0: NVIDIA GeForce RTX 3090 Ti
Nvidia driver version: 535.183.01
Is XNNPACK available: True
CPU:
    Model name:  AMD Ryzen 9 5950X 16-Core Processor
```
