# HowManyMe

**HowManyMe** is a lightweight Bash utility designed to take a string of words and tell you exactly how many times each one appears.

## 🚀 How It Works
The script processes your text through a multi-stage pipeline:
1. **Flattening**: It turns a horizontal line of text into a vertical list.
2. **Mirroring**: It uses `tee` to create a temporary reference file.
3. **Counting**: It loops through each word and queries the reference file for the total count.
4. **Cleanup**: It automatically removes the temporary data file.

## 🛠 Installation
Make the script executable on your system:
```bash
chmod +x HowManyMe.sh




## ⚙️ The Pipeline Explained
Here is a "part-by-part" breakdown of the core command:

`cat words.txt | tr ' ' '\n' | tee data.txt | xargs -I {} sh -c 'echo -n "{} "; grep -c "^{}$" data.txt'`

Ofc There is less Heavy and complicated ones but this helped me learn more stuff lol 
---

## 🛠️ The Logic (Step-by-Step)

The script uses a "pipeline" to move data from your file to your screen. Here is what each part does:

1. **`cat words.txt`**  
   Reads your file and starts the flow of text.
   
2. **`tr ' ' '\n'`**  
   The **Flattener**. It turns a horizontal line of text into a vertical column of words.

3. **`tee data.txt`**  
   The **Splitter**. It saves a copy of the list to `data.txt` so the script can use it as a reference for counting.

4. **`xargs -I {}`**  
   The **Looper**. It grabs each word one-by-one and performs the next two steps on it.

5. **`echo -n "{} "`**  
   The **Label**. It prints the word on your screen but stays on the same line for the count.

6. **`grep -c "^{}$" data.txt`**  
   The **Counter**. It looks into the `data.txt` file and counts exactly how many times that specific word appears.

7. **`rm data.txt`**  
   The **Cleanup**. It deletes the temporary reference file once the work is done.

---