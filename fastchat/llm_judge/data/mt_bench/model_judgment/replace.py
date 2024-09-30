path = "/cephfs/xukangping/code/FastChat/fastchat/llm_judge/data/mt_bench/model_judgment/gpt-4-0613_single.jsonl"

# try read line by line
import json
with open(path, "r") as f:
    for i, line in enumerate(f):
        print(i)
        print(json.loads(line))
