# Infrastructure Automation Simulator (`infra-automation`)

## Overview & Objectives
This project simulates an automated infrastructure provisioning and configuration workflow. It allows users to define virtual machine specifications interactively, validates and stores the configurations in JSON format, automates service installation (Nginx) using a Bash script, and maintains full lifecycle logging for auditing and troubleshooting.

### Key Features
- **Modular Design:** Separates data modeling (`Machine` class) from orchestration logic.
- **Configuration Persistence:** Exports machine specifications into structured JSON (`configs/instances.json`).
- **Automated Service Setup:** Integrates Python (`subprocess`) with an idempotent Bash script (`scripts/setup_nginx.sh`) to install Nginx.
- **Unified Logging & Error Handling:** Captures provisioning events, successes, and errors from both Python and Bash into `logs/provisioning.log`.

---

## Project Structure
```text
infra_automation/
├── infra_simulator.py      # Main execution script (CLI input, JSON export, Bash trigger)
├── src/
│   └── machine.py          # Machine class definition and logging setup
├── scripts/
│   └── setup_nginx.sh      # Idempotent Bash script for Nginx installation
├── configs/
│   └── instances.json      # Generated machine configurations
├── logs/
│   └── provisioning.log    # Execution logs from Python and Bash
└── README.md               # Project documentation
```

---

## Setup & Execution Instructions

### Prerequisites
- Python 3.8+
- Bash shell (Linux / macOS)

### Running the Simulator
1. Clone the repository and navigate into the project directory:
   ```bash
   git clone https://github.com
   cd infra_automation
   ```
2. Grant execution permissions to the Bash script:
   ```bash
   chmod +x scripts/setup_nginx.sh
   ```
3. Run the main simulator script:
   ```bash
   python3 infra_simulator.py
   ```
4. Follow the interactive prompts to add machines (type `f` to finish).

---

## Example Expected Output

### Terminal Interaction
```text
enter the machine's name (write f to finish!): web-server-01
enter the machine's os: Ubuntu
enter the machine's cpu: 4
enter the machine's RAM: 8
enter the machine's name (write f to finish!): f
2026-11-19 23:25:10 - BASH - INFO - Starting Nginx installation check...
2026-11-19 23:25:10 - BASH - INFO - Nginx is already installed. Skipping installation.
The installation of nginx is completed successfully!
```

### Generated `configs/instances.json`
```json
[
    {
        "name": "web-server-01",
        "os": "Ubuntu",
        "cpu": "4",
        "ram": "8"
    }
]
```

### Generated `logs/provisioning.log`
```text
2026-11-19 23:25:01,120 - INFO - === Provisioning started ===
2026-11-19 23:25:08,450 - INFO - Created machine: web-server-01 (OS: Ubuntu, CPU: 4, RAM: 8)
2026-11-19 23:25:08,452 - INFO - Successfully saved 1 machine(s) to configs/instances.json.
2026-11-19 23:25:08,453 - INFO - Executing service installation Bash script...
2026-11-19 23:25:10 - BASH - INFO - Starting Nginx installation check...
2026-11-19 23:25:10 - BASH - INFO - Nginx is already installed. Skipping installation.
2026-11-19 23:25:10,210 - INFO - Service installation completed successfully.
2026-11-19 23:25:10,211 - INFO - === Provisioning finished ===
```
