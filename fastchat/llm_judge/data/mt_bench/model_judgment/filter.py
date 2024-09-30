old_path = "gpt-4-0613_single_old.jsonl"
new_path = "gpt-4-0613_single.jsonl"


def filter(point):
    if point["model"] == "bt_8b_iter1" or point["model"] == "bt_8b_iter2" or point["model"] == "bt_8b_iter3":
        return True
    return False


import json
def main():
    with open(old_path, "r") as f:
        with open(new_path, "w") as f2:
            for line in f:
                point = json.loads(line)
                if filter(point):
                    f2.write(line)

    
if __name__ == "__main__":
    main()