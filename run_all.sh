#!/bin/bash
source venv/bin/activate

echo "====================================="
echo "1. Sinh answers_50q.json"
echo "====================================="
python setup_answers.py

echo "====================================="
echo "2. Chạy Phase A: RAGAS Eval"
echo "====================================="
python src/phase_a_ragas.py

echo "====================================="
echo "3. Chạy Phase B: LLM-as-Judge"
echo "====================================="
python src/phase_b_judge.py

echo "====================================="
echo "4. Chạy Phase C: Guardrails"
echo "====================================="
python src/phase_c_guard.py

echo "====================================="
echo "5. Chạy unit tests"
echo "====================================="
pytest tests/ -v

echo "====================================="
echo "6. Kiểm tra lại toàn bộ bài bằng check_lab.py"
echo "====================================="
python check_lab.py
