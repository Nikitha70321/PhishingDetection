# Phishing Detection System Through Hybrid Machine Learning Based on URL

**Malla Reddy University**  
*Department of Computer Science & Engineering*  
*R23 B.TECH CSE IV YEAR I SEM :: AC Year: 2026-2027*  
*MAJOR PROJECT PHASE-1*

### Student Team
| S.No | Roll No | Student Name |
| :---: | :---: | :---: |
| 1 | **2311CS010167** | **D.Nikitha** |
| 2 | **2311CS010201** | **G.Venkata Sai** |
| 3 | **2311CS010459** | **M.Abhi Vardhan** |
| 4 | **2311CS010232** | **G.Vamshi** |

**Project Guide:** Mrs. S. Sagarika

---

## 🎯 Architecture Overview

This project implements a full-stack, enterprise-grade phishing URL detection platform utilizing a **Hybrid approach**:
1. **Interactive Frontend (React / HTML5 / Tailwind)**:
   - Real-time single and batch URL analysis.
   - Dynamic visual risk gauge (0 to 100%).
   - Tri-state classification badges: **SAFE (Legitimate)**, **SUSPICIOUS (Elevated Risk)**, **MALICIOUS (Phishing Attack)**.
   - Secondary Heuristic Checklist showing triggered evasion tactics with severity tags.
   - LLM Threat Intelligence & Security Advisory summary.
   - SQLite-backed history log and statistics dashboard.
   - False-positive / User feedback reporting modal.

2. **Intermediary Server (Node.js + Express - Port 5000)**:
   - High-throughput API gateway routing requests between client and ML microservice.
   - Fast-path institutional domain whitelist cache (e.g. Malla Reddy University, Google, GitHub).
   - Embedded resilience engine providing fallback heuristics if the ML service is offline.
   - REST API: `/api/scan`, `/api/batch-scan`, `/api/history`, `/api/stats`, `/api/report`, `/api/health`.

3. **Database Connection (SQLite - `phishing_scans.db`)**:
   - Zero-configuration, ACID-compliant relational persistence via Node.js native `DatabaseSync`.
   - Persists all scan evaluations, extracted features, triggered rules, threat timestamps, and user feedback reports.

4. **Machine Learning Service (Python Flask - Port 5001)**:
   - **Protocol Normalization Layer**: Standardizes URLs and equalizes feature weights between HTTP and HTTPS protocols to eliminate false security bias.
   - **Random Forest Classifier**: Trained on 24 lexical, structural, and character-entropy URL features.
   - **Secondary Heuristic Rule Engine**: Detects `@` character obfuscation, direct IP host routing, hex/URL encoding evasion, excessive subdomains, brand spoofing, suspicious TLDs, and keyword stacking.
   - **LLM Threat Advisor**: Generates natural language threat summaries and protective recommendations.

---

## 🚀 How to Run in VS Code

### 1. Open Project in VS Code
Open VS Code, press `Ctrl + O` (or `File -> Open Folder...`), and select:
```text
C:\Users\NIKITHA\.gemini\antigravity\scratch\phishing-detection-system
```

### 2. Method A: One-Click Launch (Easiest)
Simply double-click the `run.bat` file in the project root, or in the VS Code terminal run:
```powershell
.\run.bat
```
This automatically launches both services and opens `http://localhost:5000` in your default browser!

---

### 3. Method B: Running via Two VS Code Terminals

#### Terminal 1: Python Machine Learning Service
1. Open a new terminal in VS Code (`Ctrl + ~` or `Terminal -> New Terminal`).
2. Run the following commands:
```powershell
cd ml-service
python app.py
```
*You will see:* `[*] Starting Python ML Phishing Detection Service on port 5001...`

#### Terminal 2: Node.js Express Server
1. Open a second terminal (`+` icon in terminal panel).
2. Run the following commands:
```powershell
cd backend
node server.js
```
*You will see:*  
`[+] Phishing Detection Express Intermediary Server listening on port 5000`  
`[+] Database: Connected (phishing_scans.db)`

### 4. Open in Browser
Open your browser and navigate to:
```text
http://localhost:5000
```
*(Optionally, if you want to develop the React Vite frontend directly, open a 3rd terminal, run `cd frontend`, and run `npm run dev` to access on `http://localhost:3000`).*
