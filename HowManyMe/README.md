# HowManyMe

**HowManyMe** is a lightweight Bash utility designed to take a string of words and tell you exactly how many times each one appears.

## 🚀 How It Works
The script processes your text through a multi-stage pipeline:
1. **Flattening**: It turns a horizontal line of text into a vertical list.
2. **Mirroring**: It uses `tee` to create a temporary reference file.
3. **Counting**: It loops through each word and queries the reference file for the total count.
4. **Cleanup**: It automatically removes the temporary data file.
##
  Ofc There is less Heavy and complicated ones but this helped me learn more stuff lol
like this
cat words.txt | tr -s ' ' '\n' |  sort | uniq -c | sort -nru | awk '{print $2, $1}'
---
  
## 🛠 Installation
Make the script executable on your system:
```bash
chmod +x HowManyMe.sh

## ⚙️ The Pipeline Explained
Here is a "part-by-part" breakdown of the core command:

`cat words.txt | tr ' ' '\n' | tee data.txt | xargs -I {} sh -c 'echo -n "{} "; grep -c "^{}$" data.txt'`

## 🛠️ The Logic (Step-by-Step)

The script uses a "pipeline" to move data from your file to your screen. Here is what each part does:


| Part | Role | Simple Explanation |
| :--- | :--- | :--- |
| **`cat words.txt`** | The Source | Reads your file and starts the stream of data. |
| **`tr ' ' '\n'`** | The Flattener | Swaps spaces for newlines so every word gets its own line. |
| **`tee data.txt`** | The Mirror | Saves a copy to `data.txt` so we have a "master list" to search against. |
| **`xargs -I {}`** | The Looper | Grabs one word at a time and places it into the `{}` placeholder. |
| **`sh -c '...'`** | **The Manager** | **Crucial:** Allows `xargs` to run multiple commands (`echo` + `grep`) as one single task. |
| **`echo -n "{} "`** | The Label | Prints the word. The `-n` keeps the count on the same line. |
| **`grep -c`** | The Counter | Scans `data.txt` and returns the total number of matches. |
| **`"^{}$"`** | The Lock | `^` (start) and `$` (end) ensure we match the **exact** word only. |
| **`rm data.txt`** | The Cleanup | Deletes the temporary reference file once the job is finished. |

---
