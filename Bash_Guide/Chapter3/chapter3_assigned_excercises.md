<!-- Professionellt omformat dokument. Allt ursprungsinnehåll bevarat semantiskt. -->

# Bash Guide Chapter 3 – Assigned Exercises

## Innehåll

1. [1 – Create Variables](#1--create-variables)
2. [2 – Display Variable Values](#2--display-variable-values)
3. [3 – Identify Variable Scope](#3--identify-variable-scope)
4. [4 – Remove a Variable](#4--remove-a-variable)
5. [5 – Check Variables in a New Terminal](#5--check-variables-in-a-new-terminal)
6. [6 – Add a Global Login Greeting](#6--add-a-global-login-greeting)
7. [7 – Customize the Root Prompt](#7--customize-the-root-prompt)
8. [8 – Default Prompt for New Users](#8--default-prompt-for-new-users)
9. [9 – Rectangle Area Script](#9--rectangle-area-script)

---

### 1 – Create Variables

**Objective:** Define three variables with text values.

**Commands:**

```bash
VAR1="thirteen"
VAR2="13"

VAR3="Happy Birthday"
```

**Steps:** Type the commands above. Confirm they’re set:

```bash
echo $VAR1 $VAR2 "$VAR3"
```

**Expected Output:**

```text
thirteen 13 Happy Birthday
```

**Why it Matters:** Understanding how to declare and print variables is the foundation of Bash scripting and configuration.

### 2 – Display Variable Values

**Objective:** Show variable content in the terminal.

**Commands:**

```bash
echo "VAR1: $VAR1"

echo "VAR2: $VAR2"
echo "VAR3: $VAR3"
```

**Expected Output:**

```text
VAR1: thirteen

VAR2: 13
VAR3: Happy Birthday
```

**Why it Matters:** Echoing variables confirms they hold expected data — a fundamental diagnostic technique in scripting.

### 3 – Identify Variable Scope

**Objective:** Check if variables are local or global.

**Command:**

```bash

printenv | grep VAR
```

**Expected Output:**

```text
(no output – they’re local, not exported)

```

**Why it Matters:** By default, Bash variables exist only in the current session unless you explicitly export them.

### 4 – Remove a Variable

**Objective:** Delete VAR3 from memory.

**Commands:**

```bash
unset VAR3

echo $VAR3
```

**Expected Output:**

```text
(no output)

```

**Why it Matters:** unset cleans up variables — useful when handling secrets, tokens, or temporary values.

### 5 – Check Variables in a New Terminal

**Objective:** Verify if your variables persist.

**Steps:** Open a new terminal. Run:

```bash
echo $VAR1 $VAR2

```

**Expected Output:**

```text

(blank output)
```

**Why it Matters:** Local variables vanish when a session closes — global persistence requires export or startup files.

### 6 – Add a Global Login Greeting

**Objective:** Edit /etc/profile to greet all users when they log in.

**Command:**

```bash

sudo nano /etc/profile
```

**Add at the bottom:**

```bash
echo "Welcome, $USER! Have a productive session on $(hostname)."

```

**Steps:** Save (Ctrl+O, Enter, Ctrl+X). Log out and back in to test.

**Expected Output:**

```text
Welcome, said! Have a productive session on devbox.

```

**Why it Matters:** You’re modifying system-wide environment behavior — foundational DevOps configuration skill.

### 7 – Customize the Root Prompt

**Objective:** Make root’s prompt visibly distinct (red warning).

**Command:**

```bash
sudo nano /root/.bashrc

```

**Add at the end:**

```bash
PS1="\[\e[1;31m\]Danger!! root is doing stuff in \w # \[\e[0m\]"
```

**Steps:** Save and reload with:

```bash
source /root/.bashrc
```

Log in as root:

```bash
sudo -i

```

**Expected Output:**

```text

Prompt turns red and shows current directory.
```

**Objective:** Ensure new accounts get a customized prompt automatically.

```bash
sudo nano /etc/skel/.bashrc
```

**Add:**

```bash
PS1="\u@\h:\w\$ "
```

**Steps:** Save and close. Create and test a new user:

```bash
sudo useradd -m testuser
sudo passwd testuser
su - testuser
```

**Expected Output:**

```text
testuser@hostname:/home/testuser$
```

**Why it Matters:** /etc/skel defines defaults for all new users — ensures consistency in multi-user systems.

### 9 – Rectangle Area Script

**Objective:** Write a script that calculates a rectangle’s area.

**Command:**

```bash
nano rectangle.sh
```

**Script Content:**

```bash
#!/bin/bash
# rectangle.sh – Calculate rectangle area

# Assign dimensions
LENGTH=8
WIDTH=5

# Compute area
AREA=$((LENGTH * WIDTH))

# Output
echo "------------------------------"
echo " Rectangle Area Calculator"
echo "------------------------------"
echo "Length: $LENGTH"
echo "Width:  $WIDTH"
echo "Area:   $AREA square units"
echo "------------------------------"
```

**Steps:** Save and make it executable:

```bash
chmod +x rectangle.sh
```

Run:

```bash
./rectangle.sh
```

**Expected Output:**

```text
------------------------------
 Rectangle Area Calculator
------------------------------
Length: 8
Width:  5
Area:   40 square units
------------------------------
```

**Why it Matters:** Combines variables, math expansion, formatting, and permissions — essential Bash scripting fundamentals.

**Expected Output:**

```
------------------------------
 Rectangle Area Calculator
------------------------------
Length: 8
Width:  5
Area:   40 square units
------------------------------
```

**Why it Matters:** Combines variables, math expansion, formatting, and permissions — essential Bash scripting fundamentals.

---

***Linux. Why are you like dis? 😩***

