FROM docker.io/pytorch/pytorch:2.2.2-cuda12.1-cudnn8-devel
RUN mkdir /my_bench
WORKDIR /my_bench
RUN apt update && apt install -y git
RUN git clone https://github.com/ggerganov/llama.cpp.git --branch b3821
RUN pip install Cython==3.0.11
RUN pip install matplotlib==3.9.2 nemo-toolkit[asr]==1.23.0
RUN pip install huggingface-hub==0.23.2
RUN cd llama.cpp && make GGML_CUDA=1
CMD bash scripts/run_everything.sh