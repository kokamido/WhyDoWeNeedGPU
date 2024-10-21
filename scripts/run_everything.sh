echo "Here we go!"

echo running 'python scripts/cpu_profile.py'
python scripts/cpu_profile.py 2>/dev/null 1>/dev/null

total_percents_self_cpu=$(cat profiler_outputs/cpu_forward_profiling | awk '{print $2}' | grep '\.' | tr -d % | awk '{s+=$1} END {print s}')

echo "[LOG] Sum of self_cpu% col in profiler_outputs/cpu_forward_profiling is $total_percents_self_cpu" 

echo running 'python scripts/gpu_profile.py'
python scripts/gpu_profile.py 2>/dev/null 1>/dev/null

total_percents_self_cuda=$(cat profiler_outputs/gpu_forward_profiling | sed -E 's/[ ]{2,}/\t/g' |cut -f9 | grep -oP "\d+\.\d+%" | tr -d %| awk '{s+=$1} END {print s}')
echo "[LOG] Sum of self_cuda% col in profiler_outputs/gpu_forward_profiling is $total_percents_self_cuda" 

total_percents_self_cuda_no_aten=$(cat profiler_outputs/gpu_forward_profiling | grep -v 'aten::' | sed -E 's/[ ]{2,}/\t/g' |cut -f9 | grep -oP "\d+\.\d+%" | tr -d %| awk '{s+=$1} END {print s}')
echo "[LOG] Sum of self_cuda% without aten:: col in profiler_outputs/gpu_forward_profiling is $total_percents_self_cuda_no_aten" 

echo running llama.cpp "benchmark"

bash scripts/bench_llama.sh | tee profiler_outputs/llama_profiling && python scripts/draw_llama.py
