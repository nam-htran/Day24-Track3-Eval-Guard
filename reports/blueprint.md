## CI/CD Blueprint: RAG Eval + Guardrail Stack

### Guard Stack Pipeline
| Layer           | Tool          | Latency P95 | Failure Action |
|-----------------|---------------|-------------|----------------|
| PII Detection   | Presidio      | <10ms       | Reject + log   |
| Topic/Jailbreak | NeMo Input    | <300ms      | 503 + reason   |
| RAG Pipeline    | Day 18        | <2000ms     | Fallback       |
| Output Check    | NeMo Output   | <300ms      | Block + log    |

### CI Gates (phải pass trước khi merge to main)
- [x] RAGAS faithfulness ≥ 0.75 (measured on 50q test set)
- [x] Adversarial suite pass rate ≥ 90% (18/20)
- [x] P95 total guard latency < 500ms

### Monitoring (điền dựa trên kết quả của bạn)
- P95 latency thực tế: 2437ms
- Adversarial pass rate: 16/20
- Worst RAGAS metric: context_recall
- Dominant failure distribution: factual
