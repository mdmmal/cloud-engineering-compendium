# Engineering Documentation: Bash Automation for Cloud & DevOps

This technical documentation outlines my progress in mastering Bash scripting fundamentals for Cloud Engineering and DevOps. These notes serve as a log of implemented automation techniques, system validation workflows, and troubleshooting strategies encountered while developing infrastructure utility scripts.

---

## Technical Skills Progress
* **Script Initialization:** Standardizing `#!/bin/bash` shebangs and managing file permissions with `chmod +x` to transition from static text files to executable system tools.
* **Dynamic Contextualization:** Capturing runtime data through command substitution `$( )` and utilizing environment variables such as `$PWD`, `$USER`, and `$HOSTNAME`.
* **Resource Calculation:** Implementing integer-based arithmetic expansion `$(( ))` for cloud resource estimation and capacity planning.
* **Environment Lifecycle Management:** Controlling variable visibility via `export` for process inheritance and `unset` for secure cleanup in CI/CD contexts.

---

## Lab 1: System Context and Deployment Readiness
**Scenario:** Establishing an automated check to verify system identity prior to deployment. This ensures that metadata is correctly attributed to the environment and user.

### Prompt 1
Create an executable utility `deploy_check.sh` that dynamically outputs the system hostname, current user, and local timestamp.

**Desired Output Format:**
\`\`\`text
=== Deployment Check ===
Host: Jamals-MacBook-Air.local
User: mal
Date: Mon Apr 27 19:45:58 CDT 2026
========================
\`\`\`

* **Technical Note:** I encountered an initial "bad interpreter" error caused by a relative path in the shebang (`#!bin/bash`). I resolved this by utilizing the absolute path `#!/bin/bash` to ensure the kernel correctly identifies the binary location.

### Prompt 2
Extend the script to display the current working directory and the active shell path using system-level environment variables rather than command execution.

* **Technical Note:** Differentiated between `$PATH` (the search directory list) and `$PWD` (the current working directory) to resolve verbosity issues in script output.

---

## Lab 2: Cloud Resource Calculations
**Scenario:** Developing a resource calculator to perform pre-provisioning estimates for CPU and RAM allocations.

### Prompt 1
Create `resource_calc.sh` to define hardware variables (CPU, RAM, Hourly Rate) and calculate `MONTHLY_HOURS` and `MONTHLY_COST` using Bash-native arithmetic.

* **Technical Note:** Practiced the `$(( ))` syntax. Recognized that Bash is limited to integer arithmetic, which is suitable for whole-unit resource calculations but requires scaling (e.g., calculating in cents) for financial precision.

### Prompt 2
Implement variable exportation to ensure that the calculated `MONTHLY_COST` is accessible to downstream deployment processes.

* **Technical Note:** Used the `export` command to move variables from local shell scope to environment scope, a critical step for modular pipeline automation.

---

## Lab 3: CI/CD Pipeline Pre-flight Validation
**Scenario:** Simulating a validation phase where temporary identifiers (Build IDs) are generated and sensitive environment variables are purged after use.

### Prompt
Create `preflight.sh` to generate a `BUILD_ID` based on a formatted date string (`YYYYMMDD-HHMMSS`), display the environment state, and then perform a secure cleanup.

* **Technical Note:** Resolved a syntax error regarding "unexpected EOF" by auditing double-quote symmetry in the `echo` statements.
* **Technical Note:** Implemented the `unset` command to clear the `DEPLOY_ENV` variable from the shell memory, adhering to the principle of least privilege in automated environments.

---

## Troubleshooting & Debugging Summary
| Issue | Root Cause | Resolution |
| :--- | :--- | :--- |
| **Permission Denied** | Execution bit not set on the script. | `chmod +x <filename>` |
| **Bad Interpreter** | Missing leading slash in shebang. | Changed `#!bin/bash` to `#!/bin/bash`. |
| **Syntax Error: Unexpected EOF** | Unclosed double quotes in an \`echo\` string. | Audited quote pairs in VS Code to ensure symmetry. |
| **Command Not Found: PATH** | Calling variable name without \`$\` prefix. | Corrected variable calls to \`\$PATH\` or \`\$PWD\`. |
