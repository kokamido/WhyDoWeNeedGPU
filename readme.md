wget https://huggingface.co/microsoft/Phi-3-mini-4k-instruct-gguf/resolve/main/Phi-3-mini-4k-instruct-fp16.gguf?download=true -O etc/Phi-3-mini-4k-instruct-fp16.gguf

SHA256: 5d99003e395775659b0dde3f941d88ff378b2837a8dc3a2ea94222ab1420fad3

docker run -i -v ./audios:/my_bench/audios -v ./scripts:/my_bench/scripts -v ./etc:/my_bench/etc -v ./profiler_outputs:/my_bench/profiler_outputs --gpus all my_bench_image:2

https://disk.yandex.ru/d/E1g8SnX0_syQ4A