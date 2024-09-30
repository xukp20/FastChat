set -e
set -x

export OPENAI_API_BASE="http://10.220.5.153:31417/api/requestazuremessage"
export OPENAI_API_KEY="api-1700706820345-gSAqkkmeNL"

MODEL_IDS=(
    # "gp_2b_iter1"
    # "gp_2b_tau01_iter1"
    # "gp_2b_iter2"
    # "gp_2b_tau01_iter2"
    # "bt_2b_iter2"
    # "gp_2b_iter3"
    # "gp_2b_tau01_iter3"
    # "bt_2b_iter3"
    # "gp_8b_tau01_iter1"
    # "bt_8b_iter1"
    # "gp_8b_tau01_iter2"
    # "bt_8b_iter2"
    # "gp_8b_tau01_iter3"
    # "bt_8b_iter3"
    # "gp_8b_iter1_2e-7"
    # "bt_8b_iter1_2e-7"
    # "gp_8b_iter2_2e-7"
    # "bt_8b_iter2_2e-7"
    # "gp_8b_iter3_2e-7"
    # "bt_8b_iter3_2e-7"

    # "gp_2b_iter1"
    # "gp_2b_score_iter1"
    # "gp_2b_iter2"
    # "gp_2b_score_iter2"
    # "gp_2b_iter3"
    # "gp_2b_score_iter3"

    # "gp_8b_iter1"
    # "gp_8b_iter2"
    # "gp_8b_iter3"
    # "gp_8b_score_iter1"
    # "gp_8b_score_iter2"
    # "gp_8b_score_iter3"

    # "bt_2b_iter1"
    # "bt_2b_iter2"
    # "bt_2b_iter3"
    # "bt_2b_score_iter1"
    # "bt_2b_score_iter2"
    # "bt_2b_score_iter3"

    # "bt_8b_score_iter1"
    # "bt_8b_score_iter2"
    # "bt_8b_score_iter3"
)

# BASE_PATH="/cephfs/xukangping/code"
MODEL_PATHS=(
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_gp_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_gp_2b_tau01-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_gp_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_gp_2b_tau01-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_bt_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_gp_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_gp_2b_tau01-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_bt_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_gp_8b_tau01-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_bt_8b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_gp_8b_tau01-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_bt_8b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_gp_8b_tau01-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_bt_8b-table"
    # SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_gp_8b_2e-7-table
    # SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_bt_8b_2e-7-table
    # SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_gp_8b_2e-7-table
    # SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_bt_8b_2e-7-table
    # SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_gp_8b_2e-7-table
    # SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_bt_8b_2e-7-table

    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_gp_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter1_gp_2b-table-0.001"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_gp_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter2_gp_2b-table-0.001"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_gp_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter3_gp_2b-table-0.001"

    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_gp_8b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_gp_8b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_gp_8b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter1_gp_8b-table-0.002"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter2_gp_8b-table-0.002"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter3_gp_8b-table-0.002"

    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter1_bt_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter2_bt_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-Iter3_bt_2b-table"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter1_bt_2b-table-0.001"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter2_bt_2b-table-0.001"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter3_bt_2b-table-0.001"

    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter1_bt_8b-table-0.002"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter2_bt_8b-table-0.002"
    # "SPPO/checkpoints/Llama-3-8B-Instruct-SPPO-score-Iter3_bt_8b-table-0.002"
)

# python gen_model_answer.py --model-path lmsys/vicuna-7b-v1.5 --model-id vicuna-7b-v1.5
# python gen_judgment.py --model-list bt_2b --parallel 4 --judge-model "gpt-4-0613"

for i in $(seq 0 $((${#MODEL_IDS[@]} - 1)));
do
    python gen_model_answer.py --model-path $BASE_PATH/${MODEL_PATHS[$i]} --model-id ${MODEL_IDS[$i]} --dtype float16
    python gen_judgment.py --model-list ${MODEL_IDS[$i]} --parallel 4 --judge-model "gpt-4-0613"
done

MODEL_LIST=(
    "bt_8b_iter1"
    "bt_8b_iter2"
    "bt_8b_iter3"
    "gp_2b_iter1"
    "gp_2b_iter2"
    "gp_2b_iter3"
    "gp_2b_score_iter1"
    "gp_2b_score_iter2"
    "gp_2b_score_iter3"

    "gp_8b_iter1"
    "gp_8b_iter2"
    "gp_8b_iter3"
    "gp_8b_score_iter1"
    "gp_8b_score_iter2"
    "gp_8b_score_iter3"

    "bt_2b_iter1"
    "bt_2b_iter2"
    "bt_2b_iter3"
    "bt_2b_score_iter1"
    "bt_2b_score_iter2"
    "bt_2b_score_iter3"

    "bt_8b_score_iter1"
    "bt_8b_score_iter2"
    "bt_8b_score_iter3"

    "base"
)

# concat by " " 
MODEL_LIST_STR=$(IFS=" "; echo "${MODEL_LIST[*]}")

python show_result.py --model-list $MODEL_LIST_STR --judge-model "gpt-4-0613"